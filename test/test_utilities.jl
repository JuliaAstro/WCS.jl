@testset "utilities" begin
    @test_throws ErrorException wcs.obsgeo = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]

    for ctrl in 0:2
        @test_throws ErrorException WCS.obsfix(ctrl, wcs)
    end

    @test_throws ErrorException wcs.obsgeo = [1.0, 2.0, 3.0, 4.0, 5.0, WCS.UNDEFINED]

    WCS.obsfix(1, wcs)
    @test wcs.obsgeo == (
        1.0, 2.0, 3.0, 63.43494882292201, -0.004025899381340196, -6.37813776403742e6
    )

    @test_throws ErrorException wcs.obsgeo = [1.0, 2.0, 3.0, 4.0, 5.0, WCS.UNDEFINED]

    for ctrl in (0, 2)
        @test_throws ErrorException WCS.obsfix(ctrl, wcs)
    end

    # `obsfix(0, wcs)` errored but also reset the last element
    @test wcs.obsgeo == (1.0, 2.0, 3.0, 4.0, 5.0, -6.37813776403742e6)

    @test WCS.wcslib_version() > v"5.0"  # just check that it works

    # Test propagating errors from wcslib.
    # TODO: replace this with a public WCS routine that throws an error.
    @test_throws ErrorException WCS.assert_ok(Cint(1))

    # test rejecting non-ascii strings
    # TODO: replace this with a public WCS routine that throws an error.
    @test_throws AssertionError WCS.convert_string(NTuple{72, UInt8}, "àèìoù")

    # Test repr of WCSTransform
    @test repr(wcs) == "WCSTransform(naxis=2, cdelt=[-0.066667, 0.066667], crval=[0.0, -90.0], crpix=[-234.75, 8.3393])"
end
