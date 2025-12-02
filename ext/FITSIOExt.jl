module FITSIOExt

using FITSIO: FITSHeader

import WCS: from_header

"""
    from_header(h::FITSHeader; kwargs...)

Parse a [`FITSHeader`](@extref FITSIO.FITSHeader) `header` from [FITSIO.jl](@extref), returning a `Vector{WCSTransform}` giving all the transforms defined in the header. Keyword arguments are passed to [`from_header(header::String)`](@ref).
"""
from_header(header::FITSHeader; kwargs...) = from_header(string(header); kwargs...)

end # module
