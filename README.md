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

# create a transformation from scratch
w = WCSTransform(2; # naxis
                 cdelt = [-0.066667, 0.066667],
                 ctype = ["RA---AIR", "DEC--AIR"],
                 crpix = [-234.75, 8.3393],
                 crval = [0., -90],
                 pv    = [PVCard(2, 1, 45.0)])

# below this point not yet implemented

# ... or from a FITS header
(ws,nrejected) = wcspih(header)
w = ws[1]  # ws is an array of wcsprm

# pixel coordinates -- note that, because julia's arrays are column-major,
# while wcs expects row-major, the x-values are in row 1 and the y-values in row 2
pixcrd = [0.0  24.0  45.0;
          0.0  38.0  98.0]

# convert pixel -> world coordinates
world = wcsp2s(w, pixcrd)

# convert world -> pixel coordinates
pixcrd = wcss2p(w, world)

# convert wcsprm to FITS header
header = wcshdo(w)
```
