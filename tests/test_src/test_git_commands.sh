#! /bin/bash

## Simple unit test for git_commands

scriptdir="$(cd $(dirname $0); pwd -P)"
pdir="$(cd ${scriptdir}/..; pwd -P)"
testdir="${pdir}/tests"
tmpdir="${testdir}/tmp"
testrepos="${testdir}/test_repos"
test_scripts="${testdir}/test_src/test_scripts.sh"
git_commands="${pdir}/Tool/git_commands.sh"

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
source ${git_commands}
perr $? "loading git commands script, '${git_commands}'"

## Set up the temp repos
if [ -d "${tmpdir}" ]; then
    rm -rf ${tmpdir}
fi
mkdir --parents ${tmpdir}
for repo in no_remote good_remote bad_remote; do
    git clone -o NorESMhub ${testrepos}/${repo}.git ${tmpdir}/${repo}
    eval "${repo}=\${tmpdir}/\${repo}"
done
# Customize
(cd ${no_remote};                                                             \
 git remote remove NorESMhub;                                                 \
 git branch noresm25_preindust_coupled)
(cd ${bad_remote};                                                            \
 url="$(git remote get-url NorESMhub | sed -e 's/NorESM/notNorESM/')";        \
 git remote set-url NorESMhub "${url}")
(cd ${good_remote};                                                           \
 git remote set-url NorESMhub "https://github.com/NorESMhub/noresm_simulations")

# Create and run tests
# Test git_current_branch
cbranch="noresm25_preindust_coupled"
res="$(cd ${no_remote}; git_current_branch)"
check_test "git_current_branch with no remote" "${res}" "noresm25_preindust_amip"
res="$(cd ${good_remote}; git_current_branch)"
check_test "git_current_branch with a good remote" "${res}" "${cbranch}"
res="$(cd ${bad_remote}; git_current_branch)"
check_test "git_current_branch with a bad remote" "${res}" "${cbranch}"

# Test git_allowed_branch_name
bname="noresm25_preindust_coupled"
res="$(git_allowed_branch_name ${bname})"
check_test "git_allowed_branch_name test with '${bname}'" "${res}" "${bname}"
bname="noresm25_preindust_amip"
res="$(git_allowed_branch_name ${bname})"
check_test "git_allowed_branch_name test with '${bname}'" "${res}" "${bname}"
bname="main"
res="$(git_allowed_branch_name ${bname})"
check_test "git_allowed_branch_name test with '${bname}'" "${res}" ""
bname="HEAD"
res="$(git_allowed_branch_name ${bname})"
check_test "git_allowed_branch_name test with '${bname}'" "${res}" ""

# Test git_experiment_branches
branches=("noresm25_preindust_amip" "noresm25_preindust_coupled")
res=($(cd ${no_remote}; git_experiment_branches))
check_test "git_experiment_branches with no remote (len)" "${#res[@]}" "${#branches[@]}"
check_test "git_experiment_branches with no remote (0)" "${res[0]}" "${branches[0]}"
check_test "git_experiment_branches with no remote (1)" "${res[1]}" "${branches[1]}"
branches="noresm25_preindust_coupled"
res=($(cd ${good_remote}; git_experiment_branches))
check_test "git_experiment_branches with good remote" "${res}" "${branches}"

# Test git_branch_remote
branch="$(cd ${good_remote}; git_current_branch)"
res="$(cd ${good_remote}; git_branch_remote ${branch})"
check_test "git_branch_remote" "${res}" "NorESMhub"

# Test git_url_switch_protocol
hurl="https://github.com/NorESMhub/noresm_simulations"
surl="git@github.com:NorESMhub/noresm_simulations"
burl="https://gitlab.com/NorESMhub/noresm_simulations"
res="$(git_url_switch_protocol ${hurl})"
check_test "git_url_switch_protocol https to ssh test" "${res}" "${surl}"
res="$(git_url_switch_protocol ${surl})"
check_test "git_url_switch_protocol ssh to https test" "${res}" "${hurl}"
res="$(git_url_switch_protocol ${burl})"
check_test "git_url_switch_protocol https to null test" "${res}" ""

# Test git_url_remote
hurl="https://github.com/NorESMhub/noresm_simulations"
surl="git@github.com:NorESMhub/noresm_simulations"
burl="https://gitlab.com/NorESMhub/noresm_simulations"
rname="$(cd ${good_remote}; git_url_remote ${hurl})"
check_test "git_url_remote with good https url" "${rname}" "NorESMhub"
rname="$(cd ${good_remote}; git_url_remote ${surl})"
check_test "git_url_remote with good ssh url" "${rname}" "NorESMhub"
rname="$(cd ${good_remote}; git_url_remote ${burl})"
check_test "git_url_remote with bad url" "${rname}" ""

# Test is_git_remote
rname="NorESMhub"
remote=$(cd ${good_remote}; is_git_remote ${rname})
check_test "is_git_remote with good remote" "${remote}" "${rname}"
rname="noresm25_preindust_amip"
remote=$(cd ${good_remote}; is_git_remote ${rname})
check_test "is_git_remote with bad remote" "${remote}" ""

# Test git_branch_local
branch="noresm25_preindust_coupled"
blocal=$(cd ${good_remote}; git_branch_local ${branch})
check_test "git_branch_local with good local branch" "${blocal}" "${branch}"
branch="You_call_this_a_branch"
blocal=$(cd ${good_remote}; git_branch_local ${branch})
check_test "git_branch_local with good local branch" "${blocal}" ""

# Test git_branch_upstream
branch="noresm25_preindust_coupled"
ubranch="NorESMhub/noresm25_preindust_coupled"
upstream=$(cd ${good_remote}; git_branch_upstream ${branch})
check_test "git_branch_upstream with good local branch" "${upstream}" "${ubranch}"
branch="no_remote"
upstream=$(cd ${good_remote}; git_branch_upstream ${branch})
check_test "git_branch_upstream with good local branch" "${upstream}" ""

## Report report totals
report_test_results "git" ${NUMTESTS} ${NUMFAIL}

declare -A test_total=$(last_test_total)
declare -A test_fail=$(last_test_fail)

git_test_total() {
    ## Report the total number of git tests run
    echo "${test_total}"
}

git_test_failures() {
    ## Report the total number of failed git tests
    echo "${test_fail}"
}
