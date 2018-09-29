program ylmg
  implicit none
  integer :: erase
  integer :: i,j,nn
  logical :: flag
  CHARACTER(LEN=50) :: UnixCommand
  CHARACTER(LEN=80) :: datos
  character(len=80) :: fileGGvectors
  double precision :: x,y,z   
  integer :: NofL
!!!============for call SphericalHarmonics===========
  integer :: l,m
  double precision, dimension(2) :: ylm,ylmc
  double precision, dimension(3) :: gvector
!!!==================================================
   integer   :: IArgC,ArgC,isthis
   character(len=1) :: ArgV(2)
   character(len=30) ::string
!!!===========================================
   fileGGvectors="GGvectors.dat"
   call system("GGvectors_exe") !! make one GGvectors.dat
   CALL FDATE (string)
   print *, 'The current time is: ',string
   call readlinesfile(fileGGvectors,NofL)
   write(*,*)int(sqrt(NofL*1.0)),trim(datos)
   nn=int(sqrt(NofL*1.0))  
!!!--------------------------------
      ArgC=IArgC() !number of arguemnts
     if (ArgC==2) then
          do isthis=1,ArgC
             call GetArg(isthis,ArgV(isthis))
          enddo
       else
         Write(*,*)'ERROR: No arguments Found ...'
         call message
         stop
       endif
  l=(ichar((ArgV(1))))-48
  m=(ichar((ArgV(2))))-48

  if ((l.lt.m).or.(l.lt.0)) then 
  write(*,*)'ERROR: L=<M, M could be negative '
  call message
  stop 
  end if
   
  inquire(file=fileGGvectors,exist=flag)
  if (flag) then    
     open(unit=13,file=fileGGvectors,form='formatted',status='old')
     do i=0,(nn-1)              !theta 0-pi
        do j=0,(nn-1)           !phi 0-2pi
           read(13,*)x,y,z
           gvector(1)=x
           gvector(2)=y
           gvector(3)=z
           call check_sphericalharmonics(l,gvector)
           call sphericalharmonics(l,m,gvector,ylm,ylmc)
         !!call writeylm(30,gvector,((abs(ylm(1)**2+ylm(2)**2))))
           call writeylm(30,gvector,(ylm(1)))
        enddo
     enddo
     close(13)
  else 
     write(*,*)'file: fileGGvectors does not exist !!'
     write(*,*)'Making one ... !!'
     UnixCommand="GGvectors_exe"//CHAR(0)
     call LINUXCOMMAND(UnixCommand)
     open(unit=13,file=fileGGvectors,form='formatted',status='old')
     do i=0,(nn-1)              !theta 0-pi
        do j=0,(nn-1)           !phi 0-2pi
           read(13,*)x,y,z
           gvector(1)=x
           gvector(2)=y
           gvector(3)=z
           call check_sphericalharmonics(l,gvector)         
           call sphericalharmonics(l,m,gvector,ylm,ylmc)
         !!call writeylm(30,gvector,((abs(ylm(1)**2+ylm(2)**2))))
           call writeylm(30,gvector,(ylm(1)))
        enddo
     enddo
     close(13)     
  end if
     call system("cp ~/bin/SphericalHarmonics.g .")
     call system("gnuplot SphericalHarmonics.g")
end program ylmg
 
