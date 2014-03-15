module WCSLIB

using BinDeps
@BinDeps.load_dependencies

const wcs_errmsg = nothing
include("libwcs_common.jl")
include("libwcs_h.jl")

end # module
