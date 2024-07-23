#!/bin/bash

set -e

# Created 2024-07-12 14:07:19

CASEDIR="/cluster/home/mvertens/cases/n1850.ne30_f09_tn14.twin_hybrid.20240712"

/cluster/projects/nn9560k/mvertens/src/noresm2_5_alpha03/cime/scripts/create_newcase --case "${CASEDIR}" --compset N1850 --res ne30pg3_f09_tn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./case.setup

./xmlchange NTASKS=1920

./xmlchange ROOTPE=0

./xmlchange NTASKS_OCN=128

./xmlchange ROOTPE_OCN=1920

./xmlchange STOP_OPTION=nyears

./xmlchange STOP_N=5

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./xmlchange RESUBMIT=1

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./case.setup --reset

./case.build

./xmlchange STOP_N=6

./xmlchange RESUBMIT=0

./case.submit

./xmlchange CONTINUE_RUN=TRUE

./case.submit

./xmlchange STOP_N=4

./case.submit

./xmlchange DOUT_S_ROOT=/nird/datalake/NS2345k/mvertens/n1850.ne30_f09_tn14.twin_hybrid.20240712

./xmlchange DOUT_S_ROOT=/nird/datalake/NS2345K/mvertens/n1850.ne30_f09_tn14.twin_hybrid.20240712

./pelayout

