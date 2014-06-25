using BinDeps
@BinDeps.setup

version = "4.23"
url = "ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib-$version.tar.bz2"

wcs = library_dependency("libwcs")
provides(Sources, URI(url), wcs, unpacked_dir="wcslib-$version")
builddir = joinpath(BinDeps.depsdir(wcs), "src/wcslib-$version")
provides(BuildProcess, Autotools(libtarget="C/libwcs.so.$version", builddir=builddir), wcs)

@BinDeps.install [:libwcs => :libwcs]
