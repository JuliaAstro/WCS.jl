# Julia wrapper for header: ../deps/usr/include/wcslib/wcshdr.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function linini(alloc::Cint,naxis::Cint,lin::Ptr{linprm})
    ccall((:linini,libwcs),Cint,(Cint,Cint,Ptr{linprm}),alloc,naxis,lin)
end

function lindis(sequence::Cint,lin::Ptr{linprm},dis::Ptr{disprm})
    ccall((:lindis,libwcs),Cint,(Cint,Ptr{linprm},Ptr{disprm}),sequence,lin,dis)
end

function lincpy(alloc::Cint,linsrc::Ptr{linprm},lindst::Ptr{linprm})
    ccall((:lincpy,libwcs),Cint,(Cint,Ptr{linprm},Ptr{linprm}),alloc,linsrc,lindst)
end

function linfree(lin::Ptr{linprm})
    ccall((:linfree,libwcs),Cint,(Ptr{linprm},),lin)
end

function linprt(lin::Ptr{linprm})
    ccall((:linprt,libwcs),Cint,(Ptr{linprm},),lin)
end

function linperr(lin::Ptr{linprm},prefix::Ptr{Uint8})
    ccall((:linperr,libwcs),Cint,(Ptr{linprm},Ptr{Uint8}),lin,prefix)
end

function linset(lin::Ptr{linprm})
    ccall((:linset,libwcs),Cint,(Ptr{linprm},),lin)
end

function linp2x(lin::Ptr{linprm},ncoord::Cint,nelem::Cint,pixcrd::Ptr{Cdouble},imgcrd::Ptr{Cdouble})
    ccall((:linp2x,libwcs),Cint,(Ptr{linprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),lin,ncoord,nelem,pixcrd,imgcrd)
end

function linx2p(lin::Ptr{linprm},ncoord::Cint,nelem::Cint,imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble})
    ccall((:linx2p,libwcs),Cint,(Ptr{linprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble}),lin,ncoord,nelem,imgcrd,pixcrd)
end

function linwarp(lin::Ptr{linprm},pixblc::Ptr{Cdouble},pixtrc::Ptr{Cdouble},pixsamp::Ptr{Cdouble},nsamp::Ptr{Cint},maxdis::Ptr{Cdouble},maxtot::Ptr{Cdouble},avgdis::Ptr{Cdouble},avgtot::Ptr{Cdouble},rmsdis::Ptr{Cdouble},rmstot::Ptr{Cdouble})
    ccall((:linwarp,libwcs),Cint,(Ptr{linprm},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),lin,pixblc,pixtrc,pixsamp,nsamp,maxdis,maxtot,avgdis,avgtot,rmsdis,rmstot)
end

function matinv(n::Cint,mat::Ptr{Cdouble},inv::Ptr{Cdouble})
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

function prjperr(prj::Ptr{prjprm},prefix::Ptr{Uint8})
    ccall((:prjperr,libwcs),Cint,(Ptr{prjprm},Ptr{Uint8}),prj,prefix)
end

function prjbchk(tol::Cdouble,nx::Cint,ny::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:prjbchk,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),tol,nx,ny,spt,phi,theta,stat)
end

function prjset(prj::Ptr{prjprm})
    ccall((:prjset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function prjx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:prjx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function prjs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:prjs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function azpset(prj::Ptr{prjprm})
    ccall((:azpset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function azpx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:azpx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function azps2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:azps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function szpset(prj::Ptr{prjprm})
    ccall((:szpset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function szpx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:szpx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function szps2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:szps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function tanset(prj::Ptr{prjprm})
    ccall((:tanset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function tanx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tanx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function tans2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tans2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function stgset(prj::Ptr{prjprm})
    ccall((:stgset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function stgx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:stgx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function stgs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:stgs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function sinset(prj::Ptr{prjprm})
    ccall((:sinset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function sinx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sinx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function sins2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sins2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function arcset(prj::Ptr{prjprm})
    ccall((:arcset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function arcx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:arcx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function arcs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:arcs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function zpnset(prj::Ptr{prjprm})
    ccall((:zpnset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function zpnx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zpnx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function zpns2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zpns2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function zeaset(prj::Ptr{prjprm})
    ccall((:zeaset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function zeax2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zeax2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function zeas2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:zeas2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function airset(prj::Ptr{prjprm})
    ccall((:airset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function airx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:airx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function airs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:airs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function cypset(prj::Ptr{prjprm})
    ccall((:cypset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function cypx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cypx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function cyps2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cyps2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function ceaset(prj::Ptr{prjprm})
    ccall((:ceaset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function ceax2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:ceax2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function ceas2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:ceas2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function carset(prj::Ptr{prjprm})
    ccall((:carset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function carx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:carx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function cars2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cars2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function merset(prj::Ptr{prjprm})
    ccall((:merset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function merx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:merx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function mers2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:mers2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function sflset(prj::Ptr{prjprm})
    ccall((:sflset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function sflx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sflx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function sfls2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:sfls2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function parset(prj::Ptr{prjprm})
    ccall((:parset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function parx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:parx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function pars2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pars2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function molset(prj::Ptr{prjprm})
    ccall((:molset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function molx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:molx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function mols2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:mols2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function aitset(prj::Ptr{prjprm})
    ccall((:aitset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function aitx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:aitx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function aits2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:aits2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function copset(prj::Ptr{prjprm})
    ccall((:copset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function copx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:copx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function cops2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cops2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function coeset(prj::Ptr{prjprm})
    ccall((:coeset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function coex2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coex2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function coes2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coes2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function codset(prj::Ptr{prjprm})
    ccall((:codset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function codx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:codx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function cods2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cods2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function cooset(prj::Ptr{prjprm})
    ccall((:cooset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function coox2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coox2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function coos2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:coos2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function bonset(prj::Ptr{prjprm})
    ccall((:bonset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function bonx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:bonx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function bons2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:bons2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function pcoset(prj::Ptr{prjprm})
    ccall((:pcoset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function pcox2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pcox2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function pcos2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:pcos2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function tscset(prj::Ptr{prjprm})
    ccall((:tscset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function tscx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function tscs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:tscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function cscset(prj::Ptr{prjprm})
    ccall((:cscset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function cscx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function cscs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function qscset(prj::Ptr{prjprm})
    ccall((:qscset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function qscx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:qscx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function qscs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:qscs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function hpxset(prj::Ptr{prjprm})
    ccall((:hpxset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function hpxx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:hpxx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function hpxs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:hpxs2x,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,phi,theta,x,y,stat)
end

function xphset(prj::Ptr{prjprm})
    ccall((:xphset,libwcs),Cint,(Ptr{prjprm},),prj)
end

function xphx2s(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:xphx2s,libwcs),Cint,(Ptr{prjprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),prj,nx,ny,sxy,spt,x,y,phi,theta,stat)
end

function xphs2x(prj::Ptr{prjprm},nx::Cint,ny::Cint,sxy::Cint,spt::Cint,phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
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

function celperr(cel::Ptr{celprm},prefix::Ptr{Uint8})
    ccall((:celperr,libwcs),Cint,(Ptr{celprm},Ptr{Uint8}),cel,prefix)
end

function celset(cel::Ptr{celprm})
    ccall((:celset,libwcs),Cint,(Ptr{celprm},),cel)
end

function celx2s(cel::Ptr{celprm},nx::Cint,ny::Cint,sxy::Cint,sll::Cint,x::Ptr{Cdouble},y::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},lng::Ptr{Cdouble},lat::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:celx2s,libwcs),Cint,(Ptr{celprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),cel,nx,ny,sxy,sll,x,y,phi,theta,lng,lat,stat)
end

function cels2x(cel::Ptr{celprm},nlng::Cint,nlat::Cint,sll::Cint,sxy::Cint,lng::Ptr{Cdouble},lat::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},x::Ptr{Cdouble},y::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:cels2x,libwcs),Cint,(Ptr{celprm},Cint,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),cel,nlng,nlat,sll,sxy,lng,lat,phi,theta,x,y,stat)
end

function specx(_type::Ptr{Uint8},spec::Cdouble,restfrq::Cdouble,restwav::Cdouble,specs::Ptr{spxprm})
    ccall((:specx,libwcs),Cint,(Ptr{Uint8},Cdouble,Cdouble,Cdouble,Ptr{spxprm}),_type,spec,restfrq,restwav,specs)
end

function spxperr(spx::Ptr{spxprm},prefix::Ptr{Uint8})
    ccall((:spxperr,libwcs),Cint,(Ptr{spxprm},Ptr{Uint8}),spx,prefix)
end

function freqafrq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqafrq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function afrqfreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:afrqfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqener(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqener,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function enerfreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:enerfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqwavn(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqwavn,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function wavnfreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavnfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqwave(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function wavefreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavefreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqawav(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function awavfreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function waveawav(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:waveawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function awavwave(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function velobeta(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velobeta,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function betavelo(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:betavelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqvelo(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqvelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function velofreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velofreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function freqvrad(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:freqvrad,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function vradfreq(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:vradfreq,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function wavevelo(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavevelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function velowave(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:velowave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function awavvelo(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:awavvelo,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function veloawav(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:veloawav,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function wavevopt(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavevopt,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function voptwave(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:voptwave,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function wavezopt(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wavezopt,libwcs),Cint,(Cdouble,Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),param,nspec,instep,outstep,inspec,outspec,stat)
end

function zoptwave(param::Cdouble,nspec::Cint,instep::Cint,outstep::Cint,inspec::Ptr{Cdouble},outspec::Ptr{Cdouble},stat::Ptr{Cint})
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

function spcperr(spc::Ptr{spcprm},prefix::Ptr{Uint8})
    ccall((:spcperr,libwcs),Cint,(Ptr{spcprm},Ptr{Uint8}),spc,prefix)
end

function spcset(spc::Ptr{spcprm})
    ccall((:spcset,libwcs),Cint,(Ptr{spcprm},),spc)
end

function spcx2s(spc::Ptr{spcprm},nx::Cint,sx::Cint,sspec::Cint,x::Ptr{Cdouble},spec::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:spcx2s,libwcs),Cint,(Ptr{spcprm},Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),spc,nx,sx,sspec,x,spec,stat)
end

function spcs2x(spc::Ptr{spcprm},nspec::Cint,sspec::Cint,sx::Cint,spec::Ptr{Cdouble},x::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:spcs2x,libwcs),Cint,(Ptr{spcprm},Cint,Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),spc,nspec,sspec,sx,spec,x,stat)
end

function spctype(ctype::Array_9_Uint8,stype::Ptr{Uint8},scode::Ptr{Uint8},sname::Ptr{Uint8},units::Ptr{Uint8},ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},err::Ptr{Ptr{wcserr}})
    ccall((:spctype,libwcs),Cint,(Array_9_Uint8,Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Ptr{wcserr}}),ctype,stype,scode,sname,units,ptype,xtype,restreq,err)
end

function spcspxe(ctypeS::Array_9_Uint8,crvalS::Cdouble,restfrq::Cdouble,restwav::Cdouble,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalX::Ptr{Cdouble},dXdS::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spcspxe,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS,crvalS,restfrq,restwav,ptype,xtype,restreq,crvalX,dXdS,err)
end

function spcxpse(ctypeS::Array_9_Uint8,crvalX::Cdouble,restfrq::Cdouble,restwav::Cdouble,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalS::Ptr{Cdouble},dSdX::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spcxpse,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS,crvalX,restfrq,restwav,ptype,xtype,restreq,crvalS,dSdX,err)
end

function spctrne(ctypeS1::Array_9_Uint8,crvalS1::Cdouble,cdeltS1::Cdouble,restfrq::Cdouble,restwav::Cdouble,ctypeS2::Array_9_Uint8,crvalS2::Ptr{Cdouble},cdeltS2::Ptr{Cdouble},err::Ptr{Ptr{wcserr}})
    ccall((:spctrne,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Cdouble,Array_9_Uint8,Ptr{Cdouble},Ptr{Cdouble},Ptr{Ptr{wcserr}}),ctypeS1,crvalS1,cdeltS1,restfrq,restwav,ctypeS2,crvalS2,cdeltS2,err)
end

function spcaips(ctypeA::Array_9_Uint8,velref::Cint,ctype::Array_9_Uint8,specsys::Array_9_Uint8)
    ccall((:spcaips,libwcs),Cint,(Array_9_Uint8,Cint,Array_9_Uint8,Array_9_Uint8),ctypeA,velref,ctype,specsys)
end

function spctyp(ctype::Array_9_Uint8,stype::Ptr{Uint8},scode::Ptr{Uint8},sname::Ptr{Uint8},units::Ptr{Uint8},ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint})
    ccall((:spctyp,libwcs),Cint,(Array_9_Uint8,Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Uint8},Ptr{Cint}),ctype,stype,scode,sname,units,ptype,xtype,restreq)
end

function spcspx(ctypeS::Array_9_Uint8,crvalS::Cdouble,restfrq::Cdouble,restwav::Cdouble,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalX::Ptr{Cdouble},dXdS::Ptr{Cdouble})
    ccall((:spcspx,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble}),ctypeS,crvalS,restfrq,restwav,ptype,xtype,restreq,crvalX,dXdS)
end

function spcxps(ctypeS::Array_9_Uint8,crvalX::Cdouble,restfrq::Cdouble,restwav::Cdouble,ptype::Ptr{Uint8},xtype::Ptr{Uint8},restreq::Ptr{Cint},crvalS::Ptr{Cdouble},dSdX::Ptr{Cdouble})
    ccall((:spcxps,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Ptr{Uint8},Ptr{Uint8},Ptr{Cint},Ptr{Cdouble},Ptr{Cdouble}),ctypeS,crvalX,restfrq,restwav,ptype,xtype,restreq,crvalS,dSdX)
end

function spctrn(ctypeS1::Array_9_Uint8,crvalS1::Cdouble,cdeltS1::Cdouble,restfrq::Cdouble,restwav::Cdouble,ctypeS2::Array_9_Uint8,crvalS2::Ptr{Cdouble},cdeltS2::Ptr{Cdouble})
    ccall((:spctrn,libwcs),Cint,(Array_9_Uint8,Cdouble,Cdouble,Cdouble,Cdouble,Array_9_Uint8,Ptr{Cdouble},Ptr{Cdouble}),ctypeS1,crvalS1,cdeltS1,restfrq,restwav,ctypeS2,crvalS2,cdeltS2)
end

function wcsnpv(n::Cint)
    ccall((:wcsnpv,libwcs),Cint,(Cint,),n)
end

function wcsnps(n::Cint)
    ccall((:wcsnps,libwcs),Cint,(Cint,),n)
end

function wcsini(alloc::Cint,naxis::Cint,wcs::Ptr{wcsprm})
    ccall((:wcsini,libwcs),Cint,(Cint,Cint,Ptr{wcsprm}),alloc,naxis,wcs)
end

function wcssub(alloc::Cint,wcssrc::Ptr{wcsprm},nsub::Ptr{Cint},axes::Ptr{Cint},wcsdst::Ptr{wcsprm})
    ccall((:wcssub,libwcs),Cint,(Cint,Ptr{wcsprm},Ptr{Cint},Ptr{Cint},Ptr{wcsprm}),alloc,wcssrc,nsub,axes,wcsdst)
end

function wcscompare(cmp::Cint,tol::Cdouble,wcs1::Ptr{wcsprm},wcs2::Ptr{wcsprm},equal::Ptr{Cint})
    ccall((:wcscompare,libwcs),Cint,(Cint,Cdouble,Ptr{wcsprm},Ptr{wcsprm},Ptr{Cint}),cmp,tol,wcs1,wcs2,equal)
end

function wcsfree(wcs::Ptr{wcsprm})
    ccall((:wcsfree,libwcs),Cint,(Ptr{wcsprm},),wcs)
end

function wcsprt(wcs::Ptr{wcsprm})
    ccall((:wcsprt,libwcs),Cint,(Ptr{wcsprm},),wcs)
end

function wcsperr(wcs::Ptr{wcsprm},prefix::Ptr{Uint8})
    ccall((:wcsperr,libwcs),Cint,(Ptr{wcsprm},Ptr{Uint8}),wcs,prefix)
end

function wcsbchk(wcs::Ptr{wcsprm},bounds::Cint)
    ccall((:wcsbchk,libwcs),Cint,(Ptr{wcsprm},Cint),wcs,bounds)
end

function wcsset(wcs::Ptr{wcsprm})
    ccall((:wcsset,libwcs),Cint,(Ptr{wcsprm},),wcs)
end

function wcsp2s(wcs::Ptr{wcsprm},ncoord::Cint,nelem::Cint,pixcrd::Ptr{Cdouble},imgcrd::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},world::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wcsp2s,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),wcs,ncoord,nelem,pixcrd,imgcrd,phi,theta,world,stat)
end

function wcss2p(wcs::Ptr{wcsprm},ncoord::Cint,nelem::Cint,world::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble},stat::Ptr{Cint})
    ccall((:wcss2p,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cint}),wcs,ncoord,nelem,world,phi,theta,imgcrd,pixcrd,stat)
end

function wcsmix(wcs::Ptr{wcsprm},mixpix::Cint,mixcel::Cint,vspan::Ptr{Cdouble},vstep::Cdouble,viter::Cint,world::Ptr{Cdouble},phi::Ptr{Cdouble},theta::Ptr{Cdouble},imgcrd::Ptr{Cdouble},pixcrd::Ptr{Cdouble})
    ccall((:wcsmix,libwcs),Cint,(Ptr{wcsprm},Cint,Cint,Ptr{Cdouble},Cdouble,Cint,Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble},Ptr{Cdouble}),wcs,mixpix,mixcel,vspan,vstep,viter,world,phi,theta,imgcrd,pixcrd)
end

function wcssptr(wcs::Ptr{wcsprm},i::Ptr{Cint},ctype::Array_9_Uint8)
    ccall((:wcssptr,libwcs),Cint,(Ptr{wcsprm},Ptr{Cint},Array_9_Uint8),wcs,i,ctype)
end

function wcslib_version(vers::Array_3_Cint)
    ccall((:wcslib_version,libwcs),Ptr{Uint8},(Array_3_Cint,),vers)
end

function wcspih(header::Ptr{Uint8},nkeyrec::Cint,relax::Cint,ctrl::Cint,nreject::Ptr{Cint},nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcspih,libwcs),Cint,(Ptr{Uint8},Cint,Cint,Cint,Ptr{Cint},Ptr{Cint},Ptr{Ptr{wcsprm}}),header,nkeyrec,relax,ctrl,nreject,nwcs,wcs)
end

function wcsbth(header::Ptr{Uint8},nkeyrec::Cint,relax::Cint,ctrl::Cint,keysel::Cint,colsel::Ptr{Cint},nreject::Ptr{Cint},nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcsbth,libwcs),Cint,(Ptr{Uint8},Cint,Cint,Cint,Cint,Ptr{Cint},Ptr{Cint},Ptr{Cint},Ptr{Ptr{wcsprm}}),header,nkeyrec,relax,ctrl,keysel,colsel,nreject,nwcs,wcs)
end

function wcstab(wcs::Ptr{wcsprm})
    ccall((:wcstab,libwcs),Cint,(Ptr{wcsprm},),wcs)
end

function wcsidx(nwcs::Cint,wcs::Ptr{Ptr{wcsprm}},alts::Array_27_Cint)
    ccall((:wcsidx,libwcs),Cint,(Cint,Ptr{Ptr{wcsprm}},Array_27_Cint),nwcs,wcs,alts)
end

function wcsbdx(nwcs::Cint,wcs::Ptr{Ptr{wcsprm}},_type::Cint,alts::Array_1000_Array_28_Int16)
    ccall((:wcsbdx,libwcs),Cint,(Cint,Ptr{Ptr{wcsprm}},Cint,Array_1000_Array_28_Int16),nwcs,wcs,_type,alts)
end

function wcsvfree(nwcs::Ptr{Cint},wcs::Ptr{Ptr{wcsprm}})
    ccall((:wcsvfree,libwcs),Cint,(Ptr{Cint},Ptr{Ptr{wcsprm}}),nwcs,wcs)
end

function wcshdo(relax::Cint,wcs::Ptr{wcsprm},nkeyrec::Ptr{Cint},header::Ptr{Ptr{Uint8}})
    ccall((:wcshdo,libwcs),Cint,(Cint,Ptr{wcsprm},Ptr{Cint},Ptr{Ptr{Uint8}}),relax,wcs,nkeyrec,header)
end
