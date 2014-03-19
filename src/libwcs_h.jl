# Julia wrapper for header: ../deps/usr/include/wcslib/wcshdr.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

function wcserr_enable(enable::Integer)
    ccall((:wcserr_enable,libwcs),Cint,(Cint,),enable)
end
function wcserr_prt(err::Ptr{wcserr},prefix::ASCIIString)
    ccall((:wcserr_prt,libwcs),Cint,(Ptr{wcserr},Ptr{Uint8}),err,prefix)
end
function wcserr_clear(err::Ptr{Ptr{wcserr}})
    ccall((:wcserr_clear,libwcs),Cint,(Ptr{Ptr{wcserr}},),err)
end
function wcserr_copy(src::Ptr{wcserr},dst::Ptr{wcserr})
    ccall((:wcserr_copy,libwcs),Cint,(Ptr{wcserr},Ptr{wcserr}),src,dst)
end
function linini(alloc::Integer,naxis::Integer,lin::Ptr{linprm})
    ccall((:linini,libwcs),Cint,(Cint,Cint,Ptr{linprm}),alloc,naxis,lin)
end
function lincpy(alloc::Integer,linsrc::Ptr{linprm},lindst::Ptr{linprm})
    ccall((:lincpy,libwcs),Cint,(Cint,Ptr{linprm},Ptr{linprm}),alloc,linsrc,lindst)
end
function linfree(lin::Ptr{linprm})
    ccall((:linfree,libwcs),Cint,(Ptr{linprm},),lin)
end
function linprt(lin::Ptr{linprm})
    ccall((:linprt,libwcs),Cint,(Ptr{linprm},),lin)
end
function linset(lin::Ptr{linprm})
    ccall((:linset,libwcs),Cint,(Ptr{linprm},),lin)
end
function linp2x(lin::Ptr{linprm},ncoord::Integer,nelem::Integer,pixcrd::Ptr{Cdouble},imgcrd::Ptr{Cdouble})
    ccall((:linp2x,libwcs),Cint,(Ptr{linprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),lin,ncoord,nelem,pixcrd,imgcrd)
end
function linx2p(lin::Ptr{linprm},ncoord::Integer,nelem::Integer,imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble})
    ccall((:linx2p,libwcs),Cint,(Ptr{linprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),lin,ncoord,nelem,imgcrd,pixcrd)
end
function matinv(n::Integer,mat::Ptr{Cdouble},inv::Ptr{Cdouble})
    ccall((:matinv,libwcs),Cint,(Cint,Ptr{Cdouble},Ptr{Cdouble}),n,mat,inv)
end
function prjini(prj::Ptr{prjprm})
    ccall((:prjini,libwcs),Cint,(Ptr{prjprm},),prj)
end
function prjfree(prj::Ptr{prjprm})
    ccall((:prjfree,libwcs),Cint,(Ptr{prjprm},),prj)
end
function prjprt(prj::Ptr{prjprm})
    ccall((:prjprt,libwcs),Cint,(Ptr{prjprm},),prj)
end
function prjset(prj::Ptr{prjprm})
    ccall((:prjset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function prjx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:prjx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function prjs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:prjs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function azpset(prj::Ptr{prjprm})
    ccall((:azpset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function azpx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:azpx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function azps2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:azps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function szpset(prj::Ptr{prjprm})
    ccall((:szpset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function szpx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:szpx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function szps2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:szps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function tanset(prj::Ptr{prjprm})
    ccall((:tanset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function tanx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tanx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function tans2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tans2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function stgset(prj::Ptr{prjprm})
    ccall((:stgset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function stgx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:stgx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function stgs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:stgs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function sinset(prj::Ptr{prjprm})
    ccall((:sinset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function sinx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sinx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function sins2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sins2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function arcset(prj::Ptr{prjprm})
    ccall((:arcset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function arcx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:arcx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function arcs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:arcs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function zpnset(prj::Ptr{prjprm})
    ccall((:zpnset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function zpnx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zpnx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function zpns2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zpns2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function zeaset(prj::Ptr{prjprm})
    ccall((:zeaset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function zeax2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zeax2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function zeas2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zeas2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function airset(prj::Ptr{prjprm})
    ccall((:airset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function airx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:airx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function airs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:airs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function cypset(prj::Ptr{prjprm})
    ccall((:cypset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function cypx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cypx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function cyps2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cyps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function ceaset(prj::Ptr{prjprm})
    ccall((:ceaset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function ceax2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:ceax2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function ceas2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:ceas2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function carset(prj::Ptr{prjprm})
    ccall((:carset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function carx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:carx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function cars2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cars2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function merset(prj::Ptr{prjprm})
    ccall((:merset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function merx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:merx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function mers2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:mers2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function sflset(prj::Ptr{prjprm})
    ccall((:sflset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function sflx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sflx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function sfls2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sfls2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function parset(prj::Ptr{prjprm})
    ccall((:parset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function parx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:parx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function pars2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pars2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function molset(prj::Ptr{prjprm})
    ccall((:molset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function molx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:molx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function mols2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:mols2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function aitset(prj::Ptr{prjprm})
    ccall((:aitset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function aitx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:aitx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function aits2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:aits2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function copset(prj::Ptr{prjprm})
    ccall((:copset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function copx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:copx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function cops2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cops2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function coeset(prj::Ptr{prjprm})
    ccall((:coeset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function coex2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coex2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function coes2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coes2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function codset(prj::Ptr{prjprm})
    ccall((:codset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function codx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:codx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function cods2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cods2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function cooset(prj::Ptr{prjprm})
    ccall((:cooset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function coox2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coox2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function coos2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coos2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function bonset(prj::Ptr{prjprm})
    ccall((:bonset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function bonx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:bonx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function bons2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:bons2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function pcoset(prj::Ptr{prjprm})
    ccall((:pcoset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function pcox2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pcox2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function pcos2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pcos2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function tscset(prj::Ptr{prjprm})
    ccall((:tscset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function tscx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function tscs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function cscset(prj::Ptr{prjprm})
    ccall((:cscset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function cscx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function cscs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function qscset(prj::Ptr{prjprm})
    ccall((:qscset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function qscx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:qscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function qscs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:qscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function hpxset(prj::Ptr{prjprm})
    ccall((:hpxset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function hpxx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:hpxx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function hpxs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:hpxs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function xphset(prj::Ptr{prjprm})
    ccall((:xphset,libwcs),Cint,(Ptr{prjprm},),prj)
end
function xphx2s(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:xphx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end
function xphs2x(prj::Ptr{prjprm},nx::Integer,ny::Integer,sxy::Integer,spt::Integer,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:xphs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end
function celini(cel::Ptr{celprm})
    ccall((:celini,libwcs),Cint,(Ptr{celprm},),cel)
end
function celfree(cel::Ptr{celprm})
    ccall((:celfree,libwcs),Cint,(Ptr{celprm},),cel)
end
function celprt(cel::Ptr{celprm})
    ccall((:celprt,libwcs),Cint,(Ptr{celprm},),cel)
end
function celset(cel::Ptr{celprm})
    ccall((:celset,libwcs),Cint,(Ptr{celprm},),cel)
end
function celx2s(cel::Ptr{celprm},nx::Integer,ny::Integer,sxy::Integer,sll::Integer,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},lng::Ptr{Cdouble},lat::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:celx2s,libwcs),Cint,(Ptr{celprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),cel,nx,ny,sxy,sll,x,y,phi,theta,lng,lat,stat)
end
function cels2x(cel::Ptr{celprm},nlng::Integer,nlat::Integer,sll::Integer,sxy::Integer,lng::Ptr{Cdouble},lat::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cels2x,libwcs),Cint,(Ptr{celprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),cel,nlng,nlat,sll,sxy,lng,lat,phi,theta,x,y,stat)
end
function specx(_type::Ptr{Uint8},spec::Real,restfrq::Real,restwav::Real,specs::Ptr{spxprm})
    ccall((:specx,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{spxprm}),_type,spec,restfrq,restwav,specs)
end
function freqafrq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqafrq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function afrqfreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:afrqfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqener(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqener,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function enerfreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:enerfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqwavn(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqwavn,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function wavnfreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavnfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqwave(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function wavefreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavefreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqawav(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function awavfreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function waveawav(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:waveawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function awavwave(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function velobeta(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velobeta,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function betavelo(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:betavelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqvelo(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqvelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function velofreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velofreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function freqvrad(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqvrad,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function vradfreq(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:vradfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function wavevelo(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavevelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function velowave(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velowave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function awavvelo(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavvelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function veloawav(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:veloawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function wavevopt(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavevopt,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function voptwave(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:voptwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function wavezopt(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavezopt,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function zoptwave(param::Real,nspec::Integer,instep::Integer,outstep::Integer,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zoptwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end
function spcini(spc::Ptr{spcprm})
    ccall((:spcini,libwcs),Cint,(Ptr{spcprm},),spc)
end
function spcfree(spc::Ptr{spcprm})
    ccall((:spcfree,libwcs),Cint,(Ptr{spcprm},),spc)
end
function spcprt(spc::Ptr{spcprm})
    ccall((:spcprt,libwcs),Cint,(Ptr{spcprm},),spc)
end
function spcset(spc::Ptr{spcprm})
    ccall((:spcset,libwcs),Cint,(Ptr{spcprm},),spc)
end
function spcx2s(spc::Ptr{spcprm},nx::Integer,sx::Integer,sspec::Integer,x::Ptr{Cdouble},spec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:spcx2s,libwcs),Cint,(Ptr{spcprm},Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),spc,nx,sx,sspec,x,spec,stat)
end
function spcs2x(spc::Ptr{spcprm},nspec::Integer,sspec::Integer,sx::Integer,spec::Ptr{Cdouble},x::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:spcs2x,libwcs),Cint,(Ptr{spcprm},Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),spc,nspec,sspec,sx,spec,x,stat)
end
function spctype(ctype::Ptr{Uint8},stype::Ptr{Uint8},scode::Ptr{Uint8},sname::Ptr{Uint8},units::Ptr{Uint8},ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},err::Ptr{Ptr{wcserr}})
    ccall((:spctype,libwcs),Cint,(Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Ptr{wcserr}}),ctype,stype,scode,sname,units,ptype,xtype,restreq,err)
end
function spcspxe(ctypeS::Ptr{Uint8},crvalS::Real,restfrq::Real,restwav::Real,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalX::Ptr{Cdouble},dXdS::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spcspxe,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS,crvalS,restfrq,restwav,ptype,xtype,restreq,crvalX,dXdS,err)
end
function spcxpse(ctypeS::Ptr{Uint8},crvalX::Real,restfrq::Real,restwav::Real,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalS::Ptr{Cdouble},dSdX::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spcxpse,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS,crvalX,restfrq,restwav,ptype,xtype,restreq,crvalS,dSdX,err)
end
function spctrne(ctypeS1::Ptr{Uint8},crvalS1::Real,cdeltS1::Real,restfrq::Real,restwav::Real,ctypeS2::Ptr{Uint8},crvalS2::Ptr{Cdouble},cdeltS2::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spctrne,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS1,crvalS1,cdeltS1,restfrq,restwav,ctypeS2,crvalS2,cdeltS2,err)
end
function spcaips(ctypeA::Ptr{Uint8},velref::Integer,ctype::Ptr{Uint8},specsys::Ptr{Uint8})
    ccall((:spcaips,libwcs),Cint,(Ptr{Uint8},Cint,Ptr{Uint8},Ptr{Uint8}),ctypeA,velref,ctype,specsys)
end
function spctyp(ctype::Ptr{Uint8},stype::Ptr{Uint8},scode::Ptr{Uint8},sname::Ptr{Uint8},units::Ptr{Uint8},ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint})
    ccall((:spctyp,libwcs),Cint,(Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Cint}),ctype,stype,scode,sname,units,ptype,xtype,restreq)
end
function spcspx(ctypeS::Ptr{Uint8},crvalS::Real,restfrq::Real,restwav::Real,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalX::Ptr{Cdouble},dXdS::Ptr{Cdouble})
    ccall((:spcspx,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble}),ctypeS,crvalS,restfrq,restwav,ptype,xtype,restreq,crvalX,dXdS)
end
function spcxps(ctypeS::Ptr{Uint8},crvalX::Real,restfrq::Real,restwav::Real,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalS::Ptr{Cdouble},dSdX::Ptr{Cdouble})
    ccall((:spcxps,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble}),ctypeS,crvalX,restfrq,restwav,ptype,xtype,restreq,crvalS,dSdX)
end
function spctrn(ctypeS1::Ptr{Uint8},crvalS1::Real,cdeltS1::Real,restfrq::Real,restwav::Real,ctypeS2::Ptr{Uint8},crvalS2::Ptr{Cdouble},cdeltS2::Ptr{Cdouble})
    ccall((:spctrn,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Cdouble},Ptr{Cdouble}),ctypeS1,crvalS1,cdeltS1,restfrq,restwav,ctypeS2,crvalS2,cdeltS2)
end
function tabini(alloc::Integer,M::Integer,K::Ptr{Cint},tab::Ptr{tabprm})
    ccall((:tabini,libwcs),Cint,(Cint,Cint,Ptr{Cint},Ptr{tabprm}),alloc,M,K,tab)
end
function tabmem(tab::Ptr{tabprm})
    ccall((:tabmem,libwcs),Cint,(Ptr{tabprm},),tab)
end
function tabcpy(alloc::Integer,tabsrc::Ptr{tabprm},tabdst::Ptr{tabprm})
    ccall((:tabcpy,libwcs),Cint,(Cint,Ptr{tabprm},Ptr{tabprm}),alloc,tabsrc,tabdst)
end
function tabfree(tab::Ptr{tabprm})
    ccall((:tabfree,libwcs),Cint,(Ptr{tabprm},),tab)
end
function tabprt(tab::Ptr{tabprm})
    ccall((:tabprt,libwcs),Cint,(Ptr{tabprm},),tab)
end
function tabset(tab::Ptr{tabprm})
    ccall((:tabset,libwcs),Cint,(Ptr{tabprm},),tab)
end
function tabx2s(tab::Ptr{tabprm},ncoord::Integer,nelem::Integer,x::Ptr{Cdouble},world::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tabx2s,libwcs),Cint,(Ptr{tabprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),tab,ncoord,nelem,x,world,stat)
end
function tabs2x(tab::Ptr{tabprm},ncoord::Integer,nelem::Integer,world::Ptr{Cdouble},x::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tabs2x,libwcs),Cint,(Ptr{tabprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),tab,ncoord,nelem,world,x,stat)
end
function wcsnpv(n::Integer)
    ccall((:wcsnpv,libwcs),Cint,(Cint,),n)
end
function wcsnps(n::Integer)
    ccall((:wcsnps,libwcs),Cint,(Cint,),n)
end
function wcsini(alloc::Integer,naxis::Integer,wcs::wcsprm)
    ccall((:wcsini,libwcs),Cint,(Cint,Cint,Ptr{wcsprm}),alloc,naxis,&wcs)
end
function wcssub(alloc::Integer,wcssrc::wcsprm,nsub::Ptr{Cint},axes::Ptr{Cint},wcsdst::wcsprm)
    ccall((:wcssub,libwcs),Cint,(Cint,Ptr{wcsprm},Ptr{Cint},Ptr{Cint},Ptr{wcsprm}),alloc,&wcssrc,nsub,axes,&wcsdst)
end
function wcsfree(wcs::wcsprm)
    ccall((:wcsfree,libwcs),Cint,(Ptr{wcsprm},),&wcs)
end
function wcsprt(wcs::wcsprm)
    ccall((:wcsprt,libwcs),Cint,(Ptr{wcsprm},),&wcs)
end
function wcsperr(wcs::wcsprm,prefix::ASCIIString)
    ccall((:wcsperr,libwcs),Cint,(Ptr{wcsprm},Ptr{Uint8}),&wcs,prefix)
end
function wcsbchk(wcs::wcsprm,bounds::Integer)
    ccall((:wcsbchk,libwcs),Cint,(Ptr{wcsprm},Cint),&wcs,bounds)
end
function wcsset(wcs::wcsprm)
    ccall((:wcsset,libwcs),Cint,(Ptr{wcsprm},),&wcs)
end
function wcsp2s(wcs::wcsprm,ncoord::Integer,nelem::Integer,pixcrd::Ptr{Cdouble},imgcrd::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},world::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wcsp2s,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),&wcs,ncoord,nelem,pixcrd,imgcrd,phi,theta,world,stat)
end
function wcss2p(wcs::wcsprm,ncoord::Integer,nelem::Integer,world::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wcss2p,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),&wcs,ncoord,nelem,world,phi,theta,imgcrd,pixcrd,stat)
end
function wcsmix(wcs::wcsprm,mixpix::Integer,mixcel::Integer,vspan::Ptr{Cdouble},vstep::Real,viter::Integer,world::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble})
    ccall((:wcsmix,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Cdouble,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),&wcs,mixpix,mixcel,vspan,vstep,viter,world,phi,theta,imgcrd,pixcrd)
end
function wcssptr(wcs::wcsprm,i::Ptr{Cint},ctype::Ptr{Uint8})
    ccall((:wcssptr,libwcs),Cint,(Ptr{wcsprm},Ptr{Cint},Ptr{Uint8}),&wcs,i,ctype)
end
function wcspih(header::Ptr{Uint8},nkeyrec::Integer,relax::Integer,ctrl::Integer,nreject::Ptr{Cint},nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcspih,libwcs),Cint,(Ptr{Uint8},Cint,Cint,Cint,Ptr{Cint},Ptr{Cint},Ptr{Ptr{wcsprm}}),header,nkeyrec,relax,ctrl,nreject,nwcs,wcs)
end
function wcsbth(header::Ptr{Uint8},nkeyrec::Integer,relax::Integer,ctrl::Integer,keysel::Integer,colsel::Ptr{Cint},nreject::Ptr{Cint},nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcsbth,libwcs),Cint,(Ptr{Uint8},Cint,Cint,Cint,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Ptr{wcsprm}}),header,nkeyrec,relax,ctrl,keysel,colsel,nreject,nwcs,wcs)
end
function wcstab(wcs::wcsprm)
    ccall((:wcstab,libwcs),Cint,(Ptr{wcsprm},),&wcs)
end
function wcsidx(nwcs::Integer,wcs::Ptr{Ptr{wcsprm}},alts::Ptr{Cint})
    ccall((:wcsidx,libwcs),Cint,(Cint,Ptr{Ptr{wcsprm}},Ptr{Cint}),nwcs,wcs,alts)
end
function wcsbdx(nwcs::Integer,wcs::Ptr{Ptr{wcsprm}},_type::Integer,alts::Ptr{Array_28_Int16})
    ccall((:wcsbdx,libwcs),Cint,(Cint,Ptr{Ptr{wcsprm}},Cint,Ptr{Array_28_Int16}),nwcs,wcs,_type,alts)
end
function wcsvfree(nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcsvfree,libwcs),Cint,(Ptr{Cint},Ptr{Ptr{wcsprm}}),nwcs,wcs)
end
function wcshdo(relax::Integer,wcs::wcsprm,nkeyrec::Ptr{Cint},header::Ptr{Ptr{Uint8}})
    ccall((:wcshdo,libwcs),Cint,(Cint,Ptr{wcsprm},Ptr{Cint},Ptr{Ptr{Uint8}}),relax,&wcs,nkeyrec,header)
end

export wcserr_enable
export wcserr_prt
export wcserr_clear
export wcserr_copy
export linini
export lincpy
export linfree
export linprt
export linset
export linp2x
export linx2p
export matinv
export prjini
export prjfree
export prjprt
export prjset
export prjx2s
export prjs2x
export azpset
export azpx2s
export azps2x
export szpset
export szpx2s
export szps2x
export tanset
export tanx2s
export tans2x
export stgset
export stgx2s
export stgs2x
export sinset
export sinx2s
export sins2x
export arcset
export arcx2s
export arcs2x
export zpnset
export zpnx2s
export zpns2x
export zeaset
export zeax2s
export zeas2x
export airset
export airx2s
export airs2x
export cypset
export cypx2s
export cyps2x
export ceaset
export ceax2s
export ceas2x
export carset
export carx2s
export cars2x
export merset
export merx2s
export mers2x
export sflset
export sflx2s
export sfls2x
export parset
export parx2s
export pars2x
export molset
export molx2s
export mols2x
export aitset
export aitx2s
export aits2x
export copset
export copx2s
export cops2x
export coeset
export coex2s
export coes2x
export codset
export codx2s
export cods2x
export cooset
export coox2s
export coos2x
export bonset
export bonx2s
export bons2x
export pcoset
export pcox2s
export pcos2x
export tscset
export tscx2s
export tscs2x
export cscset
export cscx2s
export cscs2x
export qscset
export qscx2s
export qscs2x
export hpxset
export hpxx2s
export hpxs2x
export xphset
export xphx2s
export xphs2x
export celini
export celfree
export celprt
export celset
export celx2s
export cels2x
export specx
export freqafrq
export afrqfreq
export freqener
export enerfreq
export freqwavn
export wavnfreq
export freqwave
export wavefreq
export freqawav
export awavfreq
export waveawav
export awavwave
export velobeta
export betavelo
export freqvelo
export velofreq
export freqvrad
export vradfreq
export wavevelo
export velowave
export awavvelo
export veloawav
export wavevopt
export voptwave
export wavezopt
export zoptwave
export spcini
export spcfree
export spcprt
export spcset
export spcx2s
export spcs2x
export spctype
export spcspxe
export spcxpse
export spctrne
export spcaips
export spctyp
export spcspx
export spcxps
export spctrn
export tabini
export tabmem
export tabcpy
export tabfree
export tabprt
export tabset
export tabx2s
export tabs2x
export wcsnpv
export wcsnps
export wcsini
export wcssub
export wcsfree
export wcsprt
export wcsperr
export wcsbchk
export wcsset
export wcsp2s
export wcss2p
export wcsmix
export wcssptr
export wcspih
export wcsbth
export wcstab
export wcsidx
export wcsbdx
export wcsvfree
export wcshdo
