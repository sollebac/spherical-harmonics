subroutine sphericalharmonics(l,m,gvector,ylm,ylmc)
  implicit none 
!! Children: 
!! Src_plm.f90, Src_factorial.f90

  INTERFACE 
     FUNCTION plm(l,m,x) 
        implicit none 
        double precision :: plm,x,pmm,pmmp1,pll
        integer :: l,m,ll
     end FUNCTION plm
  END INTERFACE
  INTERFACE 
     Function factorial(n)
        implicit none
        integer :: factorial,i,fact
        integer,intent(in) :: n
     end FUNCTION factorial
  END INTERFACE

  integer, intent(in) :: l,m    
  double precision :: rho 
  double precision :: theta,phi
  double precision :: ylmr,ylmi
  double precision :: pi
  double precision, dimension(2) :: ylm,ylmc
  double precision, dimension(3) :: gvector
!!!======begin executable====================
  pi=4.d0*datan(1.d0) 
  if (abs(m).gt.(abs(l))) then
    write(*,*)'Stop at line=31 Src_sphericalharmonics.f90'
    stop
  end if
  call cart2spherical(gvector,theta,phi,rho)

  ylmr=((dsqrt(((2*(abs(l))+1)*Factorial(((abs(l))-(abs(m)))))/&
       (4*pi*Factorial(((abs(l))+(abs(m)))))))*&
       (plm(abs(l),abs(m),dcos(theta)))*&
       (dcos((m)*phi)))
  ylmi=((dsqrt(((2*(abs(l))+1)*Factorial(((abs(l))-(abs(m)))))/&
       (4*pi*Factorial(((abs(l))+(abs(m)))))))*&
       (plm(abs(l),abs(m),dcos(theta)))*&
       (dsin((m)*phi)))
  if (m.ge.0) then
     ylm(1)=ylmr                   !ylm=ylm(1)+ylm(2) 
     ylm(2)=ylmi
     ylmc(1)=ylmr                  !ylm*=ylm(1)-ylm(2) 
     ylmc(2)=-ylmi               
  endif
  if (m.lt.0) then
     ylm(1)=((-1)**m)*ylmr           !yl-m=-1^m(ylm*)
     ylm(2)=((-1)**m)*(-ylmi)
     ylmc(1)=((-1)**m)*ylmr          !yl-m*=-1^m(ylm)
     ylmc(2)=((-1)**m)*ylmi
  endif
end subroutine sphericalharmonics

   
