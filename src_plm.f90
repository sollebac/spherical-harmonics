 FUNCTION plm(l,m,x) 
    implicit none 
!!!Computes the associated legendre plynomial plm(x)
!!!here m and l are integers satisfying 0<=m<=l and -1<x<1 
!!!real :: plm,x,pmm,pmmp1,pll,somx2,fact
    double precision :: plm,x,pmm,pmmp1,pll,somx2,fact
    integer :: l,m,ll,i
     if ((x.eq.1.d0)) then   !x not could be 1.0 nither -1.0
          x=x-(dble(EPSILON(0.0)))
     endif
       if (x.eq.-1.d0) then
           x=x+(dble(EPSILON(0.0)))          
       endif 
    pmm=1.d0
     if (m.gt.0) then         
     somx2=sqrt((1.-x)*(1.+x))
     fact=1
       do i=1,m
       pmm=-pmm*fact*somx2
       fact=fact+2
       enddo
     endif
       if (l.eq.m) then
           plm=pmm
       else
          pmmp1=x*(2*m+1)*pmm    !compute pm,m+1           
          if (l.eq.(m+1)) then
            plm=pmmp1
            else
             do ll=(m+2),l
                pll=(x*(2*ll-1)*pmmp1-(ll+m-1)*pmm)/(ll-m)
                pmm=pmmp1
                pmmp1=pll
             enddo
             plm=pll
          endif
      endif 
    end function plm
!!!===============================================
