v0.2.0 (2017-08-07)
===================

- Drop support for Julia 0.4
- Clear deprecation warnings in Julia 0.6, master
- Thread safety fix in WCSTransform()

v0.1.3 (2016-08-09)
===================

- Thread safety improvements: Added thread locks around header parsing
  functions (known to be thread unsafe); fix for race condition in
  `world_to_pix` and `pix_to_world`.
- Added `WCS.wcslib_version()` function.
- Fixed bug in throwing exceptions from WCSLIB.

v0.1.2 (2016-07-28)
===================

- Fix Julia v0.5 deprecation warnings

v0.1.1 (2016-02-07)
===================

- Relax `world_to_pix` and `pix_to_world` signatures to allow
  for single coordinate arguments.
- Implement `getindex` for `WCSTransform` so that, for example,
  `wcs[:ctype]` returns the CTYPE attribute. This is consistent
  with the ability to set attributes with `wcs[:ctype] = foo`.

v0.1.0 (2016-02-04)
===================

Initial release. WCS is a replacement for WCSLIB with a more
Julian API.