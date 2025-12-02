using WCS: WCSTransform, from_header
using FITSIO: FITSHeader

@testset "interface" begin
    header = FITSHeader(
        ["CRPIX1", "CRVAL1", "CDELT1", "CRPIX2", "CRVAL2", "CDELT2"],
        [500.5, 170.014, -0.00065, 500.5, 55.9909, 0.00065],
        ["", "", "", "", "", ""]
    )

    wcs = from_header(header; ignore_rejected = true)

    @test length(wcs) == 1
    @test wcs[1] isa WCSTransform
end
