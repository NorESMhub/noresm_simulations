#!/bin/bash

set -e

# Created 2024-06-10 14:20:37

CASEDIR="/cluster/home/mvertens/noresm/test_ghgmam4"

/cluster/projects/nn2345k/mvertens/src/noresm2_5_alpha03_cam/cime/scripts/create_newcase --case "${CASEDIR}" --compset 1850_CAM%DEV%LT%GHGMAM4_CLM51%SP_CICE%PRES_DOCN%DOM_MOSART_SGLC_SWAV_SESP --res ne30pg3_ne30pg3_mtn14 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./case.setup

./preview_namelists

./case.build

./case.submit

./case.submit

./xmlchange STOP_N=5

./xmlchange STOP_OPTION=nyears

./pelayout

./xmlchange NTASKS=2048

./case.setup --reset

./case.build

./pelayout

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./case.build

./case.submit

./pelayout

./pelayout

./xmlchange NTASKS=1024

./case.setup --reset

./case.build

./case.submit

./xmlchange DOUT_S=FALSE

./xmlchange STOP_OPTION=ndays

./xmlchange REST_OPTION=none

./pelayout

./case.submit

