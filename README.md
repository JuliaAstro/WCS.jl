WCSLIB.jl
=========

Julia wrapper for [wcslib](http://www.atnf.csiro.au/people/mcalabre/WCS/). 

Installation
------------

```jlcon
julia> Pkg.add("WCSLIB")
```

Example
-------

```julia
using WCSLIB

# create a wcsprm struct from scratch
w = wcsprm(2; # naxis
           cdelt = [-0.066667, 0.066667],
           ctype = ["RA---AIR", "DEC--AIR"],
           crpix = [-234.75, 8.3393],
           crval = [0., -90],
           pv    = [pvcard(2, 1, 45.0)])

# ... or from a FITS header
(ws,nrejected) = wcspih(fits_header)
w = ws[1]

# pixel coordinates -- note the transpose
# (julia's arrays are column-major, while wcs expects row-major)
pixcrd = [0. 0; 24 38; 45 98]'

world  = similar(pixcrd)
imgcrd = similar(pixcrd)
phi    = similar(pixcrd)
theta  = similar(pixcrd)
stat   = Array(Cint, size(pixcrd)...)

# convert pixel -> world coordinates
wcsp2s(w, pixcrd, imgcrd, phi, theta, world, stat)
```
