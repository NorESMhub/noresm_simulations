#! /bin/bash

## Simple unit test for utility functions

scriptdir="$(cd $(dirname $0); pwd -P)"
pdir="$(cd ${scriptdir}/..; pwd -P)"
testdir="${pdir}/tests"
tmpdir="${testdir}/tmp"
testrepos="${testdir}/test_repos"
test_scripts="${testdir}/test_src/test_scripts.sh"
utilities="${pdir}/Tool/utils.sh"

declare LOGPASS=${LOGPASS:-"yes"}
declare NUMTESTS=0
declare NUMFAIL=0

# Load the test script functions
source ${test_scripts}
res=$?
if [ ${res} -ne 0 ]; then
    echo "ERROR loading test script functions, '${test_scripts}'"
    exit 1
fi

# Load the script
source ${utilities}
perr $? "loading utilities script, '${utils}'"

# Create and run tests
# yn_query
prompt="Answer yes to this prompt"
yn_query ${prompt}
res=$?
check_test "yn_query with yes answer" "${res}" "0"
prompt="Answer no to this prompt"
yn_query ${prompt}
res=$?
check_test "yn_query with no answer" "${res}" "1"

# query

prompts='1:"Choice@A"%2:"Choice@B"%5:"Choice@C"'
prompt="Answer 5 to this prompt:"
query "${prompts}" ${prompt}
res=$?
check_test "query with prompts" "${res}" "5"

report_test_results "utility" ${NUMTESTS} ${NUMFAIL}

declare -A test_total=$(last_test_total)
declare -A test_fail=$(last_test_fail)

utility_test_total() {
    ## Report the total number of utility tests run
    echo "${test_total}"
}

utility_test_failures() {
    ## Report the total number of failed utility tests
    echo "${test_fail}"
}
