using ParallelTestRunner: runtests, find_tests, parse_args
using WCS: WCS

const init_code = quote
    using WCS: WCS, WCSTransform

    wcs = WCSTransform(2;
        alt     = 'B',
        cdelt   = [-0.066667, 0.066667],
        colnum  = 2,
        ctype   = ["RA---AIR", "DEC--AIR"],
        crpix   = [-234.75, 8.3393],
        crval   = [0.0, -90.0],
        obsgeo  = [1.0, 2.0, 3.0],
        pc      = [1.0 0.0; 0.0 1.0],
        pv      = [(2, 1, 45.0)],
        velangl = 3,
        wcsname = "WCSLIB.jl",
    )
end

args = parse_args(Base.ARGS)
testsuite = find_tests(@__DIR__)

runtests(WCS, args; testsuite, init_code)
