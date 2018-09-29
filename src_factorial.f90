function factorial(n)
  implicit none
  integer ::factorial, i,fact
  integer,intent(in) :: n
  

  if (n.lt.0) then
       write(*,*)'Warninig: n has a negative value'
       write(*,*)'I ve STOP in line=10 Src_factorial.f90'
       write(*,*) n
      stop 
  end if

    if (n.eq.0) then
        fact=1
      else
        fact=1
          do i=1,n
            fact=i*fact
          end do
    end if
 factorial=fact
end function factorial
