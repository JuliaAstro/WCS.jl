# WCS.jl

Astronomical [World Coordinate System](http://www.atnf.csiro.au/people/mcalabre/WCS/) library for Julia. This package wraps 
the WCSLIB C library. This is a tool made for users who are already familiar with WCS transformations. If you are not, please 
reference the following manuscripts

1. [Representation of world coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/wcs.pdf)
2. [Representations of celestial coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/ccs.pdf)
3. [Representations of spectral coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/scs.pdf)
4. [Representations of distortions in FITS world coordinate systems](http://www.atnf.csiro.au/people/mcalabre/WCS/dcs_20040422.pdf)

## Table of Contents
```@contents
```

## Installation

From the REPL, press `]` to enter Pkg mode

```
(v 1.2) pkg> add WCS
```

## Usage

Import the library

```@meta
DocTestSetup = quote
    using WCS
end
```

```jldoctest
julia> using WCS
```

There are many ways to utilize WCS transformations. Let's make one for a 2-dimensional array (like an image) from scratch.

```jldoctest wcs
julia> wcs = WCSTransform(2;
                          cdelt = [-0.066667, 0.066667],
                          ctype = ["RA---AIR", "DEC--AIR"],
                          crpix = [-234.75, 8.3393],
                          crval = [0., -90],
                          pv    = [(2, 1, 45.0)])
WCSTransform(naxis=2)
```

We can also create one from a FITS header if it contains the appropriate keywords
```julia
# Or from a FITS header with appropriate keywords
julia> wcs_array = WCS.from_header(header)

julia> wcs = wcs_array[1]

```

Now we can do conversions between pixel and world coordinates. 

!!! note
    that WCS transforms use pixel `(0, 0)` as the top-left corner (not 1-indexed!!!)

```jldoctest wcs
# convert pixel -> world coordinates
julia> pixcoords = [0.0  24.0  45.0;  # x coordinates
                    0.0  38.0  98.0]  # y coordinates
2×3 Array{Float64,2}:
 0.0  24.0  45.0
 0.0  38.0  98.0

julia> worldcoords = pix_to_world(wcs, pixcoords)
2×3 Array{Float64,2}:
 267.965   276.539   287.771
 -73.7366  -71.9741  -69.6781
julia> pixcoords = world_to_pix(wcs, worldcoords)
2×3 Array{Float64,2}:
  1.16529e-12  24.0  45.0
 -7.10543e-14  38.0  98.0

```

## API/Reference

```@autodocs
Modules = [WCS]
```

## Index

```@index
```
