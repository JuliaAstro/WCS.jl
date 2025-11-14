@testset "headers" begin
    header = "SIMPLE  =                    T / file does conform to FITS standard             BITPIX  =                  -64 / number of bits per data pixel                  NAXIS   =                    2 / number of data axes                            NAXIS1  =                 3636 / length of data axis 1                          NAXIS2  =                 1939 / length of data axis 2                          EXTEND  =                    T / FITS dataset may contain extensions            COMMENT   FITS (Flexible Image Transport System) format is defined in 'AstronomyCOMMENT   and Astrophysics', volume 376, page 359; bibcode: 2001A&A...376..359H WCSAXES =                    2 / Number of coordinate axes                      CRPIX1  =               1818.0 / Pixel coordinate of reference point            CRPIX2  =                969.5 / Pixel coordinate of reference point            CDELT1  =             -0.00825 / [deg] Coordinate increment at reference point  CDELT2  =              0.00825 / [deg] Coordinate increment at reference point  CUNIT1  = 'deg'                / Units of coordinate increment and value        CUNIT2  = 'deg'                / Units of coordinate increment and value        CTYPE1  = 'RA---CEA'           / Right ascension, cylindrical equal area projectCTYPE2  = 'DEC--CEA'           / Declination, cylindrical equal area projection CRVAL1  =            3.575E+02 / [deg] Coordinate value at reference point      CRVAL2  =            0.000E+00 / [deg] Coordinate value at reference point      PV2_1   =                  1.0 / CEA projection parameter                       LONPOLE =                  0.0 / [deg] Native longitude of celestial pole       LATPOLE =                 90.0 / [deg] Native latitude of celestial pole        RADESYS = 'ICRS'               / Equatorial coordinate system                                                                                                   COMMENT  WCS header keyrecords produced by WCSLIB 5.9                           "

    ws = WCS.from_header(header)
    @test length(ws) == 1
    @test eltype(ws) === WCSTransform

    w = ws[1]
    @test w.naxis == 2

    # Check that `to_header` succeeds and has the right number
    # of records. (Checking exact equality of input and output
    # strings is too demanding, as the exact formatting differs
    # between minor WCSLIB versions. For example,
    # `0.0E+00` vs `0.000E+00`.)
    header_out = WCS.to_header(w)
    @test length(header_out) == 18 * 80

    # test relax keyword
    faulty_header = replace(header, "RADESYS = 'ICRS'" => "RADECSYS= 'FK5' ")
    wcs_relaxed = WCS.from_header(faulty_header)[1]  # default is maximum relaxation
    @test wcs_relaxed.radesys == "FK5"
    wcs_strict = WCS.from_header(faulty_header; relax = WCS.HDR_NONE)[1]  # strict
    @test wcs_strict.radesys == "ICRS"  # defaults to ICRS since EQUINOX not defined
end
