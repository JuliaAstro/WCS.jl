include("WCSLIB.jl")
using WCSLIB
using .Test

w = wcsprm()
wcsini(1, 2, w)
cdelt = [-0.345, 0.8993]
ctype = ["RA---CEA", "DEC--CEA"]
wcsmodify(w; cdelt=cdelt,
             ctype=ctype,
             pv=[pvcard(2,1,1.)])
for i = 1:2
    @test unsafe_load(w.cdelt,i) == cdelt[i]
end
@test wcsset(w) == 0
wcsfree(w)
