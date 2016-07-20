using BinDeps
@BinDeps.setup

using Compat

version = "5.13"
url = "ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib-$version.tar.bz2"

wcs = library_dependency("libwcs")
provides(Sources, URI(url), wcs, unpacked_dir="wcslib-$version")
depsdir = BinDeps.depsdir(wcs)
builddir = joinpath(depsdir, "src/wcslib-$version")
prefix = joinpath(depsdir, "usr")
configopts = ["--disable-fortran", "--without-cfitsio", "--without-pgplot",
              "--disable-utils"]
if is_apple()
    libfilename = "libwcs.$version.dylib"
elseif is_unix()
    libfilename = "libwcs.so.$version"
end

provides(BuildProcess,
         (@build_steps begin
            GetSources(wcs)
            @build_steps begin
              ChangeDirectory(builddir)
              FileRule(joinpath(prefix,"lib",libfilename),
                       @build_steps begin
                         `./configure --prefix=$prefix $configopts`
                         `make install`
                         @static(if is_apple() 
                            `ln -s $prefix/lib/libwcs.5.dylib $prefix/lib/libwcs.dylib`
                            end)
                       end)
            end
          end),
         wcs)

@BinDeps.install Dict(:libwcs => :libwcs)
