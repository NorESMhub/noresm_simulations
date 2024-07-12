# This file is for user convenience only and is not used by the model
# Changes to this file will be ignored and overwritten
# Changes to the environment should be made in env_mach_specific.xml
# Run ./case.setup --reset to regenerate this file
source /cluster/installations/lmod/lmod/init/csh
module --force purge 
module load StdEnv
module use /cluster/shared/noresm/eb_mods/modules/all
module load ESMF/8.4.1-iomkl-2021b-ParallelIO-2.5.10 CMake/3.21.1-GCCcore-11.2.0 Python/3.9.6-GCCcore-11.2.0 ParMETIS/4.0.3-iompi-2021b
setenv ESMFMKFILE /cluster/shared/noresm/eb_mods/software/ESMF/8.4.1-iomkl-2021b-ParallelIO-2.5.10/lib/esmf.mk
setenv ESMF_RUNTIME_PROFILE ON
setenv ESMF_RUNTIME_PROFILE_OUTPUT SUMMARY
setenv HCOLL_MAIN_IB mlx5_0:1
setenv KMP_STACKSIZE 64M
setenv MKL_DEBUG_CPU_TYPE 5
setenv PIO_VERSION_MAJOR 2
setenv PIO_LIBDIR /cluster/shared/noresm/eb_mods/software/ParallelIO/2.5.10-iompi-2021b/lib
setenv PIO_INCDIR /cluster/shared/noresm/eb_mods/software/ParallelIO/2.5.10-iompi-2021b/include
setenv PIO_TYPENAME_VALID_VALUES pnetcdf,netcdf,netcdf4p,netcdf4c
setenv OMPI_MCA_mpi_leave_pinned 1
setenv OMPI_MCA_btl self,vader
setenv OMPI_MCA_rmaps_rank_file_physical 1
setenv OMPI_MCA_coll_hcoll_enable 1
setenv OMPI_MCA_coll ^fca
setenv OMPI_MCA_coll_hcoll_priority 95
setenv OMPI_MCA_coll_hcoll_np 8
setenv OMPI_MCA_io ompio
setenv OMPI_MCA_fs_lustre_stripe_size 1048576
setenv OMPI_MCA_fs_lustre_stripe_width 8
setenv OMPI_MCA_sharedfp ^lockedfile,individual
setenv I_MPI_EXTRA_FILESYSTEM_LIST lustre
setenv I_MPI_EXTRA_FILESYSTEM on
