module WCSLIB

using BinDeps
@BinDeps.load_dependencies

include("libwcs_common.jl")
include("libwcs_h.jl")

end # module
