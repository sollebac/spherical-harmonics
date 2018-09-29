subroutine readlinesfile(filein, NofL) 
!! function : read the number of lines of a file 
!! input: filein
!! output: NofL , NumberOfLines
implicit none
integer, intent(out) :: NofL
character(len=80) :: filein
logical :: filexist
integer :: error 
!!!====== begin executable ====================        
!!!===begin to count the number of lines of name_file========
    NofL=0
     open(91,FILE=filein,status="unknown") 
       do
        read(91,*, Iostat=error)
         IF (error == -1) EXIT
         NofL=NofL+1
        end do      
      close(91)          
end subroutine readlinesfile


