WCS.jl
======

<!-- Storage for badge urls -->
[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://juliaastro.github.io/WCS.jl/latest/

[travis-img]: https://travis-ci.org/JuliaAstro/WCS.jl.svg?branch=master
[travis-url]: https://travis-ci.org/JuliaAstro/WCS.jl

[coveralls-img]: https://img.shields.io/coveralls/JuliaAstro/WCS.jl.svg
[coveralls-url]: https://coveralls.io/r/JuliaAstro/WCS.jl?branch=master

[![Build Status][travis-img]][travis-url]
[![Doc Status][docs-latest-img]][docs-latest-url]
[![Coverage Status][coveralls-img]][coveralls-url]

Astronomical [World Coordinate
System](http://www.atnf.csiro.au/people/mcalabre/WCS/) library for
Julia. This package wraps the WCSLIB C library.

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
julia> wcs_array = WCS.from_header(header)

julia> wcs = wcs_array[1]


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

# check what underlying C library version is being used.
julia> WCS.wcslib_version()
v"6.2.0"
```

License
-------

The Julia code in this repository is distributed under the MIT
license. Note that WCS.jl wraps the WCSLIB C library, which is
released under the LGPL license.
