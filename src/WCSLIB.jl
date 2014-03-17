module WCSLIB

export pvcard,
       wcsalloc,
       wcsmodify

using BinDeps
@BinDeps.load_dependencies

include("libwcs_common.jl")
include("libwcs_h.jl")

for (name,offset) in zip(names(wcsprm),fieldoffsets(wcsprm))
    if name in (:flag,:npv)
        @eval const $(symbol(string("_",name,"_offset"))) = $offset
    end
end

function wcsalloc(naxis::Integer)
    p = convert(Ptr{wcsprm}, c_malloc(sizeof(wcsprm)))
    unsafe_store!(convert(Ptr{Cint}, p+_flag_offset), -1)
    stat = wcsini(1, naxis, p)
    @assert stat == 0
    p
end

function unsafe_store_vec!{T}(p::Ptr{T}, v::Vector{T})
    for i = 1:length(v)
        unsafe_store!(p, v[i], i)
    end
end

function wcsmodify(p::Ptr{wcsprm}; kvs...)
    w = unsafe_load(p)
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
            unsafe_store!(convert(Ptr{Cint}, p+_npv_offset), npv)

        else
            error("unrecognized keyword argument \"$k\"")
        end
    end
end

end # module
