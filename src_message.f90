subroutine message
     implicit none
          write(*,*) "-----------------------------------"
          write(*,*) " Usage: SphericalHarmonics [L][M]  "
          write(*,*) " Options: "
          write(*,*) " [L]=DEGREE "
          write(*,*) " [M]=ORDER "
          write(*,*) " BE SURE THAT:"
          write(*,*) " Always: L => M"
          write(*,*) " M could be negative"
          write(*,*) " ---------------------------------"
          write(*,*) " Examples:ylmg 1 1  "
          write(*,*) "         :ylmg 2 1  "
          write(*,*) "         :ylmg 3 2  "
          write(*,*) " Copyright(C) 2006 Free Software "
          write(*,*) " This is free software;.There is NO warranty"
          write(*,*) " Author: JL"
          write(*,*) " Im stoping now, subroutine  Src_mesagge.f90"
     end subroutine message
