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