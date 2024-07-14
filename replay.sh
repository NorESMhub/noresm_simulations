#!/bin/bash

set -e

# Created 2024-07-11 16:57:54

CASEDIR="/cluster/home/mvertens/src/cases/n1850.ne30_tn14.twin_bigrid.20240711"

/cluster/projects/nn9560k/mvertens/src/noresm2_5_alpha03/cime/scripts/create_newcase --case "${CASEDIR}" --compset N1850 --res ne30pg3_tn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./xmlchange NTASKS=1920

./xmlchange ROOTPE=0

./xmlchange NTASKS_OCN=128

./xmlchange ROOTPE_OCN=1920

./xmlchange BLOM_VCOORD=cntiso_hybrid,BLOM_TURBULENT_CLOSURE=

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./xmlchange RESUBMIT=1

./xmlchange STOP_N=5

./xmlchange STOP_OPTION=nyears

./case.setup

./case.build

./case.submit

./preview_namelists

./xmlchange REST_N=1

./xmlchange REST_OPTION=nyears

./case.submit

./case.submit

./xmlchange RESUBMIT=FALSE

./xmlchange RESUBMIT=0

./xmlchange CONTINUE_RUN=TRUE

./case.submit

