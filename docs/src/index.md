```@meta
DocTestSetup = quote
    using WCS
end
```

# WCS.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaastro.org/WCS/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaastro.org/WCS.jl/dev/)

[![CI](https://github.com/JuliaAstro/WCS.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/JuliaAstro/WCS.jl/actions/workflows/CI.yml)
[![PkgEval](https://juliaci.github.io/NanosoldierReports/pkgeval_badges/W/WCS.svg)](https://juliaci.github.io/NanosoldierReports/pkgeval_badges/report.html)
[![codecov](https://codecov.io/gh/JuliaAstro/WCS.jl/graph/badge.svg?token=IkcEB1e4Ib)](https://codecov.io/gh/JuliaAstro/WCS.jl)
![License](https://img.shields.io/github/license/JuliaAstro/WCS.jl?color=yellow)

Astronomical [World Coordinate System](http://www.atnf.csiro.au/people/mcalabre/WCS/) library for Julia. This package wraps
the WCSLIB C library. This is a tool made for users who are already familiar with WCS transformations. If you are not, please
reference the following manuscripts

1. [Representation of world coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/wcs.pdf)
2. [Representations of celestial coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/ccs.pdf)
3. [Representations of spectral coordinates in FITS](http://www.atnf.csiro.au/people/mcalabre/WCS/scs.pdf)
4. [Representations of distortions in FITS world coordinate systems](http://www.atnf.csiro.au/people/mcalabre/WCS/dcs_20040422.pdf)

## Installation

From the REPL, press `]` to enter Pkg mode

```julia-repl
pkg> add WCS
```

## Usage

Import the library:

There are many ways to utilize WCS transformations. Let's make one for a 2-dimensional array (like an image) from scratch:

```jldoctest wcs
julia> wcs = WCSTransform(2;
           cdelt = [-0.066667, 0.066667],
           ctype = ["RA---AIR", "DEC--AIR"],
           crpix = [-234.75, 8.3393],
           crval = [0., -90],
           pv    = [(2, 1, 45.0)],
       )
WCSTransform(naxis=2, cdelt=[-0.066667, 0.066667], crval=[0.0, -90.0], crpix=[-234.75, 8.3393])
```

We can also create one directly from a header loaded from [FITSIO.jl](@extref) if it contains the appropriate keywords:

```jldoctest wcs
julia> using FITSIO: read_header

julia> using Downloads: download

julia> header = (read_header ∘ download)("https://fits.gsfc.nasa.gov/nrao_data/samples/wcs/m82rad.fits");

julia> WCS.from_header(header; ignore_rejected = true)
1-element Vector{WCSTransform}:
 WCSTransform(naxis=4, cdelt=[-0.0002247777738, 0.0002273333375, 5.0e7, 1.0], crval=[147.927100003, 69.9079999924, 1.49e9, 0.0], crpix=[0.0, 0.0, 0.0, 1.0])
```

!!! details "header file"
    ```jldoctest wcs
    julia> typeof(header)
    FITSIO.FITSHeader

    julia> header
    SIMPLE  =                    T
    BITPIX  =                   16
    NAXIS   =                    4
    NAXIS1  =                  558
    NAXIS2  =                  262
    NAXIS3  =                    1
    NAXIS4  =                    1
    EXTEND  =                    T / Tables following main image
    BLOCKED =                    T / Tape may be blocked
    OBJECT  = 'U05322  '
    TELESCOP= 'VLA     '
    INSTRUME= 'VLA     '
    OBSERVER= 'AC243   '
    DATE-OBS= '06/02/89'
    DATE-MAP= '13/09/94'
    BSCALE  =     1.95069823037e-6 / REAL = TAPE * BSCALE + BZERO
    BZERO   =      0.0548100471497
    BUNIT   = 'JY/BEAM '
    EPOCH   =               1950.0 / EPOCH OF RA DEC
    BLANK   =               -32768 / Blanked pixel tape value
    VELREF  =                    3 / >256 RADIO, 1 LSR 2 HEL 3 OBS
    ALTRVAL =             100000.0 / ALTENATE FREQ/VEL REF VALUE
    ALTRPIX =                  1.0 / ALTENATE FREQ/VEL REF PIXEL
    YSHIFT  =      1.421085472e-14 / NET SHIFT OF PHASE CENTER INY
    DATAMAX =         0.1187149212 / MAX PIXEL VALUE
    DATAMIN =      -0.009094826877 / MIN PIXEL VALUE
    CTYPE1  = 'RA---ARC'
    CRVAL1  =        147.927100003
    CDELT1  =     -0.0002247777738
    CRPIX1  =                301.5
    CROTA1  =                  0.0
    CTYPE2  = 'DEC--ARC'
    CRVAL2  =        69.9079999924
    CDELT2  =      0.0002273333375
    CRPIX2  =                 95.5
    CROTA2  =          24.26000023
    CTYPE3  = 'FREQ    '
    CRVAL3  =               1.49e9
    CDELT3  =                5.0e7
    CRPIX3  =                  1.0
    CROTA3  =                  0.0
    CTYPE4  = 'STOKES  '
    CRVAL4  =                  1.0
    CDELT4  =                  1.0
    CRPIX4  =                  1.0
    CROTA4  =                  0.0
    HISTORY --------------------------------------------------------------------
    HISTORY /Begin "HISTORY" information found in fits tape header by IMLOD
    HISTORY BLOCKED =                    T /Tape may be blocked
    HISTORY --------------------------------------------------------------------
    HISTORY /Begin "HISTORY" information found in fits tape header by IMLOD
    HISTORY BLOCKED =                    T /Tape may be blocked
    HISTORY AIPS   IMNAME='NGC3034     ' IMCLASS='SUBIM ' IMSEQ=   1     /
    HISTORY AIPS   USERNO=  135            /
    HISTORY AIPS   CLEAN BMAJ=  5.0000E-04 BMIN=  5.0000E-04 BPA=   0.00
    HISTORY AIPS   CLEAN NITER=     2000 PRODUCT=1   / NORMAL
    HISTORY /END FITS tape header "HISTORY" information
    HISTORY --------------------------------------------------------------------
    HISTORY IMLOD OUTNAME ='
    HISTORY IMLOD OUTSEQ =    0     INTAPE = 1     OUTDISK= 2
    HISTORY IMLOD INFILE = 'FITS2:NGC3034.A                                 '
    HISTORY IMLOD RELEASE = '15JUL94'
    HISTORY SUBIM RELEASE ='15JUL94 '  /********* Start 25-MAR-1994   09:37:01
    HISTORY SUBIM INNAME='M82 in radio'   INCLASS='SUBIM '
    HISTORY SUBIM INSEQ=    1   INDISK=  2
    HISTORY SUBIM INTYPE ='MA'      USERID=  103
    HISTORY SUBIM OUTNAME='M82 in radio'   OUTCLASS='SUBIM '
    HISTORY SUBIM OUTSEQ=    2   OUTDISK=  2
    HISTORY SUBIM BLC    =    1,    1,    1,    1,    1,    1,    1
    HISTORY SUBIM TRC    =  256,  256,    1,    1,    1,    1,    1
    HISTORY SUBIM XINC   =    2      YINC =    2
    HISTORY SUBIM OPCODE = 'AVE '
    HISTORY HGEOM RELEASE ='15JUL94 '  /********* Start 25-MAR-1994   09:37:24
    HISTORY HGEOM INNAME='M82 in radio'   INCLASS='SUBIM '
    HISTORY HGEOM INSEQ=    2   INDISK=  2
    HISTORY HGEOM IN2NAME='M82 in blue '   IN2CLASS='SUBIM '
    HISTORY HGEOM IN2SEQ=    1   IN2DISK=  2
    HISTORY HGEOM OUTNAME='M82 in radio'   OUTCLASS='      '
    HISTORY HGEOM OUTSEQ=    1   OUTDISK=  2
    HISTORY HGEOM BLC =    1,    1,   1,   1,   1,   1,   1
    HISTORY HGEOM TRC =  128,  128,   1,   1,   1,   1,   1
    HISTORY HGEOM IMSIZE =  558,  263          / Output image size
    HISTORY HGEOM  / Interpolation order used was BiCubic
    HISTORY HGEOM  / Indeterminate pixels filled with magic values
    HISTORY HGEOM  /     131164 Pixels blanked due to memory limits or geometry
    HISTORY HGEOM  /          0 Pixels blanked due to input blanked pixels
    HISTORY AIPS   IMNAME='M82 in radio' IMCLASS='HGEOM ' IMSEQ=   1     /
    HISTORY AIPS   USERNO=  103            /
    HISTORY AIPS   CLEAN BMAJ=  5.0000E-04 BMIN=  5.0000E-04 BPA=   0.00
    HISTORY AIPS   CLEAN NITER=     2000 PRODUCT=1   / NORMAL
    HISTORY /END FITS tape header "HISTORY" information
    HISTORY --------------------------------------------------------------------
    HISTORY IMLOD OUTNAME ='
    HISTORY IMLOD OUTSEQ =    0     INTAPE = 1     OUTDISK= 4
    HISTORY IMLOD INFILE = 'FITS2:M82RADIO.FITS                             '
    HISTORY IMLOD RELEASE = '15JAN95'
    HISTORY SUBIM RELEASE ='15JAN95 '  /********* Start 13-SEP-1994   13:00:09
    HISTORY SUBIM INNAME='M82 in radio'   INCLASS='HGEOM '
    HISTORY SUBIM INSEQ=    1   INDISK=  4
    HISTORY SUBIM INTYPE ='MA'      USERID=  103
    HISTORY SUBIM OUTNAME='M82         '   OUTCLASS='Radio '
    HISTORY SUBIM OUTSEQ=    3   OUTDISK=  4
    HISTORY SUBIM BLC    =    1,    1,    1,    1,    1,    1,    1
    HISTORY SUBIM TRC    =  558,  262,    1,    1,    1,    1,    1
    HISTORY SUBIM XINC   =    1      YINC =    1
    HISTORY SUBIM OPCODE = '    '
    ORIGIN  = 'AIPSGorilla (NRAOCV IPX) 15JAN95'
    DATE    = '13/09/94'           / File written on dd/mm/yy
    HISTORY AIPS   IMNAME='M82         ' IMCLASS='Radio ' IMSEQ=   3     /
    HISTORY AIPS   USERNO=  103            /
    HISTORY AIPS   CLEAN BMAJ=  5.0000E-04 BMIN=  5.0000E-04 BPA=   0.00
    HISTORY AIPS   CLEAN NITER=     2000 PRODUCT=1   / NORMAL
    ```

Now we can do conversions between pixel and world coordinates.

!!! note
    WCS transforms use pixel `(0, 0)` as the top-left corner (not 1-indexed!!)

```jldoctest wcs
julia> pixcoords = [0.0  24.0  45.0;  # x coordinates
                    0.0  38.0  98.0]  # y coordinates
2×3 Matrix{Float64}:
 0.0  24.0  45.0
 0.0  38.0  98.0

julia> worldcoords = pix_to_world(wcs, pixcoords)
2×3 Matrix{Float64}:
 267.965   276.539   287.771
 -73.7366  -71.9741  -69.6781

julia> pixcoords = world_to_pix(wcs, worldcoords)
2×3 Matrix{Float64}:
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
