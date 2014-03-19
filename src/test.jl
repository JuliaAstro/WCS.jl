include("WCSLIB.jl")
using WCSLIB
using .Test

w = wcsprm(2;
             cdelt = [-0.066667, 0.066667],
             ctype = ["RA---AIR", "DEC--AIR"],
             crpix = [-234.75, 8.3393],
             crval = [0., -90],
             pv    = [pvcard(2, 1, 45.0)])
@test wcsset(w) == 0

pixcrd = [0. 0; 24 38; 45 98]'
imgcrd = zeros(size(pixcrd)...)
phi = zeros(size(pixcrd)...)
theta = zeros(size(pixcrd)...)
world = zeros(size(pixcrd)...)
stat = zeros(Cint, size(pixcrd)...)
wcsp2s(w, pixcrd, imgcrd, phi, theta, world, stat)
expected_world = [ 267.96547027  -73.73660749;
 276.53931377  -71.97412809;
 287.77080792  -69.67813884]'
@test maximum(abs(world .- expected_world)) < 5e-9
pixcrd2 = similar(pixcrd)
wcss2p(w, world, phi, theta, imgcrd, pixcrd2, stat)
@test maximum(abs(pixcrd .- pixcrd2)) < 1e-9
wcsfree(w)

header = "SIMPLE  =                    T / file does conform to FITS standard             BITPIX  =                  -64 / number of bits per data pixel                  NAXIS   =                    2 / number of data axes                            NAXIS1  =                 3636 / length of data axis 1                          NAXIS2  =                 1939 / length of data axis 2                          EXTEND  =                    T / FITS dataset may contain extensions            COMMENT   FITS (Flexible Image Transport System) format is defined in 'AstronomyCOMMENT   and Astrophysics', volume 376, page 359; bibcode: 2001A&A...376..359H WCSAXES =                    2 / Number of coordinate axes                      CRPIX1  =                 1818 / Pixel coordinate of reference point            CRPIX2  =                969.5 / Pixel coordinate of reference point            CDELT1  =             -0.00825 / [deg] Coordinate increment at reference point  CDELT2  =              0.00825 / [deg] Coordinate increment at reference point  CUNIT1  = 'deg'                / Units of coordinate increment and value        CUNIT2  = 'deg'                / Units of coordinate increment and value        CTYPE1  = 'RA---CEA'           / Right ascension, cylindrical equal area projectCTYPE2  = 'DEC--CEA'           / Declination, cylindrical equal area projection CRVAL1  =                357.5 / [deg] Coordinate value at reference point      CRVAL2  =                    0 / [deg] Coordinate value at reference point      PV2_1   =                    1 / CEA projection parameter                       LONPOLE =                    0 / [deg] Native longitude of celestial pole       LATPOLE =                   90 / [deg] Native latitude of celestial pole        RESTFRQ =                    0 / [Hz] Line rest frequency                       RESTWAV =                    0 / [Hz] Line rest wavelength                      END                                                                             "

(ws,nreject) = wcspih(header)
@test length(ws) == 1
@test eltype(ws) <: wcsprm
@test nreject == 0
w = ws[1]
wcsset(w)
@test w.naxis == 2
wcsfree(w)
