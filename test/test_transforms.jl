using WCS:
    pix_to_world,
    pix_to_world_full,
    world_to_pix,
    world_to_pix_full

@testset "transforms" begin
    pixcoords = [0.0 24.0 45.0;  # x coords
                 0.0 38.0 98.0]  # y coords

    worldcoords = pix_to_world(wcs, pixcoords)

    expected_world = [267.96547027 276.53931377 287.77080792;
                      -73.73660749 -71.97412809 -69.67813884]

    @test maximum(abs.(worldcoords .- expected_world)) < 5e-9
    pixcoords_out = world_to_pix(wcs, worldcoords)
    @test maximum(abs.(pixcoords_out .- pixcoords)) < 1e-9

    # Test Array{Float64, 1} methods of above
    worldcoords = pix_to_world(wcs, pixcoords[:, 1])
    @test maximum(abs.(worldcoords .- expected_world[:, 1])) < 5e-9
    pixcoords_out = world_to_pix(wcs, worldcoords)
    @test maximum(abs.(pixcoords_out .- pixcoords[:, 1])) < 1e-9

    p2w = WCS.pix_to_world_full(wcs, pixcoords[:, 1])
    @test p2w.pixcoords == pixcoords[:, 1]
    @test p2w.worldcoords ≈ expected_world[:, 1]
    @test p2w.stat == [0]
    @test p2w.imcoords ≈ [-15.65007825, -0.5559561131]
    @test p2w.phi ≈ [-87.96547027027647]
    @test p2w.theta ≈ [73.73660748999083]

    w2p = WCS.world_to_pix_full(wcs, worldcoords)
    @test w2p.pixcoords ≈ [0, 0]  atol=1e-10
    @test w2p.worldcoords ≈ expected_world[:, 1]
    @test w2p.stat == [0]
    @test w2p.imcoords ≈ [-15.65007825, -0.5559561131]
    @test w2p.phi ≈ [-87.96547027027647]
    @test w2p.theta ≈ [73.73660748999083]
end
