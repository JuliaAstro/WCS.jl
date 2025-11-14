using ConstructionBase: getproperties, setproperties

@testset "properties" begin
    props = getproperties(wcs)
    @test props.ctype == wcs.ctype == ["RA---AIR", "DEC--AIR"]
    @test props.dateavg == wcs.dateavg == ""
    @test props.alt == wcs.alt == 'B'
    @test props.cdelt == wcs.cdelt == [-0.066667, 0.066667]
    @test props.cd == wcs.cd == [0.0 0.0; 0.0 0.0]
    @test props.obsgeo == wcs.obsgeo == (
        1.0, 2.0, 3.0, 63.43494882292201, -0.004025899381340196, -6.37813776403742e6
    )

    # Test that all public properties can be obtained
    for k in propertynames(wcs)
        @test getproperty(wcs, k) == getproperty(wcs, k)
    end

    # Test that accessing all private properties results in an error
    for k in setdiff(propertynames(wcs, true), propertynames(wcs))
        @test_throws ErrorException getproperty(wcs, k)
    end

    wcs2 = setproperties(wcs; cdelt = [0.1, -0.2])
    @test wcs.cdelt == [-0.066667, 0.066667]
    @test wcs2.cdelt == [0.1, -0.2]
    @test getproperties(wcs) == props
end
