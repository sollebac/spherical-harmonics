##  Makefile:
##  Martes 10 Mayo 2006, Leon, Gto. Mex. 15:40 hrs
##  Author: J.L. Cabellos
##  ====================================
F90=ifort
FFLAGS =-O3 
ECHO=@echo
##  ====================================
ylmg_exeV1.0	: src_ylmg_exe.o src_sphericalharmonics.o linuxcommand.o src_writeylm.o src_message.o src_factorial.o src_plm.o src_cart2spherical.o src_check_sphericalharmonics.o src_readlinesfile.o
		${F90} ${FFLAGS} -o ylmg_exeV1.0  src_ylmg_exe.o src_sphericalharmonics.o linuxcommand.o src_writeylm.o src_message.o src_factorial.o src_plm.o src_cart2spherical.o  src_check_sphericalharmonics.o src_readlinesfile.o

src_ylmg_exe.o	:src_ylmg_exe.f90
		${F90} ${FFLAGS} -c src_ylmg_exe.f90

src_sphericalharmonics.o	: src_sphericalharmonics.f90
				${F90} ${FFLAGS} -c src_sphericalharmonics.f90

linuxcommand.o	:linuxcommand.c
		cc -c linuxcommand.c

src_writeylm.o	:src_writeylm.f90
		${F90} ${FFLAGS} -c src_writeylm.f90

src_message.o	:src_message.f90
		${F90} ${FFLAGS} -c src_message.f90
src_factorial.o	:src_factorial.f90
		${F90} ${FFLAGS} -c src_factorial.f90

src_plm.o	:src_plm.f90
		${F90} ${FFLAGS} -c src_plm.f90

src_cart2spherical.o	:src_cart2spherical.f90
			${F90} ${FFLAGS} -c src_cart2spherical.f90

src_check_sphericalharmonics.o	:src_check_sphericalharmonics.f90
				${F90} ${FFLAGS} -c src_check_sphericalharmonics.f90


src_readlinesfile.o	:src_readlinesfile.f90
			${F90} ${FFLAGS} -c src_readlinesfile.f90

help    :
	$(ECHO) "   make               - compila and link       "
	$(ECHO) "   make help          - display this info      "
	$(ECHO) "   make clean         - clean all: *.o, *~     "
	$(ECHO) "   make note          - author's personal note "
	$(ECHO) "   make update        - update /home/jl/bin/GGvectors_exe " 
	$(ECHO) "   make cancel        - cancel /home/jl/bin/GGvectors_exe"

clean	:
	$(ECHO) "Cleaning files trash..."
	 rm -f *.o
	 rm -f *~
	 rm -f fort.*
	 rm -f *.mod
