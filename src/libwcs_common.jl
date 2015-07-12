# Automatically generated using Clang.jl wrap_c, version 0.0.0
# then hand-edited

using Compat

const unix = 1
const linux = 1

const PVN = 30

const WCSSUB_LONGITUDE = 0x1001
const WCSSUB_LATITUDE = 0x1002
const WCSSUB_CUBEFACE = 0x1004
const WCSSUB_CELESTIAL = 0x1007
const WCSSUB_SPECTRAL = 0x1008
const WCSSUB_STOKES = 0x1010
const WCSCOMPARE_ANCILLARY = 0x0001
const WCSCOMPARE_TILING = 0x0002
const WCSCOMPARE_CRPIX = 0x0004

const WCSHDR_none = 0x00000000
const WCSHDR_all = 0x0000ffff
const WCSHDR_reject = 0x10000000
const WCSHDR_strict = 0x20000000
const WCSHDR_CROTAia = 0x00000001
const WCSHDR_EPOCHa = 0x00000002
const WCSHDR_VELREFa = 0x00000004
const WCSHDR_CD00i00j = 0x00000008
const WCSHDR_PC00i00j = 0x00000010
const WCSHDR_PROJPn = 0x00000020
const WCSHDR_CD0i_0ja = 0x00000040
const WCSHDR_PC0i_0ja = 0x00000080
const WCSHDR_PV0i_0ma = 0x00000100
const WCSHDR_PS0i_0ma = 0x00000200
const WCSHDR_RADECSYS = 0x00000400
const WCSHDR_VSOURCE = 0x00000800
const WCSHDR_DOBSn = 0x00001000
const WCSHDR_LONGKEY = 0x00002000
const WCSHDR_CNAMn = 0x00004000
const WCSHDR_AUXIMG = 0x00008000
const WCSHDR_ALLIMG = 0x00010000
const WCSHDR_IMGHEAD = 0x00100000
const WCSHDR_BIMGARR = 0x00200000
const WCSHDR_PIXLIST = 0x00400000
const WCSHDO_none = 0x00
const WCSHDO_all = 0x0f
const WCSHDO_safe = 0x00
const WCSHDO_DOBSn = 0x01
const WCSHDO_TPCn_ka = 0x02
const WCSHDO_PVn_ma = 0x04
const WCSHDO_CRPXna = 0x08
const WCSHDO_CNAMna = 0x10
const WCSHDO_WCSNna = 0x20

# begin enum lin_errmsg_enum
typealias lin_errmsg_enum Uint32
const LINERR_SUCCESS = (UInt32)(0)
const LINERR_NULL_POINTER = (UInt32)(1)
const LINERR_MEMORY = (UInt32)(2)
const LINERR_SINGULAR_MTX = (UInt32)(3)
const LINERR_DISTORT_INIT = (UInt32)(4)
const LINERR_DISTORT = (UInt32)(5)
const LINERR_DEDISTORT = (UInt32)(6)
# end enum lin_errmsg_enum

immutable linprm
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    dispre::Ptr{disprm}
    disseq::Ptr{disprm}
    piximg::Ptr{Cdouble}
    imgpix::Ptr{Cdouble}
    i_naxis::Cint
    unity::Cint
    affine::Cint
    simple::Cint
    err::Ptr{wcserr}
    tmpcrd::Ptr{Cdouble}
    m_flag::Cint
    m_naxis::Cint
    m_crpix::Ptr{Cdouble}
    m_pc::Ptr{Cdouble}
    m_cdelt::Ptr{Cdouble}
    m_dispre::Ptr{disprm}
    m_disseq::Ptr{disprm}
end

# begin enum prj_errmsg_enum
typealias prj_errmsg_enum Uint32
const PRJERR_SUCCESS = (UInt32)(0)
const PRJERR_NULL_POINTER = (UInt32)(1)
const PRJERR_BAD_PARAM = (UInt32)(2)
const PRJERR_BAD_PIX = (UInt32)(3)
const PRJERR_BAD_WORLD = (UInt32)(4)
# end enum prj_errmsg_enum


immutable prjprm
    flag::Cint
    code::NTuple{4, UInt8}
    r0::Cdouble
    pv::NTuple{30, Cdouble}
    phi0::Cdouble
    theta0::Cdouble
    bounds::Cint
    name::NTuple{40, UInt8}
    category::Cint
    pvrange::Cint
    simplezen::Cint
    equiareal::Cint
    conformal::Cint
    _global::Cint
    divergent::Cint
    x0::Cdouble
    y0::Cdouble
    err::Ptr{wcserr}
    padding::Ptr{Void}
    w::NTuple{10, Cdouble}
    m::Cint
    n::Cint
    prjx2s::Ptr{Void}
    prjs2x::Ptr{Void}
end

# begin enum cel_errmsg_enum
typealias cel_errmsg_enum Uint32
const CELERR_SUCCESS = (UInt32)(0)
const CELERR_NULL_POINTER = (UInt32)(1)
const CELERR_BAD_PARAM = (UInt32)(2)
const CELERR_BAD_COORD_TRANS = (UInt32)(3)
const CELERR_ILL_COORD_TRANS = (UInt32)(4)
const CELERR_BAD_PIX = (UInt32)(5)
const CELERR_BAD_WORLD = (UInt32)(6)
# end enum cel_errmsg_enum

immutable celprm
    flag::Cint
    offset::Cint
    phi0::Cdouble
    theta0::Cdouble
    ref::NTuple{4, Cdouble}
    prj::prjprm
    euler::NTuple{5, Cdouble}
    latpreq::Cint
    isolat::Cint
    err::Ptr{wcserr}
    padding::Ptr{Void}
end

immutable spxprm
    restfrq::Cdouble
    restwav::Cdouble
    wavetype::Cint
    velotype::Cint
    freq::Cdouble
    afrq::Cdouble
    ener::Cdouble
    wavn::Cdouble
    vrad::Cdouble
    wave::Cdouble
    vopt::Cdouble
    zopt::Cdouble
    awav::Cdouble
    velo::Cdouble
    beta::Cdouble
    dfreqafrq::Cdouble
    dafrqfreq::Cdouble
    dfreqener::Cdouble
    denerfreq::Cdouble
    dfreqwavn::Cdouble
    dwavnfreq::Cdouble
    dfreqvrad::Cdouble
    dvradfreq::Cdouble
    dfreqwave::Cdouble
    dwavefreq::Cdouble
    dfreqawav::Cdouble
    dawavfreq::Cdouble
    dfreqvelo::Cdouble
    dvelofreq::Cdouble
    dwavevopt::Cdouble
    dvoptwave::Cdouble
    dwavezopt::Cdouble
    dzoptwave::Cdouble
    dwaveawav::Cdouble
    dawavwave::Cdouble
    dwavevelo::Cdouble
    dvelowave::Cdouble
    dawavvelo::Cdouble
    dveloawav::Cdouble
    dvelobeta::Cdouble
    dbetavelo::Cdouble
    err::Ptr{wcserr}
    padding::Ptr{Void}
end

# begin enum spc_errmsg_enum
typealias spc_errmsg_enum Cint
const SPCERR_NO_CHANGE = (Int32)(-1)
const SPCERR_SUCCESS = (Int32)(0)
const SPCERR_NULL_POINTER = (Int32)(1)
const SPCERR_BAD_SPEC_PARAMS = (Int32)(2)
const SPCERR_BAD_X = (Int32)(3)
const SPCERR_BAD_SPEC = (Int32)(4)
# end enum spc_errmsg_enum

immutable spcprm
    flag::Cint
    _type::NTuple{8, UInt8}
    code::NTuple{4, UInt8}
    crval::Cdouble
    restfrq::Cdouble
    restwav::Cdouble
    pv::NTuple{7, Cdouble}
    w::NTuple{6, Cdouble}
    isGrism::Cint
    padding1::Cint
    err::Ptr{wcserr}
    padding2::Ptr{Void}
    spxX2P::Ptr{Void}
    spxP2S::Ptr{Void}
    spxS2P::Ptr{Void}
    spxP2X::Ptr{Void}
end

# begin enum wcs_errmsg_enum
typealias wcs_errmsg_enum Uint32
const WCSERR_SUCCESS = (UInt32)(0)
const WCSERR_NULL_POINTER = (UInt32)(1)
const WCSERR_MEMORY = (UInt32)(2)
const WCSERR_SINGULAR_MTX = (UInt32)(3)
const WCSERR_BAD_CTYPE = (UInt32)(4)
const WCSERR_BAD_PARAM = (UInt32)(5)
const WCSERR_BAD_COORD_TRANS = (UInt32)(6)
const WCSERR_ILL_COORD_TRANS = (UInt32)(7)
const WCSERR_BAD_PIX = (UInt32)(8)
const WCSERR_BAD_WORLD = (UInt32)(9)
const WCSERR_BAD_WORLD_COORD = (UInt32)(10)
const WCSERR_NO_SOLUTION = (UInt32)(11)
const WCSERR_BAD_SUBIMAGE = (UInt32)(12)
const WCSERR_NON_SEPARABLE = (UInt32)(13)
# end enum wcs_errmsg_enum

immutable pvcard
    i::Cint
    m::Cint
    value::Cdouble
end

immutable pscard
    i::Cint
    m::Cint
    value::NTuple{72, UInt8}
end

immutable wtbarr
    i::Cint
    m::Cint
    kind::Cint
    extnam::NTuple{72, UInt8}
    extver::Cint
    extlev::Cint
    ttype::NTuple{72, UInt8}
    row::Clong
    ndim::Cint
    dimlen::Ptr{Cint}
    arrayp::Ptr{Ptr{Cdouble}}
end

immutable wcsprm
    flag::Cint
    naxis::Cint
    crpix::Ptr{Cdouble}
    pc::Ptr{Cdouble}
    cdelt::Ptr{Cdouble}
    crval::Ptr{Cdouble}
    cunit::Ptr{Void}
    ctype::Ptr{Void}
    lonpole::Cdouble
    latpole::Cdouble
    restfrq::Cdouble
    restwav::Cdouble
    npv::Cint
    npvmax::Cint
    pv::Ptr{pvcard}
    nps::Cint
    npsmax::Cint
    ps::Ptr{pscard}
    cd::Ptr{Cdouble}
    crota::Ptr{Cdouble}
    altlin::Cint
    velref::Cint
    alt::NTuple{4, UInt8}
    colnum::Cint
    colax::Ptr{Cint}
    cname::Ptr{Void}
    crder::Ptr{Cdouble}
    csyer::Ptr{Cdouble}
    dateavg::NTuple{72, UInt8}
    dateobs::NTuple{72, UInt8}
    equinox::Cdouble
    mjdavg::Cdouble
    mjdobs::Cdouble
    obsgeo::NTuple{3, Cdouble}
    radesys::NTuple{72, UInt8}
    specsys::NTuple{72, UInt8}
    ssysobs::NTuple{72, UInt8}
    velosys::Cdouble
    zsource::Cdouble
    ssyssrc::NTuple{72, UInt8}
    velangl::Cdouble
    wcsname::NTuple{72, UInt8}
    ntab::Cint
    nwtb::Cint
    tab::Ptr{tabprm}
    wtb::Ptr{wtbarr}
    lngtyp::NTuple{8, UInt8}
    lattyp::NTuple{8, UInt8}
    lng::Cint
    lat::Cint
    spec::Cint
    cubeface::Cint
    types::Ptr{Cint}
    padding::Ptr{Void}
    lin::linprm
    cel::celprm
    spc::spcprm
    err::Ptr{wcserr}
    m_padding::Ptr{Void}
    m_flag::Cint
    m_naxis::Cint
    m_crpix::Ptr{Cdouble}
    m_pc::Ptr{Cdouble}
    m_cdelt::Ptr{Cdouble}
    m_crval::Ptr{Cdouble}
    m_cunit::Ptr{Void}
    m_ctype::Ptr{Void}
    m_pv::Ptr{pvcard}
    m_ps::Ptr{pscard}
    m_cd::Ptr{Cdouble}
    m_crota::Ptr{Cdouble}
    m_colax::Ptr{Cint}
    m_cname::Ptr{Void}
    m_crder::Ptr{Cdouble}
    m_csyer::Ptr{Cdouble}
    m_tab::Ptr{tabprm}
    m_wtb::Ptr{wtbarr}
end

# begin enum wcshdr_errmsg_enum
typealias wcshdr_errmsg_enum Uint32
const WCSHDRERR_SUCCESS = (UInt32)(0)
const WCSHDRERR_NULL_POINTER = (UInt32)(1)
const WCSHDRERR_MEMORY = (UInt32)(2)
const WCSHDRERR_BAD_COLUMN = (UInt32)(3)
const WCSHDRERR_PARSER = (UInt32)(4)
const WCSHDRERR_BAD_TABULAR_PARAMS = (UInt32)(5)
# end enum wcshdr_errmsg_enum
