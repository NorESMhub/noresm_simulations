#!/bin/bash

set -e

# Created 2024-07-11 16:40:39

CASEDIR="/cluster/home/mvertens/src/cases/n1850.ne30_f09_tn14.twin_trigrid.20240711"

/cluster/projects/nn9560k/mvertens/src/noresm2_5_alpha03/cime/scripts/create_newcase --case "${CASEDIR}" --compset N1850 --res ne30pg3_f09_tn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./xmlchange NTASKS=1920

./xmlchange ROOTPE=0

./xmlchange NTASKS_OCN=128

./xmlchange ROOTPE_OCN=1920

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./xmlchange STOP_N=5

./xmlchange RESUBMIT=1

./xmlchange RESUBMIT=1

./xmlchange STOP_OPTION=nyears

./case.setup

./case.build

./pelayout

./case.submit

./preview_namelists

./preview_namelists

./case.submit

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./preview_namelists

./case.submit

./case.submit

./xmlchange CONTINUE_RUN=TRUE

./case.submit

