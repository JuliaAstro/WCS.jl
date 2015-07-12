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
using WCS

# create a transformation from scratch
wcs = WCSTransform(2; # naxis
                   cdelt = [-0.066667, 0.066667],
                   ctype = ["RA---AIR", "DEC--AIR"],
                   crpix = [-234.75, 8.3393],
                   crval = [0., -90],
                   pv    = [PVCard(2, 1, 45.0)])

# ... or from a FITS header
(wcs_array, nrejected) = WCS.from_header(header)
wcs = wcs_array[1]

# pixel coordinates -- note that, because julia's arrays are column-major,
# while wcs expects row-major, the x-values are in row 1 and the
# y-values in row 2
pixcoords = [0.0  24.0  45.0;
             0.0  38.0  98.0]

# convert pixel -> world coordinates
worldcoords = pix_to_world(wcs, pixcoords)

# convert world -> pixel coordinates
pixcoords = world_to_pix(wcs, worldcoords)

# convert wcsprm to FITS header
header = WCS.to_header(wcs)
```
