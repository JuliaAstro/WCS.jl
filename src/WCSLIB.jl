module WCSLIB
using export

Compat PSCard, PVCard, WCSTransform

#=
export wcsbchk,
       #wcsbdx,
       wcsbth,
       wcscopy,
       wcserr_enable,
       wcserr_prt,
       wcsfree,
       wcshdo,
       #wcsidx,
       wcsini,
       #wcsmix,
       wcsmodify,
       wcsnps,
       wcsnpv,
       wcsp2s,
       wcsperr,
       wcspih,
       wcsprt,
       wcss2p,
       wcsset,
       #wcssptr,
       #wcssub,
       wcstab
=#

import Base: convert

include("../deps/deps.jl")

# -----------------------------------------------------------------------------
# error messaging

function get_error_message(i::Cint)
    msgptrs = cglobal((:wcs_errmsg, wcslib), Ptr{Ptr{UInt8}})
    msgptr = unsafe_load(msgptrs, i+1)
    bytestring(msgptr)
end

function assert_ok(i::Cint)
    if i != 0
        error(get_error_message(i))
    end
end

# -----------------------------------------------------------------------------

# mirror of `struct pvcard`
immutable PVCard
    i::Cint
    m::Cint
    value::Cdouble
end

# mirror of `struct pscard`
immutable PSCard
    i::Cint
    m::Cint
    value::NTuple{72, UInt8}
end

# mirror of `struct wcserr`
immutable WCSErr
    status::Cint
    line_no::Cint
    _function::Ptr{Uint8}
    file::Ptr{Uint8}
    msg::NTuple{160, Uint8}
end

immutable linprm
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    dispre::Ptr{Void}  # Ptr{disprm}
    disseq::Ptr{Void}  # Ptr{disprm}
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
    m_dispre::Ptr{Void}  # Ptr{disprm}
    m_disseq::Ptr{Void}  # Ptr{disprm}
end

immutable prjprm
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
    padding::Ptr{Void}
    w::NTuple{10, Cdouble}
    m::Cint
    n::Cint
    prjx2s::Ptr{Void}
    prjs2x::Ptr{Void}
end

immutable celprm
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
    padding::Ptr{Void}
end

immutable spcprm
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
    padding2::Ptr{Void}
    spxX2P::Ptr{Void}
    spxP2S::Ptr{Void}
    spxS2P::Ptr{Void}
    spxP2X::Ptr{Void}
end

# mirror of `wcsprm` struct in wcslib
type WCSTransform
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    crval::Ptr{Cdouble}
    cunit::Ptr{Void}
    ctype::Ptr{Void}
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
    cname::Ptr{Void}
    crder::Ptr{Cdouble}
    csyer::Ptr{Cdouble}
    dateavg::NTuple{72, UInt8}
    dateobs::NTuple{72, UInt8}
    equinox::Cdouble
    mjdavg::Cdouble
    mjdobs::Cdouble
    obsgeo::NTuple{3, Cdouble}
    radesys::NTuple{72, UInt8}
    specsys::NTuple{72, UInt8}
    ssysobs::NTuple{72, UInt8}
    velosys::Cdouble
    zsource::Cdouble
    ssyssrc::NTuple{72, UInt8}
    velangl::Cdouble
    wcsname::NTuple{72, UInt8}
    ntab::Cint
    nwtb::Cint
    tab::Ptr{Void}  # Ptr{tabprm}
    wtb::Ptr{Void}  # Ptr{wtbarr}
    lngtyp::NTuple{8, UInt8}
    lattyp::NTuple{8, UInt8}
    lng::Cint
    lat::Cint
    spec::Cint
    cubeface::Cint
    types::Ptr{Cint}
    padding::Ptr{Void}
    lin::linprm
    cel::celprm
    spc::spcprm
    err::Ptr{WCSErr}
    m_padding::Ptr{Void}
    m_flag::Cint
    m_naxis::Cint
    m_crpix::Ptr{Cdouble}
    m_pc::Ptr{Cdouble}
    m_cdelt::Ptr{Cdouble}
    m_crval::Ptr{Cdouble}
    m_cunit::Ptr{Void}
    m_ctype::Ptr{Void}
    m_pv::Ptr{PVCard}
    m_ps::Ptr{PSCard}
    m_cd::Ptr{Cdouble}
    m_crota::Ptr{Cdouble}
    m_colax::Ptr{Cint}
    m_cname::Ptr{Void}
    m_crder::Ptr{Cdouble}
    m_csyer::Ptr{Cdouble}
    m_tab::Ptr{Void}  # Ptr{tabprm}
    m_wtb::Ptr{Void}  # Ptr{wtbarr}

    function WCSTransform(naxis::Integer; kvs...)
        w = new(-1)
        status = ccall((:wcsini, libwcs), Cint, (Cint, Cint, Ref{WCSTransform}),
                       1, naxis, w)
        assert_ok(status)
        finalizer(w, wcsfree)
        for (k, v) in kvs
            w[k] = v
        end
        return w
    end
end

function wcsfree(wcs::WCSTransform)
    status = ccall((:wcsfree, libwcs), Cint, (Ref{WCSTransform},), wcs)
    assert_ok(status)
end

# -----------------------------------------------------------------------------
# helpers

function unsafe_store_vec!{T}(p::Ptr{T}, v::Vector{T})
    for i = 1:length(v)
        unsafe_store!(p, v[i], i)
    end
end

function Base.convert{N}(::Type{NTuple{N,UInt8}}, s::ASCIIString)
    @assert length(s) < N
    v = zeros(Uint8, N)  # intermediate array that we can fill :(
    copy!(v, convert(Vector{UInt8}, s))
    (v...)
end

macro check_type(k, v, t)
    :(typeof($(esc(v))) <: $t || error($(esc(k))," must have type ",$t))
end

macro check_prop(k, prop, v, op, n)
    en = esc(n)
    :(($op)($prop($(esc(v))), $en) || error($(esc(k))," must have ",$prop," ",$op," ",$en))
end

# -----------------------------------------------------------------------------
# modifying a WCSTransform

function setindex!(w::WCSTransform, v, k::Symbol)
    @assert w.flag != -1
    w.flag = 0
    naxis = w.naxis

    # double[naxis]
    if k in (:cdelt, :crder, :crota, :crpix, :crval, :csyer)
        @check_type k v Vector{Float64}
        @check_prop k length v (==) naxis
        unsafe_copy!(getfield(w,k), pointer(v), naxis)

    # char[72,naxis]
    elseif k in (:cname, :ctype, :cunit)
        @check_type k v Vector{ASCIIString}
        @check_prop k length v (==) naxis

        p = convert(Ptr{UInt8}, getfield(w, k))
        for i in 1:naxis
            pi = p + 72*(i-1)  # Ptr{UInt8} to i-th entry.
            n = length(v[i])
            @assert n < 72
            unsafe_copy!(pi, pointer(v[i]), n)
            unsafe_store!(pi, 0x00, n+1)  # trailing null
        end

    # PVCard[]
    elseif k === :pv
        npv = length(v)
        @check_type k v Vector{PVCard}
        @check_prop k length v (<=) w.npvmax
        unsafe_store_vec!(w.pv, v)
        w.npv = npv

    # PSCard[]
    elseif k === :ps
        nps = length(v)
        @check_type k v Vector{PSCard}
        @check_prop k length v (<=) w.npsmax
        unsafe_store_vec!(w.ps, v)
        w.nps = nps

    # double[naxis,naxis]
    elseif k in (:cd, :pc)
        @check_type k v Matrix{Float64}
        @check_prop k size v (==) (naxis,naxis)
        unsafe_store_vec!(getfield(w,k), vec(v'))
        
    # double
    elseif k in (:equinox,:latpole,:lonpole,:mjdavg,:mjdobs,
                 :restfrq,:restwav,:velangl,:velosys,:zsource)
        setfield!(w, k, convert(Float64,v))

    # int
    elseif k === :colnum
        setfield!(w, k, convert(Cint, v))

    # char[72]
    elseif k in (:dateavg,:dateobs,:radesys,:specsys,:ssysobs,:ssyssrc,
                 :wcsname)
        setfield!(w, k, convert(NTuple{72, Uint8}, v))

    # double[3]
    elseif k === :obsgeo
        @check_type k v Vector{Float64}
        @check_prop k length v (==) 3
        w.obsgeo = (v[1], v[2], v[3])

    # char[4], but only uses first
    elseif k === :alt
        @check_type k v Char
        (('A' <= v <= 'Z') || v == ' ') || error("alt must be 'A'-'Z' or ' '")
        w.alt = (UInt8(v), 0x00, 0x00, 0x00)

    else
        error("unrecognized keyword argument \"$k\"")
    end
end

#=
function wcscopy(alloc::Integer, src::wcsprm, dst::wcsprm)
    p = convert(Ptr{Cint}, C_NULL)
    wcssub(alloc, src, p, p, dst)
end

macro same_size(a, b)
    :(size($(esc(a))) == size($(esc(b))) || error($(string(a))," must have the same dimensions as ",$(string(b))))
end

function wcsp2s(wcs::wcsprm, pixcrd::Matrix{Float64};
                imgcrd::Matrix{Float64}=similar(pixcrd),
                phi::Matrix{Float64}=similar(pixcrd),
                theta::Matrix{Float64}=similar(pixcrd),
                world::Matrix{Float64}=similar(pixcrd),
                stat::Matrix{Cint}=similar(pixcrd,Cint))
    @same_size imgcrd pixcrd
    @same_size phi pixcrd
    @same_size theta pixcrd
    @same_size world pixcrd
    @same_size stat pixcrd
    (nelem, ncoord) = size(pixcrd)
    nelem >= wcs.naxis || error("number of rows must be greater than or equal to naxis")
    wcsp2s(wcs, ncoord, nelem, pointer(pixcrd), pointer(imgcrd),
           pointer(phi), pointer(theta), pointer(world), pointer(stat))
    world
end

function wcss2p(wcs::wcsprm, world::Matrix{Float64};
                phi::Matrix{Float64}=similar(world),
                theta::Matrix{Float64}=similar(world),
                imgcrd::Matrix{Float64}=similar(world),
                pixcrd::Matrix{Float64}=similar(world),
                stat::Matrix{Cint}=similar(world,Cint))
    @same_size phi world
    @same_size theta world
    @same_size imgcrd world
    @same_size pixcrd world
    @same_size stat world
    (nelem, ncoord) = size(world)
    nelem >= wcs.naxis || error("number of rows must be greater than or equal to naxis")
    wcss2p(wcs, ncoord, nelem, pointer(world), pointer(phi), pointer(theta),
           pointer(imgcrd), pointer(pixcrd), pointer(stat))
    pixcrd
end

function wcspih(header::ASCIIString; nkeyrec::Integer=div(length(header),80),
                                     relax::Integer=0, ctrl::Integer=0)
    @assert ctrl >= 0 # < 0 modifies the header
    nreject = Cint[0]
    nwcs = Cint[0]
    wcs = Ptr{wcsprm}[0]
    stat = wcspih(pointer(header), nkeyrec, relax, ctrl,
                  pointer(nreject), pointer(nwcs), pointer(wcs))
    @assert stat == 0
    p = wcs[1]
    a = wcsprm[unsafe_load(p,i) for i = 1:nwcs[1]]
    Libc.free(p)
    (a, @compat(Int(nreject[1])))
end

function wcsbth(header::ASCIIString; nkeyrec::Integer=div(length(header),80),
                                     relax::Integer=0, ctrl::Integer=0,
                                     keysel::Integer=0)
    @assert ctrl >= 0 # < 0 modifies the header
    nreject = Cint[0]
    nwcs = Cint[0]
    wcs = Ptr{wcsprm}[0]
    stat = wcsbth(pointer(header), nkeyrec, relax, ctrl, keysel, C_NULL,
                  pointer(nreject), pointer(nwcs), pointer(wcs))
    @assert stat == 0
    p = wcs[1]
    a = wcsprm[unsafe_load(p,i) for i = 1:nwcs[1]]
    Libc.free(p)
    (a, @compat(Int(nreject[1])))
end

function wcshdo(w::wcsprm; relax::Integer=0)
    nkeyrec = Cint[0]
    header = Ptr{Uint8}[0]
    stat = wcshdo(relax, w, pointer(nkeyrec), pointer(header))
    @assert stat == 0
    p = header[1]
    s = bytestring(p)
    Libc.free(p)
    s
end
=#

end # module
