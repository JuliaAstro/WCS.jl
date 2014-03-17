include("WCSLIB.jl")
using WCSLIB
using .Test

p = wcsalloc(2)
cdelt = [-0.345, 0.8993]
ctype = ["RA---CEA", "DEC--CEA"]
wcsmodify(p; cdelt=cdelt,
             ctype=ctype,
             pv=[pvcard(2,1,1.)])
w = unsafe_load(p)
for i = 1:2
    @test unsafe_load(w.cdelt,i) == cdelt[i]
end
@test wcsset(p) == 0
