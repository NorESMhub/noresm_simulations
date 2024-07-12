#!/bin/bash

set -e

# Created 2024-06-17 16:44:44

CASEDIR="/cluster/home/mvertens/noresm/test_b1850_ghgmam4"

/cluster/projects/nn2345k/mvertens/src/noresm2_5_alpha03_cam/cime/scripts/create_newcase --case "${CASEDIR}" --compset 1850_CAM%DEV%LT%GHGMAM4_CLM51%SP_CICE_BLOM%ECO_MOSART_SGLC_SWAV_SESP --res ne30pg3_tn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./pelayout

./xmlchange NTASKS_ATM=1536

./xmlchange TASKS_LND=1024

./xmlchange NTASKS_LND=1024

./xmlchange NTASKS_ATM=1920

./xmlchange NTASKS_CPL=1029

./xmlchange NTASKS_LND=640

./xmlchange NTASKS_ICE=1152

./xmlchange NTASKS_OCN=384

./xmlchange NTASKS_ROF=512

./xmlchange NTASKS_GLC=64

./xmlchange NTASKS_WAV=64

./xmlchange ROOTPE_ICE=704

./xmlchange ROOTPE_OCN=1920

./xmlchange ROOTPE_GLC=1856

./xmlchange ROOTPE_WAV=1792

./case.setup

./case.build

./xmlchange NTASKS_OCN=354

./case.setup --reset

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./preview_namelists

./case.build

./case.submit

./xmlchange OCN_NCPL=24

./xmlchange CPL_SEQ_OPTION=OPTION1

./preview_namelists

./case.submit

./xmlchange PIO_TYPENAME=netcdf

./case.submit

./case.build

./case.submit

./case.submit

./xmlchange STOP_OPTION=nyears

./xmlchange STOP_N=10

./pelayout

./xmlchange ROOTPE_ICE=640

./case.setup --reset

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.build

./case.build

./case.submit

./pelayout

./pelayout

./xmlchange NTASKS=1920

./xmlchange NTASKS_OCN=354

./xmlchange ROOTPE_OCN=0

./xmlchange ROOTPE_OCN=1920

./case.setup --reset

./case.build

./case.submit

./xmlchange REST_N=1

./xmlchange JOB_WALLCLOCK_TIME=48:00:00

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=36:00:00

./case.submit

./xmlchange STOP_N=6

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./xmlchange CONTINUE_RUN=TRUE

