using BinDeps
@BinDeps.setup

version = "5.7"
url = "ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib-$version.tar.bz2"

wcs = library_dependency("libwcs")
provides(Sources, URI(url), wcs, unpacked_dir="wcslib-$version")
depsdir = BinDeps.depsdir(wcs)
builddir = joinpath(depsdir, "src/wcslib-$version")
prefix = joinpath(depsdir, "usr")
configopts = ["--disable-fortran", "--without-cfitsio", "--without-pgplot"]
@unix_only libfilename = "libwcs.so.$version"
@osx_only libfilename = "libwcs.dylib"
provides(BuildProcess,
         (@build_steps begin
            GetSources(wcs)
            @build_steps begin
              ChangeDirectory(builddir)
              FileRule(joinpath(prefix,"lib",libfilename),
                       @build_steps begin
                         `./configure --prefix=$prefix $configopts`
                         `make install`
                       end)
            end
          end),
         wcs)

@BinDeps.install [:libwcs => :libwcs]
