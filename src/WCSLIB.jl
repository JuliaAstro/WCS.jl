module WCSLIB

export wcsalloc

using BinDeps
@BinDeps.load_dependencies

include("libwcs_common.jl")
include("libwcs_h.jl")

const wcsprm_offset = Dict(names(wcsprm), fieldoffsets(wcsprm))

function wcsalloc(naxis::Integer)
    p = convert(Ptr{wcsprm}, c_malloc(sizeof(wcsprm)))
    pflag = p + wcsprm_offset[:flag]
    unsafe_store!(convert(Ptr{Cint}, pflag), -1)
    stat = wcsini(int32(1), int32(naxis), p)
    @assert stat == 0
    p
end

end # module
