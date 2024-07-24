#!/bin/bash

set -e

# Created 2024-07-23 11:00:28

CASEDIR="/cluster/home/mvertens/cases/n1850.ne30_f09_tn14.twin_hybrid_coare.20240723"

/cluster/projects/nn9560k/mvertens/src/noresm2_5_alpha03/cime/scripts/create_newcase --case "${CASEDIR}" --compset N1850 --res ne30pg3_f09_tn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./pelayout

./xmlchange NTASKS=1920

./xmlchange NTASKS_OCN=256

./xmlchange ROOTPE_OCN=1920

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./xmlchange STOP_N=10

./xmlchange STOP_OPTION=nyears

./xmlchange DOUT_S_ROOT=/nird/datalake/NS2345K/mvertens/twin_hybrid_coare.20240723

./case.setup

./case.build

./xmlchange JOB_WALLCLOCK_TIME=1-18:00:00

./case.submit

./xmlchange JOB_WALLCLOCK_TIMTE=1D-18:00:00

./xmlchange JOB_WALLCLOCK_TIME=1D-18:00:00

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=1d-18:00:00

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=1-18:0:0

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=2-0:0:0

./case.submit

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./xmlchange STOP_N=6

./case.submit

./xmlchange STOP_N=10

./xmlchange JOB_WALLCLOCK_TIME=2d-0:0:0

./xmlchange --subgroup case.st_archive JOB_WALLCLOCK_TIME=00:20:00

./case.submit

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=1-18:0:0

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./xmlchange STOP_N=6

./case.submit

./xmlchange STOP_N=4

./xmlchange CONTINUE_RUN=TRUe

./xmlchange CONTINUE_RUN=TRUE

./case.submit

