# This file is for user convenience only and is not used by the model
# Changes to this file will be ignored and overwritten
# Changes to the environment should be made in env_mach_specific.xml
# Run ./case.setup --reset to regenerate this file
. /cluster/installations/lmod/lmod/init/sh
module --force purge 
module load StdEnv
module use /cluster/shared/noresm/eb_mods/modules/all
module load ESMF/8.4.1-iomkl-2021b-ParallelIO-2.5.10 CMake/3.21.1-GCCcore-11.2.0 Python/3.9.6-GCCcore-11.2.0 ParMETIS/4.0.3-iompi-2021b
export ESMFMKFILE=/cluster/shared/noresm/eb_mods/software/ESMF/8.4.1-iomkl-2021b-ParallelIO-2.5.10/lib/esmf.mk
export ESMF_RUNTIME_PROFILE=ON
export ESMF_RUNTIME_PROFILE_OUTPUT=SUMMARY
export HCOLL_MAIN_IB=mlx5_0:1
export KMP_STACKSIZE=64M
export MKL_DEBUG_CPU_TYPE=5
export PIO_VERSION_MAJOR=2
export PIO_LIBDIR=/cluster/shared/noresm/eb_mods/software/ParallelIO/2.5.10-iompi-2021b/lib
export PIO_INCDIR=/cluster/shared/noresm/eb_mods/software/ParallelIO/2.5.10-iompi-2021b/include
export PIO_TYPENAME_VALID_VALUES=pnetcdf,netcdf,netcdf4p,netcdf4c
export OMPI_MCA_mpi_leave_pinned=1
export OMPI_MCA_btl=self,vader
export OMPI_MCA_rmaps_rank_file_physical=1
export OMPI_MCA_coll_hcoll_enable=1
export OMPI_MCA_coll=^fca
export OMPI_MCA_coll_hcoll_priority=95
export OMPI_MCA_coll_hcoll_np=8
export OMPI_MCA_io=ompio
export OMPI_MCA_fs_lustre_stripe_size=1048576
export OMPI_MCA_fs_lustre_stripe_width=8
export OMPI_MCA_sharedfp=^lockedfile,individual
export I_MPI_EXTRA_FILESYSTEM_LIST=lustre
export I_MPI_EXTRA_FILESYSTEM=on
