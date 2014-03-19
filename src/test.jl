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
@test maximum(abs(world-expected_world)) < 5e-9

wcsfree(w)
