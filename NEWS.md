v0.6.0 (2018-??-??)
===================

- WCSLIB has been upgraded to v6.2. Note that now the `obsgeo` field of
  `WCSTransform` is a 6-element vector, instead of the previous 3-element
  vector.  For backward compatibility, a 3-element vector can still be provided
  and it will be automatically adjusted.

v0.5.0 (2018-11-06)
===================

- WCSLIB has been upgraded to v5.20.

v0.4.0 (2018-09-16)
===================

- Drop support for Julia 0.6
- The syntax to access properties of a `WCSTransform` object has been changed
  from `wcs[:ctype]` to the more familiar `wcs.ctype`.  Likewise, the new syntax
  to set these properties is `wcs.ctype = foo`.  The old syntaxes are still
  available but deprecated, they will be completely removed in a future version
  of the package.

v0.3.0 (2018-09-05)
===================

- Drop support for Julia 0.5
- The `relax` keyword now defaults to accept all known non-standard keywords.
  The old default behavior can be obtained with `relax=WCS.HDR_NONE`.
- Use BinaryProvider to install the binary dependency

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
