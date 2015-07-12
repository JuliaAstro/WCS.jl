WCS.jl
======

Experimental friendly fork of WCSLIB.jl:

- Julia-style API
- uses more recent [WCSLIB](http://www.atnf.csiro.au/people/mcalabre/WCS/) 5.7.
- requires Julia 0.4-dev (mainly for NTuples & docstrings)


Installation
------------

```jlcon
julia> Pkg.clone("git://github.com/kbarbary/WCS.jl.git")
```

Example
-------

```julia
julia> using WCS

# create a transformation from scratch
julia> wcs = WCSTransform(2;
                          cdelt = [-0.066667, 0.066667],
                          ctype = ["RA---AIR", "DEC--AIR"],
                          crpix = [-234.75, 8.3393],
                          crval = [0., -90],
                          pv    = [(2, 1, 45.0)])
WCSTransform(naxis=2)

# ... or from a FITS header
julia> wcss = WCS.from_header(header)

julia> wcs = wcss[1]


# convert pixel -> world coordinates
julia> pixcoords = [0.0  24.0  45.0;  # x coordinates
                    0.0  38.0  98.0]  # y coordinates

julia> worldcoords = pix_to_world(wcs, pixcoords)
2x3 Array{Float64,2}:
 267.965   276.539   287.771 
 -73.7366  -71.9741  -69.6781


# convert world -> pixel coordinates
julia> pixcoords = world_to_pix(wcs, worldcoords)
2x3 Array{Float64,2}:
  1.16529e-12  24.0  45.0
 -7.10543e-14  38.0  98.0


# convert a WCSTransform to a FITS header
header = WCS.to_header(wcs)
```
