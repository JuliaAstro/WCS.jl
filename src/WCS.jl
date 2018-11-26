__precompile__()

module WCS

export WCSTransform,
       pix_to_world, pix_to_world!,
       world_to_pix, world_to_pix!

import Base: convert, copy, deepcopy, getproperty, show, setproperty!, propertynames

using Base.Threads
const wcs_lock = SpinLock()

include(joinpath(@__DIR__, "..", "deps", "deps.jl"))

# -----------------------------------------------------------------------------
# constants defined in WCSLIB's wcshdr.h

# 'relax' flags for `from_header()`. See
# http://docs.astropy.org/en/stable/wcs/relax.html
# for descriptions.
const HDR_NONE     = 0x00000000
const HDR_ALL      = 0x000FFFFF
const HDR_REJECT   = 0x10000000
const HDR_STRICT   = 0x20000000

const HDR_CROTAia  = 0x00000001
const HDR_EPOCHa   = 0x00000002
const HDR_VELREFa  = 0x00000004
const HDR_CD00i00j = 0x00000008
const HDR_PC00i00j = 0x00000010
const HDR_PROJPn   = 0x00000020
const HDR_CD0i_0ja = 0x00000040
const HDR_PC0i_0ja = 0x00000080
const HDR_PV0i_0ma = 0x00000100
const HDR_PS0i_0ma = 0x00000200
const HDR_RADECSYS = 0x00000400
const HDR_VSOURCE  = 0x00000800
const HDR_DOBSn    = 0x00001000
const HDR_LONGKEY  = 0x00002000
const HDR_CNAMn    = 0x00004000
const HDR_AUXIMG   = 0x00008000
const HDR_ALLIMG   = 0x00010000

const HDR_IMGHEAD  = 0x00100000
const HDR_BIMGARR  = 0x00200000
const HDR_PIXLIST  = 0x00400000

# Constants defined in wcsmath.h
const UNDEFINED    = 987654321.0e99

# -----------------------------------------------------------------------------
# Utilities

function unsafe_store_vec!(p::Ptr{T}, v::AbstractVector{T}) where {T}
    for i = 1:length(v)
        unsafe_store!(p, v[i], i)
    end
end

# convert a string to a tuple of bytes
function convert_string(::Type{NTuple{N,UInt8}}, s::String) where {N}
    @assert length(s) < N
    @assert isascii(s)
    v = zeros(UInt8, N)  # intermediate array that we can fill
    copyto!(v, codeunits(s))
    (v...,)
end

# load an String from a tuple of bytes, truncating at first NULL
function convert_string(::Type{String}, v::NTuple{N, UInt8}) where {N}
    len = N

    # reduce length if we find a null
    i = 1
    for i=1:N
        if v[i] == 0x00
            len = i-1
            break
        end
    end
    s = Array{UInt8}(undef, len)
    copyto!(s, 1, v, 1, len)
    return String(s)  # wraps the array `s`
end

# load a String from a pointer, truncating at first NULL or maxlen
function convert_string(::Type{String}, ptr::Ptr{UInt8}, maxlen::Int)
    len = maxlen

    # reduce length if we find a null
    i = 1
    for i=1:maxlen
        if unsafe_load(ptr, i) == 0x00
            len = i-1
            break
        end
    end
    return unsafe_string(ptr, len)
end

macro check_type(k, v, t)
    :(typeof($(esc(v))) <: $t || error($(esc(k))," must have type ",$t))
end

macro check_prop(k, prop, v, op, n)
    en = esc(n)
    :(($op)($prop($(esc(v))), $en) ||
      error($(esc(k))," must have ",$prop," ",$op," ",$en))
end

macro same_size(a, b)
    :(size($(esc(a))) == size($(esc(b))) ||
      error($(string(a))," must have the same dimensions as ",$(string(b))))
end

# -----------------------------------------------------------------------------
# error messaging

function get_error_message(i::Cint)
    msgptrs = cglobal((:wcs_errmsg, libwcs), Ptr{UInt8})
    msgptr = unsafe_load(msgptrs, i+1)
    unsafe_string(msgptr)
end

function assert_ok(i::Cint)
    # Negative values aren't usually an error
    if i > 0
        error(get_error_message(i))
    end
end

function wcslib_version()
    vers = Array{Cint}(undef, 3)
    ccall((:wcslib_version, libwcs), Ptr{UInt8}, (Ptr{Cint},), vers)
    return VersionNumber(vers[1], vers[2], vers[3])
end

# -----------------------------------------------------------------------------
# WCSTransform

# mirror of `struct pvcard`
const PVCard = Tuple{Cint, Cint, Cdouble}  # i, m, value entries

# mirror of `struct pscard`
const PSCard = Tuple{Cint, Cint, NTuple{72, UInt8}}  # i, m, value entries

# mirror of `struct wcserr`
struct WCSErr
    status::Cint
    line_no::Cint
    _function::Ptr{UInt8}
    file::Ptr{UInt8}
    msg::NTuple{160, UInt8}
end

struct linprm
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    dispre::Ptr{Cvoid}  # Ptr{disprm}
    disseq::Ptr{Cvoid}  # Ptr{disprm}
    piximg::Ptr{Cdouble}
    imgpix::Ptr{Cdouble}
    i_naxis::Cint
    unity::Cint
    affine::Cint
    simple::Cint
    err::Ptr{WCSErr}
    tmpcrd::Ptr{Cdouble}
    m_flag::Cint
    m_naxis::Cint
    m_crpix::Ptr{Cdouble}
    m_pc::Ptr{Cdouble}
    m_cdelt::Ptr{Cdouble}
    m_dispre::Ptr{Cvoid}  # Ptr{disprm}
    m_disseq::Ptr{Cvoid}  # Ptr{disprm}
end

struct prjprm
    flag::Cint
    code::NTuple{4, UInt8}
    r0::Cdouble
    pv::NTuple{30, Cdouble}
    phi0::Cdouble
    theta0::Cdouble
    bounds::Cint
    name::NTuple{40, UInt8}
    category::Cint
    pvrange::Cint
    simplezen::Cint
    equiareal::Cint
    conformal::Cint
    _global::Cint
    divergent::Cint
    x0::Cdouble
    y0::Cdouble
    err::Ptr{WCSErr}
    padding::Ptr{Cvoid}
    w::NTuple{10, Cdouble}
    m::Cint
    n::Cint
    prjx2s::Ptr{Cvoid}
    prjs2x::Ptr{Cvoid}
end

struct celprm
    flag::Cint
    offset::Cint
    phi0::Cdouble
    theta0::Cdouble
    ref::NTuple{4, Cdouble}
    prj::prjprm
    euler::NTuple{5, Cdouble}
    latpreq::Cint
    isolat::Cint
    err::Ptr{WCSErr}
    padding::Ptr{Cvoid}
end

struct spcprm
    flag::Cint
    _type::NTuple{8, UInt8}
    code::NTuple{4, UInt8}
    crval::Cdouble
    restfrq::Cdouble
    restwav::Cdouble
    pv::NTuple{7, Cdouble}
    w::NTuple{6, Cdouble}
    isGrism::Cint
    padding1::Cint
    err::Ptr{WCSErr}
    padding2::Ptr{Cvoid}
    spxX2P::Ptr{Cvoid}
    spxP2S::Ptr{Cvoid}
    spxS2P::Ptr{Cvoid}
    spxP2X::Ptr{Cvoid}
end

# mirror of `wcsprm` struct in wcslib
"""
WCSTransform(naxis; kvs...)

Construct a WCS transformation with the given number of axes `naxis`.
Keyword arguments can be passed to set various attributes of the
transform. Specifying keyword arguments is equivalent to setting them
after construction:

```
julia> wcs = WCSTransform(2; crpix=[1000., 1000.])
```

is equilvalent to:

```
julia> wcs = WCSTransform(2)

julia> wcs.crpix = [1000., 1000.]
```
"""
mutable struct WCSTransform
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    crval::Ptr{Cdouble}
    cunit::Ptr{Cvoid}
    ctype::Ptr{Cvoid}
    lonpole::Cdouble
    latpole::Cdouble
    restfrq::Cdouble
    restwav::Cdouble
    npv::Cint
    npvmax::Cint
    pv::Ptr{PVCard}
    nps::Cint
    npsmax::Cint
    ps::Ptr{PSCard}
    cd::Ptr{Cdouble}
    crota::Ptr{Cdouble}
    altlin::Cint
    velref::Cint
    alt::NTuple{4, UInt8}
    colnum::Cint
    colax::Ptr{Cint}
    cname::Ptr{Cvoid}
    crder::Ptr{Cdouble}
    csyer::Ptr{Cdouble}
    czphs::Ptr{Cdouble}
    cperi::Ptr{Cdouble}
    wcsname::NTuple{72, UInt8}
    timesys::NTuple{72, UInt8}
    trefpos::NTuple{72, UInt8}
    trefdir::NTuple{72, UInt8}
    plephem::NTuple{72, UInt8}
    timeunit::NTuple{72, UInt8}
    dateref::NTuple{72, UInt8}
    mjdref::NTuple{2, Cdouble}
    timeoffs::Cdouble
    dateobs::NTuple{72, UInt8}
    datebeg::NTuple{72, UInt8}
    dateavg::NTuple{72, UInt8}
    dateend::NTuple{72, UInt8}
    mjdobs::Cdouble
    mjdbeg::Cdouble
    mjdavg::Cdouble
    mjdend::Cdouble
    jepoch::Cdouble
    bepoch::Cdouble
    tstart::Cdouble
    tstop::Cdouble
    xposure::Cdouble
    telapse::Cdouble
    timsyer::Cdouble
    timrder::Cdouble
    timedel::Cdouble
    timepixr::Cdouble
    obsgeo::NTuple{6, Cdouble}
    obsorbit::NTuple{72, UInt8}
    radesys::NTuple{72, UInt8}
    equinox::Cdouble
    specsys::NTuple{72, UInt8}
    ssysobs::NTuple{72, UInt8}
    velosys::Cdouble
    zsource::Cdouble
    ssyssrc::NTuple{72, UInt8}
    velangl::Cdouble
    ntab::Cint
    nwtb::Cint
    tab::Ptr{Cvoid}  # Ptr{tabprm}
    wtb::Ptr{Cvoid}  # Ptr{wtbarr}
    lngtyp::NTuple{8, UInt8}
    lattyp::NTuple{8, UInt8}
    lng::Cint
    lat::Cint
    spec::Cint
    cubeface::Cint
    types::Ptr{Cint}
    lin::linprm
    cel::celprm
    spc::spcprm
    err::Ptr{WCSErr}
    m_flag::Cint
    m_naxis::Cint
    m_crpix::Ptr{Cdouble}
    m_pc::Ptr{Cdouble}
    m_cdelt::Ptr{Cdouble}
    m_crval::Ptr{Cdouble}
    m_cunit::Ptr{Cvoid}
    m_ctype::Ptr{Cvoid}
    m_pv::Ptr{PVCard}
    m_ps::Ptr{PSCard}
    m_cd::Ptr{Cdouble}
    m_crota::Ptr{Cdouble}
    m_colax::Ptr{Cint}
    m_cname::Ptr{Cvoid}
    m_crder::Ptr{Cdouble}
    m_csyer::Ptr{Cdouble}
    m_czphs::Ptr{Cdouble}
    m_cperi::Ptr{Cdouble}
    m_tab::Ptr{Cvoid}  # Ptr{tabprm}
    m_wtb::Ptr{Cvoid}  # Ptr{wtbarr}

    function WCSTransform(naxis::Integer; kvs...)
        w = new(-1)
        status = ccall((:wcsini, libwcs), Cint,
                       (Cint, Cint, Ref{WCSTransform}),
                       1, naxis, w)
        assert_ok(status)
        finalizer(free!, w)
        for (k, v) in kvs
            setproperty!(w, k, v)
        end

        # wcsset() modifies the WCSTransform, so call it here so it doesn't
        # get called in wcss2p and wcsp2s. Otherwise, calling wcss2p / wcsp2s
        # on the same WCSTransform object from multiple threads would create
        # a race condition.
        status = ccall((:wcsset, libwcs), Cint, (Ref{WCSTransform},), w)
        assert_ok(status)

        return w
    end
end

function free!(w::WCSTransform)
    status = ccall((:wcsfree, libwcs), Cint, (Ref{WCSTransform},), w)
    assert_ok(status)
end

function propertynames(::WCSTransform, private::Bool=false)
    if private
        return fieldnames(WCSTransform)
    else
        return (:naxis, :cdelt, :crder, :crota, :crpix, :crval, :csyer,
                :cname, :ctype, :cunit, :cd, :pc, :equinox, :latpole, :lonpole,
                :mjdavg, :mjdobs, :restfrq, :restwav, :velangl, :velosys, :zsource, :colnum,
                :dateavg, :dateobs, :radesys, :specsys, :ssysobs, :ssyssrc, :wcsname,
                :obsgeo, :alt)
    end
end

"""
    obsfix(ctrl::Integer, wcs::WCSTransform)

Complete the `obsgeo` field `wcs` of observatory coordinates.  That is, if only the (x,y,z)
Cartesian coordinate triplet or the (l,b,h) geodetic coordinate triplet are set, then it
derives the other triplet from it. If both triplets are set, then it checks for consistency
at the level of 1 metre.

Arguments:

* `ctrl`: flag that controls behaviour if one triplet is defined and the other is only
  partially defined:
    * 0: Reset only the undefined elements of an incomplete coordinate triplet.
    * 1: Reset all elements of an incomplete triplet.
    * 2: Don't make any changes, check for consistency only. Returns an error if either of
      the two triplets is incomplete.
* `wcs`: Coordinate transformation parameters. Its `obsgeo` field may be changed.

Return values:

* -1: No change required (not an error).
*  0: Success.
*  1: Null wcsprm pointer passed.
*  5: Invalid parameter value.
"""
function obsfix(ctrl::Integer, wcs::WCSTransform)
    status = ccall((:obsfix, libwcs), Cint, (Cint, Ref{WCSTransform}),
                   ctrl, wcs)
    assert_ok(status)
end

# -----------------------------------------------------------------------------
# getting attributes of a WCSTransform
# These return newly-allocated memory (not views of the WCSTransform).

function getproperty(wcs::WCSTransform, k::Symbol)
    @assert getfield(wcs, :flag) != -1
    setfield!(wcs, :flag, Cint(0))
    naxis = getfield(wcs, :naxis)

    if k == :naxis
        v = getfield(wcs, k)

    # double[naxis]
    elseif k in (:cdelt, :crder, :crota, :crpix, :crval, :csyer)
        v = Array{Float64}(undef, naxis)
        unsafe_copyto!(pointer(v), getfield(wcs,k), naxis)

    # char[72,naxis]
    elseif k in (:cname, :ctype, :cunit)
        p = convert(Ptr{UInt8}, getfield(wcs, k))
        v = Array{String}(undef, naxis)
        for i=1:naxis
            pi = p + 72*(i-1)  # Ptr{UInt8} to the i-th entry.
            v[i] = convert_string(String, pi, 72)
        end

    # PVCard[]
    elseif k === :pv
        error("pv getter not yet implemented")

    # PSCard[]
    elseif k === :ps
        error("ps getter not yet implemented")

    # double[naxis,naxis]
    elseif k in (:cd, :pc)
        v = Array{Cdouble}(undef, naxis, naxis)
        unsafe_copyto!(pointer(v), getfield(wcs,k), naxis*naxis)

    # double
    elseif k in (:equinox,:latpole,:lonpole,:mjdavg,:mjdobs,
                 :restfrq,:restwav,:velangl,:velosys,:zsource)
        v = getfield(wcs, k)

    # int
    elseif k === :colnum
        v = Int(getfield(wcs, k))

    # char[72]
    elseif k in (:dateavg,:dateobs,:radesys,:specsys,:ssysobs,:ssyssrc,
                 :wcsname)
        v = convert_string(String, getfield(wcs, k))

    # double[6]
    elseif k === :obsgeo
        v = getfield(wcs, k)  # Tuple{Cdouble, Cdouble, Cdouble}

    # char[4], but only uses first
    elseif k === :alt
        v = Char(getfield(wcs, :alt)[1])

    else
        error("no property \"$k\" available")
    end

    return v
end


# -----------------------------------------------------------------------------
# modifying a WCSTransform

function setproperty!(wcs::WCSTransform, k::Symbol, v)
    @assert getfield(wcs, :flag) != -1
    setfield!(wcs, :flag, Cint(0))
    naxis = getfield(wcs, :naxis)

    # double[naxis]
    if k in (:cdelt, :crder, :crota, :crpix, :crval, :csyer)
        @check_type k v Vector{Float64}
        @check_prop k length v (==) naxis
        unsafe_copyto!(getfield(wcs,k), pointer(v), naxis)

    # char[72,naxis]
    elseif k in (:cname, :ctype, :cunit)
        @check_type k v Vector{String}
        @check_prop k length v (==) naxis
        for el in v; @assert isascii(el); end

        p = convert(Ptr{UInt8}, getfield(wcs, k))
        for i in 1:naxis
            pi = p + 72*(i-1)  # Ptr{UInt8} to i-th entry.
            n = length(v[i])
            @assert n < 72
            unsafe_copyto!(pi, pointer(v[i]), n)
            unsafe_store!(pi, 0x00, n+1)  # trailing null
        end

    # PVCard[]
    elseif k === :pv
        @check_prop k length v (<=) getfield(wcs, :npvmax)
        npv = length(v)
        for i in 1:npv  # TODO: what if a convert fails halfway through?
            unsafe_store!(getfield(wcs, :pv), convert(PVCard, v[i]), i)
        end
        setfield!(wcs, :npv, Cint(npv))

    # PSCard[]
    elseif k === :ps
        @check_prop k length v (<=) wcs.npsmax
        nps = length(v)
        for i in 1:nps
            unsafe_store!(wcs.ps, convert(PSCard, v[i]), i)
        end
        wcs.nps = nps

    # double[naxis,naxis]
    elseif k in (:cd, :pc)
        @check_type k v Matrix{Float64}
        @check_prop k size v (==) (naxis,naxis)
        unsafe_store_vec!(getfield(wcs,k), vec(v'))

    # double
    elseif k in (:equinox,:latpole,:lonpole,:mjdavg,:mjdobs,
                 :restfrq,:restwav,:velangl,:velosys,:zsource)
        setfield!(wcs, k, convert(Float64,v))

    # int
    elseif k === :colnum
        setfield!(wcs, k, convert(Cint, v))

    # char[72]
    elseif k in (:dateavg,:dateobs,:radesys,:specsys,:ssysobs,:ssyssrc,
                 :wcsname)
        setfield!(wcs, k, convert_string(NTuple{72, UInt8}, v))

    # double[6]
    elseif k === :obsgeo
        @check_type k v Vector{Float64}
        if length(v) == 3
            # For compatibility with previous versions of WCSLIB which required a 3-element
            # vector.
            setfield!(wcs, :obsgeo, (v[1], v[2], v[3], UNDEFINED, UNDEFINED, UNDEFINED))
            obsfix(0, wcs)
        else
            @check_prop k length v (==) 6
            setfield!(wcs, :obsgeo, (v[1], v[2], v[3], v[4], v[5], v[6]))
            obsfix(2, wcs)
        end

    # char[4], but only uses first
    elseif k === :alt
        @check_type k v Char
        (('A' <= v <= 'Z') || v == ' ') || error("alt must be 'A'-'Z' or ' '")
        setfield!(wcs, :alt, (UInt8(v), 0x00, 0x00, 0x00))

    else
        error("no property \"$k\" available")
    end
end

function deepcopy(wcs::WCSTransform)
    dst = WCSTransform(wcs.naxis)
    p = convert(Ptr{Cint}, C_NULL)
    ccall((:wcssub, libwcs), Cint,
          (Cint, Ref{WCSTransform}, Ptr{Cint}, Ptr{Cint}, Ref{WCSTransform}),
          0, wcs, p, p, dst)
    return dst
end

# The default Julia `copy` would be a gotcha, as it would leave two
# WCSTransforms linked by their underlying C-allocated arrays;
# only allow deepcopy.
copy(w::WCSTransform) = deepcopy(w)

# TODO: more info here.
function show(io::IO, wcs::WCSTransform)
    print(io, "WCSTransform(naxis=$(wcs.naxis))")
end

# -----------------------------------------------------------------------------
# transforms

"""
pix_to_world(wcs, pixcoords)

Convert the array of pixel coordinates `pixcoords` to world coordinates
according to the WCSTransform `wcs`. `pixcoords` should be a 2-d array
where \"pixcoords[:, i]\" is the i-th set of coordinates, or a 1-d array
representing a single set of coordinates.

The return value is the same shape as `pixcoords`.
"""
pix_to_world(wcs::WCSTransform, pixcoords::VecOrMat{Float64}) =
    pix_to_world!(wcs, pixcoords, similar(pixcoords))


"""
pix_to_world!(wcs, pixcoords, worldcoords[; stat=, imcoords=, phi=, theta=])

Convert the array of pixel coordinates `pixcoords` to world coordinates
according to the WCSTransform `wcs`, storing the result in the
`worldcoords` and `stat` arrays. `pixcoords` should be a 2-d array where
\"pixcoords[:, i]\" is the i-th set of coordinates, or a 1-d array
representing a single set of coordinates. `worldcoords` must be
the same size and type as `pixcoords`.

If given, the arrays `stat`, `imcoords`, `phi`, `theta` will be used
to store intermediate results. Their sizes and types must all match
`pixcoords`, except for `stat` which should be the same size but of type
Cint (typically Int32).
"""
function pix_to_world!(wcs::WCSTransform, pixcoords::VecOrMat{Float64},
                       worldcoords::VecOrMat{Float64};
                       stat=similar(pixcoords, Cint),
                       imcoords=similar(pixcoords),
                       phi=similar(pixcoords),
                       theta=similar(pixcoords))
    nelem = size(pixcoords, 1)
    ncoords = size(pixcoords, 2)
    if nelem < wcs.naxis
        error("size(pixcoords, 1) must be greater than or equal to naxis")
    end
    @same_size worldcoords pixcoords
    @same_size imcoords pixcoords
    @same_size phi pixcoords
    @same_size theta pixcoords
    @same_size stat pixcoords
    ccall((:wcsp2s, libwcs), Cint,
          (Ref{WCSTransform}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble},
           Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}),
          wcs, ncoords, nelem, pixcoords, imcoords, phi, theta, worldcoords,
          stat)
    return worldcoords
end



"""
world_to_pix(wcs, worldcoords)

Convert the array of world coordinates `worldcoords` to pixel coordinates
according to the WCSTransform `wcs`. `worldcoords` is a 2-d array
where \"worldcoords[:, i]\" is the i-th set of coordinates, or a 1-d array
representing a single set of coordinates.

The return value is the same size as `worldcoords`.
"""
world_to_pix(wcs::WCSTransform, worldcoords::VecOrMat{Float64}) =
    world_to_pix!(wcs, worldcoords, similar(worldcoords))


"""
world_to_pix!(wcs, worldcoords, pixcoords[; stat=, phi=, theta=, imcoords=])

Convert the array of pixel coordinates `worldcoords` to pixel coordinates
according to the WCSTransform `wcs`, storing the result in the
`pixcoords` array. `worldcoords` should be a 2-d array where
\"worldcoords[:, i]\" is the i-th set of coordinates, or a 1-d array
representing a single set of coordinates. `pixcoords` must be
the same size and type as `worldcoords`.

If given, the arrays `stat`, `imcoords`, `phi`, `theta` will be used
to store intermediate results. Their sizes and types must all match
`worldcoords`, except for `stat` which should be the same size but of type
Cint (typically Int32).
"""
function world_to_pix!(wcs::WCSTransform, worldcoords::VecOrMat{Float64},
                       pixcoords::VecOrMat{Float64};
                       stat=similar(pixcoords, Cint),
                       phi=similar(pixcoords),
                       theta=similar(pixcoords),
                       imcoords=similar(pixcoords))
    nelem = size(worldcoords, 1)
    ncoords = size(worldcoords, 2)
    if nelem < wcs.naxis
        error("size(worldcoords, 1) must be greater than or equal to naxis")
    end
    @same_size pixcoords worldcoords
    @same_size imcoords worldcoords
    @same_size phi worldcoords
    @same_size theta worldcoords
    @same_size stat worldcoords
    ccall((:wcss2p, libwcs), Cint,
          (Ref{WCSTransform}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble},
           Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}),
          wcs, ncoords, nelem, worldcoords, phi, theta, imcoords, pixcoords,
          stat)
    return pixcoords
end


# -----------------------------------------------------------------------------
# WCSTransform <--> header

"""
from_header(header[; relax=WCS.HDR_ALL, ctrl=0, ignore_rejected=false, table=false])

Parse the FITS image header in the String `header`, returning a
`Vector{WCSTransform}` giving all the transforms defined in the header.
The `relax` determines the treatment of non-standard keywords. The default is
to accept all known non-standard keywords. Use `relax=WCS.HDR_NONE` to
ignore all non-standard keywords. Use, e.g.,
`relax=(WCS.HDR_RADECSYS & WCS.HDR_CROTAia)` to only accept selected
non-standard keywords.
"""
function from_header(header::String; relax::Integer=HDR_ALL, ctrl::Integer=0,
                     ignore_rejected::Bool=false, table::Bool=false)
    @assert ctrl >= 0  # < 0 modifies the header
    nkeyrec::Integer=div(length(header), 80)
    nreject = Ref{Cint}(0)
    nwcs = Ref{Cint}(0)
    wcsptr = Ref{Ptr{WCSTransform}}(0)
    keysel = 0
    status = Cint(0)

    # wcsbth & wcspih are not thread-safe; see
    # http://www.atnf.csiro.au/people/mcalabre/WCS/wcslib/threads.html
    lock(wcs_lock)
    if table
        colsel = convert(Ptr{Cint}, C_NULL)
        status = ccall((:wcsbth, libwcs), Cint,
                       (Ptr{UInt8}, Cint, Cint, Cint, Cint, Ptr{Cint},
                        Ref{Cint}, Ref{Cint}, Ref{Ptr{WCSTransform}}),
                       header, nkeyrec, relax, ctrl, keysel, colsel,
                       nreject, nwcs, wcsptr)
    else
        status = ccall((:wcspih, libwcs), Cint,
                       (Ptr{UInt8}, Cint, Cint, Cint, Ref{Cint}, Ref{Cint},
                        Ref{Ptr{WCSTransform}}),
                       header, nkeyrec, relax, ctrl, nreject, nwcs, wcsptr)
    end
    unlock(wcs_lock)
    assert_ok(status)
    p = wcsptr[]
    result = WCSTransform[unsafe_load(p, i) for i = 1:nwcs[]]

    # Free the array of pointers allocated by wcslib. (But not the
    # structs they point to, which we've `unsafe_load`ed into a
    # Julia-allocated array!)
    # TODO: this could call the wrong `free` function if wcslib is linked
    # against a different libc than Julia.
    Libc.free(p)

    # For each of the WCSTransforms, register a finalizer and finish
    # initialization of the struct by calling wcsset. This avoids race
    # conditions between threads using the same WCSTransform.
    lock(wcs_lock)
    for w in result
        finalizer(free!, w)
        status = ccall((:wcsset, libwcs), Cint, (Ref{WCSTransform},), w)
        assert_ok(status)
    end
    unlock(wcs_lock)

    if !ignore_rejected && nreject[] != 0
        error("$(nreject[]) WCS transformations were rejected; " *
              "use ignore_rejected = true keyword to ignore")
    end
    return result
end

"""
to_header(wcs[; relax=WCS.HDR_NONE])

Encode the WCSTransform `wcs` as a FITS header string. The `relax` keyword
controls how non-standard extensions to the WCS standard are handled.
"""
function to_header(wcs::WCSTransform; relax::Integer=HDR_NONE)
    nkeyrec = Ref{Cint}(0)
    hdrptr = Ref{Ptr{UInt8}}(C_NULL)
    status = ccall((:wcshdo, libwcs), Cint,
                   (Cint, Ref{WCSTransform}, Ref{Cint}, Ref{Ptr{UInt8}}),
                   relax, wcs, nkeyrec, hdrptr)
    assert_ok(status)
    header = unsafe_string(hdrptr[])
    Libc.free(hdrptr[])
    return header
end

function Base.getindex(wcs::WCSTransform, k::Symbol)
    Base.depwarn("`wcs[:$k]` is deprecated, use `wcs.$k` instead.", :getindex)
    getproperty(wcs, k)
end
function Base.setindex!(wcs::WCSTransform, v, k::Symbol)
    Base.depwarn("`wcs[:$k] = $v` is deprecated, use `wcs.$k = $v` instead.", :getindex)
    setproperty!(wcs, k, v)
end

end  # module
