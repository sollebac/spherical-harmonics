  subroutine cart2spherical(gvector,theta,phi,rho)
      implicit none
      double precision, dimension(3) :: gvector
      double precision :: theta,phi
      double precision :: x,y,z,rho
      double precision :: pi

      pi=4.d0*(datan(1.d0))
      x= (gvector(1))     !!x
      y= (gvector(2))     !!y
      z= (gvector(3))     !!z
      rho=dsqrt((x**2)+((y)**2)+((z)**2))
!!!===========================================0
!!! x=0 y=0 z=0
      if ((x.eq.0.d0).and.(y.eq.0.d0).and.(z.eq.0.d0)) then
         theta=0.d0
         phi=0.d0
         return
      end if
!!!===========================================1
!!! x=0 y=0 z=x
      if ((x.eq.0.d0).and.(y.eq.0.d0).and.(z.ne.0.d0)) then
         if (z.gt.0.d0) then !! positivo
            theta=0.d0
            phi=0.d0
         end if
         if (z.lt.0.d0) then !! negativo
            theta=pi
            phi=0.d0
         end if
         return
      end if
!!!===========================================2
!!! x=0 y=x z=0
      if ((x.eq.0.d0).and.(y.ne.0.d0).and.(z.eq.0.d0)) then
         if (y.gt.0.d0) then !! positivo
            theta=pi/2
            phi=pi/2
         end if
         if (y.lt.0.d0) then !! negativo
            theta=pi/2
            phi=(3*pi)/2
         end if
         return
      end if
!!!===========================================3
!!! x=0 y=x z=x
      if ((x.eq.0.d0).and.(y.ne.0.d0).and.(z.ne.0.d0)) then
         theta=dacos((z/rho))
         phi=pi/2
         return
      end if
!!!===========================================4
!!! x=x y=0 z=0
      if ((x.ne.0.d0).and.(y.eq.0.d0).and.(z.eq.0.d0)) then
         if (x.gt.0.d0) then !! positivo
            theta=pi/2
            phi=0.d0
         end if
         if (x.lt.0.d0) then !! negativo
            theta=pi/2
            phi=pi
         end if
         return
      end if
!!!===========================================5
!!! x=x y=0 z=x
      if ((x.ne.0.d0).and.(y.eq.0.d0).and.(z.ne.0.d0)) then
         theta=dacos((z/rho))
         if (x.gt.0.d0) then !! positivo
            phi=0.d0
         end if
         if (x.lt.0.d0) then !! negativo
            phi=pi
         end if
         return
      end if
!!!===========================================6
!!! x=x y=0 z=x
      if ((x.ne.0.d0).and.(y.ne.0.d0).and.(z.eq.0.d0)) then
         theta=pi/2
         if (x.gt.0.d0) then
            phi=dasin(y/(dsqrt(x**2+y**2)))
         endif
         if (x.lt.0.d0) then
            phi=(4.0*datan(1.d0)-dasin(y/(dsqrt(x**2+y**2))))
         endif
         return
      end if
!!!===========================================7
!!! x=x y=0 z=x
      if ((x.ne.0.d0).and.(y.ne.0.d0).and.(z.ne.0.d0)) then
         theta=dacos((z/rho))
         if (x.gt.0.d0) then
            phi=dasin(y/(dsqrt(x**2+y**2)))
         endif
         if (x.lt.0.d0) then
            phi=(4.0*datan(1.d0)-dasin(y/(dsqrt(x**2+y**2))))
         endif
         return
      end if
!!! there are 7 case:
!!! 1=means diferent off zero it could be positive or negative
!!! x y z
!!! 0 0 0
!!! 0 0 1
!!! 0 1 0
!!! 0 1 1
!!! 1 0 0
!!! 1 0 1
!!! 1 1 0
!!! 1 1 1
!!!
    end subroutine cart2spherical
