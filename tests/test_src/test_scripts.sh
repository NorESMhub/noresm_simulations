## Common test script functions

declare -i LAST_TEST_TOTAL=0
declare -i LAST_TEST_FAIL=0

perr() {
    ## If the first argument is non-zero, exit the script
    ## If the second argument exists, print it as an error message
    ## With no second argument, print a generic error message

    if [ $1 -ne 0 ]; then
        if [ $# -gt 1 ]; then
            echo "ERROR (${1}): ${2}"
        else
            echo "ERROR ${1}"
        fi
        exit ${1}
    fi
}

check_test() {
    ## Check to see if a test passed or failed
    ## $1 is a test description
    ## $2 is the test result
    ## $3 is the expected result
    NUMTESTS=$((NUMTESTS + 1))
    if [ "${2}" == "${3}" ]; then
        if [ "${LOGPASS}" == "yes" ]; then
            echo "${1}: PASS"
        fi
    else
        NUMFAIL=$((NUMFAIL + 1))
        echo "${1}: FAIL"
        echo "Found:    '${2}'"
        echo "Expected: '${3}'"
    fi
}

report_test_results() {
    ## Report the results of a test script
    ## $1 is the name of the test category
    ## $2 is the total number of tests
    ## $3 if the number of test failures
    echo ""
    echo "****************************"
    LAST_TEST_TOTAL=${2}
    LAST_TEST_FAIL=${3}
    echo "Total ${1} tests run: ${LAST_TEST_TOTAL}"
    if [ ${LAST_TEST_FAIL} -gt 0 ]; then
        echo "${LAST_TEST_FAIL} ${1} tests FAILed"
    else
        echo "All ${1} tests PASSed"
    fi
    echo "****************************"
}

last_test_total() {
    # Return the number of total tests for the last call to report_test_results
    echo "${LAST_TEST_TOTAL}"
}

last_test_fail() {
    # Return the number of failed tests for the last call to report_test_results
    echo "${LAST_TEST_FAIL}"
}
