
# This file is auto-generated, do not edit. If you want to change
# sharedlib flags, you can edit the cmake_macros in this case. You
# can change flags for specific sharedlibs only by checking COMP_NAME.

CFLAGS :=  -qno-opt-dynamic-align -fp-model precise -std=gnu99 -O2 -debug minimal -no-fma
CPPDEFS := $(CPPDEFS)  -DCESMCOUPLED -DFORTRANUNDERSCORE -DCPRINTEL
CXX_LDFLAGS :=  -cxxlib
CXX_LINKER := FORTRAN
FC_AUTO_R8 := -r8
FFLAGS :=  -qno-opt-dynamic-align  -convert big_endian -assume byterecl -ftz -traceback -assume realloc_lhs -fp-model source -O2 -debug minimal -no-fma
FFLAGS_NOOPT := -O0
FIXEDFLAGS := -fixed
FREEFLAGS := -free
MACRO_FILE := 
MPICC := mpicc
MPICXX := mpicpc
MPIFC := mpifort
NETCDF_C_PATH := /cluster/software/netCDF/4.8.1-iompi-2021b
NETCDF_FORTRAN_PATH := /cluster/software/netCDF-Fortran/4.5.3-iompi-2021b
PIO_FILESYSTEM_HINTS := lustre
PNETCDF_PATH := /cluster/shared/noresm/eb_mods/software/PnetCDF/1.12.3-iompi-2021b
SCC := icc
SCXX := icpc
SFC := ifort
SLIBS := $(SLIBS)  -mkl=cluster
SUPPORTS_CXX := TRUE

