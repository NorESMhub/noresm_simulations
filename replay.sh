#!/bin/bash

set -e

# Created 2024-06-17 15:02:39

CASEDIR="/cluster/home/mvertens/noresm/test_nf1850oslo_trigrid"

/cluster/projects/nn2345k/mvertens/src/noresm2_5_alpha03_cam/cime/scripts/create_newcase --case "${CASEDIR}" --compset NF1850oslo --res a%ne30np4.pg3_l%0.9x1.25_oi%ne30np4.pg3_r%r05_w%null_z%null_g%null_m%tnx1v4 --project nn9039k --run-unsupported

cd "${CASEDIR}"

./xmlchange NTASKS=1536

./case.setup

./preview_namelists

./case.build

./case.submit

./xmlchange STOP_OPTION=nyears

./xmlchange JOB_WALLCLOCK_TIME=24:00:00

./case.submit

./xmlchange STOP_OPTION=nyears

./xmlchange DEBUG=TRUE

./case.build --clean-all

./case.build

./xmlchange HIST_N=1

./xmlchange HIST_OPTION=ndays

./case.submit

./xmlchange HIST_OPTION=monthly

./xmlchange HIST_OPTION=nmonths

./xmlchange HIST_N=1

./xmlchange DEBUG=FALSE

./case.build --clean-all

./case.build

./case.submit

./case.build

./case.submit

