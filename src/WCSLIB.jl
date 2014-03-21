module WCSLIB

export pvcard,
       wcsmodify,
       wcsprm

using BinDeps
@BinDeps.load_dependencies

include("libwcs_common.jl")
include("libwcs_h.jl")

function unsafe_store_vec!{T}(p::Ptr{T}, v::Vector{T})
    for i = 1:length(v)
        unsafe_store!(p, v[i], i)
    end
end

function wcsmodify(w::wcsprm; kvs...)
    naxis = w.naxis
    for (k,v) in kvs
        if k in (:cdelt,:crder,:crpix,:crval,:csyer)
            @assert isa(v, Vector{Float64})
            @assert length(v) == naxis
            unsafe_store_vec!(w.(k), v)

        elseif k in (:cname,:ctype,:cunit)
            @assert isa(v, Vector{ASCIIString})
            @assert length(v) == naxis
            pf = convert(Ptr{Uint8}, w.(k))
            n = 72
            for i = 1:naxis
                @assert length(v[i]) < n
                unsafe_store_vec!(pf + n*(i-1), v[i].data)
            end

        elseif k === :pv
            npv = length(v)
            @assert isa(v, Vector{pvcard})
            @assert npv <= w.npvmax
            unsafe_store_vec!(w.pv, v)
            w.npv = npv

        else
            error("unrecognized keyword argument \"$k\"")
        end
    end
end

function wcsprm(naxis::Integer; kvs...)
    w = wcsprm()
    wcsini(1, naxis, w)
    finalizer(w, wcsfree)
    wcsmodify(w; kvs...)
    w
end

function wcsp2s(wcs::wcsprm, pixcrd::Matrix{Float64};
                imgcrd::Matrix{Float64}=similar(pixcrd),
                phi::Matrix{Float64}=similar(pixcrd),
                theta::Matrix{Float64}=similar(pixcrd),
                world::Matrix{Float64}=similar(pixcrd),
                stat::Matrix{Cint}=similar(pixcrd,Cint))
    (nelem, ncoord) = size(pixcrd)
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
    (nelem, ncoord) = size(world)
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
    c_free(p)
    (a, int(nreject[1]))
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
    c_free(p)
    (a, int(nreject[1]))
end

function wcshdo(w::wcsprm; relax::Integer=0)
    nkeyrec = Cint[0]
    header = Ptr{Uint8}[0]
    stat = wcshdo(relax, w, pointer(nkeyrec), pointer(header))
    @assert stat == 0
    p = header[1]
    s = bytestring(p)
    c_free(p)
    s
end

end # module
