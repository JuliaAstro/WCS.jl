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

function wcsp2s(wcs::wcsprm,
                pixcrd::Matrix{Float64}, imgcrd::Matrix{Float64},
                phi::Matrix{Float64}, theta::Matrix{Float64},
                world::Matrix{Float64}, stat::Matrix{Cint})
    (nelem, ncoord) = size(pixcrd)
    wcsp2s(wcs, ncoord, nelem, pointer(pixcrd), pointer(imgcrd),
           pointer(phi), pointer(theta), pointer(world), pointer(stat))
end

function wcss2p(wcs::wcsprm, world::Matrix{Float64},
                phi::Matrix{Float64}, theta::Matrix{Float64},
                imgcrd::Matrix{Float64}, pixcrd::Matrix{Float64},
                stat::Matrix{Cint})
    (nelem, ncoord) = size(world)
    wcss2p(wcs, ncoord, nelem, pointer(world), pointer(phi), pointer(theta),
           pointer(imgcrd), pointer(pixcrd), pointer(stat))
end

end # module
