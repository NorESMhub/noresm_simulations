#!/bin/bash

set -e

# Created 2024-06-11 20:43:50

CASEDIR="/cluster/home/mvertens/noresm/test_nf1850oslo"

/cluster/projects/nn2345k/mvertens/src/noresm2_5_alpha03_cam/cime/scripts/create_newcase --compset NF1850oslo --res ne30pg3_ne30pg3_mtn14 --run-unsupported --case "${CASEDIR}" --project nn9039k

cd "${CASEDIR}"

./case.setup

./case.build

./case.setup

./preview_namelists

./preview_namelists --debug

./case.build

./preview_namelists

./preview_namelists

./preview_namelists

./preview_namelists

./preview_namelists

./case.build

./case.build

./case.build

./case.build

./preview_namelists

./case.submit

./preview_namelists

./preview_namelists

./case.submit

./case.build

./case.build

./case.submit

./case.build

./case.build

./case.submit

./case.build

./case.submit

./case.build

./case.build

./case.build

./pelayout

./xmlchange NTASKS=1024

./case.setup --reset

./case.build

./case.build

./case.submit

./pelayout

./pelayout

./xmlchange NTASKS=1536

./case.setup --reset

./case.build

./case.submit

./pelayout

./xmlchange NTASKS=1024

./case.setup --reset

./case.build

./xmlchange DOUT_S=FALSE

./xmlchange REST_N=never

./xmlchange REST_OPTION=never

./xmlchange REST_OPTION=none

./pelayout

./case.submit

./xmlchange TIMER_LEVEL=7

./case.build

./case.submit

./case.build

./case.build

./case.submit

./case.build

./case.submit

./xmlchange DOUT_S=TRUE

./xmlchange STOP_OPTION=nyears

./xmlchange REST_OPTINO=nyears

./xmlchange REST_OPTION=nyears

./xmlchange REST_N=5

./pelayout

./xmlchange NTASKS=1536

./case.setup --reset

./case.build

./case.submit

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./case.build

./pelayout

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./pelayout

./xmlchange TIMER_LEVEL=9

./pelayout

./pelayout

