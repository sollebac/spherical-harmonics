subroutine check_sphericalharmonics(ll,gvector)
  implicit none
!!!children :
!!! Src_sphericalharmonics.f90
!!!page: 312 Quantum Physics
!!!          Gasiorowicz           
!!! \begin{equation}
!!! \displaystyle
!!! \sum_{m=-l}^{m=l}|Y_{lm}\big(\theta, \phi\big)|^2 =\frac{2l+1}{4\pi}
!!! \end{equation}
 
!!!============for call SphericalHarmonics===========
  integer, intent(in) :: ll
  integer :: mm,l,mmm
  double precision, dimension(2) :: ylm,ylmc
  double precision,intent(in),dimension(3) :: gvector
!!!==================================================
  double precision :: sumar,pi
  pi =4.d0*atan(1.d0)
   
  do l=0,ll
     sumar=0.d0
     do mm=-l,l
        !write(*,*)'l',l,'m',mm
        call sphericalharmonics(l,mm,gvector,ylm,ylmc)
        sumar=((abs(ylm(1)**2+ylm(2)**2)))+sumar
       mmm=mm
     end do
  if (abs((sumar-((2*l+1)/(4*pi)))).gt.(0.0000000000001)) then
     write(*,*)'you have problemas in Src_check_sphericalharmonics.f90'
     write(*,*)'your tol=0.0000000000001 was exceded '
     write(*,*)'order',l ,'degree',mmm 
     write(*,*)'gvector',gvector(1),gvector(2),gvector(3)
     stop 
     end if
  end do
  !!! comments: when you get out a variable like: mm out of the 
  !!! cicle it is incremented by one 
end subroutine check_sphericalharmonics
