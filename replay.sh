#!/bin/bash

set -e

# Created 2024-06-20 13:12:09

CASEDIR="/cluster/home/mvertens/noresm/test_nf1850oslo_zm"

/cluster/projects/nn2345k/mvertens/src/noresm2_5_alpha03_cam/cime/scripts/create_newcase --compset NF1850oslo --res ne30pg3_ne30pg3_mtn14 --run-unsupported --case "${CASEDIR}" --project nn9039k

cd "${CASEDIR}"

./xmlchange NTASKS=1536

./case.setup

./preview_namelists

./preview_namelists

./case.build

./xmlchange STOP_OPTION=nyears

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

