## Functions to execute git commands

declare EXP_PATT="noresm[2-9][0-9]_[a-zA-Z_0-9]+"

in_git_worktree() {
    ## Check to see if CWD is in a git directory.
    ## Return 0 if .git exists in CWD or a parent
    ## Return 1 if not in a git directory
    git rev-parse --show-top-level 2> /dev/null > /dev/null
    return $?
}

git_current_branch() {
    ## Return the name of the current local branch
    ## An empty string means no current branch or a detached HEAD
    git branch --show-current
}

git_allowed_branch_name() {
    ## If the input branch name ($1) is an allowed pattern for NorESM
    ## development experiments, return the name, otherwise return an
    ## empty string.
    ## Allowed names are a NorESM version followed by an underscore, followed by
    ## an experiment type (e.g., preindustrial_coupled)
    if [[ "${1}" =~ ${EXP_PATT} ]]; then
        echo "${1}"
    else
        echo ""
    fi
}

git_experiment_branches() {
    ## Return the existing experiment branches in this repo
    local branches=($(git branch -a --list *noresm[0-9]** | sed -e 's@.*/@@' -e 's/[ \t*]*//' | sort | uniq))
    echo ${branches[@]}
}

git_branch_remote() {
    ## Given a branch name ($1), return the name of its remote
    echo "$(git config branch.${1}.remote)"
}

git_url_switch_protocol() {
    ## Given a github.com URL ($1), switch between https and ssh syntax
    ## If the URL is not a known GitHub URL, return an empty string
    local url="${1}"
    if [ "${url:0:19}" == "https://github.com/" ]; then
        url="git@github.com:${url:19}"
    elif [ "${url:0:15}" == "git@github.com:" ]; then
        url="https://github.com/${url:15}"
    else
        url=""
    fi
    echo "${url}"
}

git_url_remote() {
    ## Given a URL, find the remote name (or an empty string if not found)
    local remote
    local rname=""
    local url
    for remote in $(git remote); do
        url="$(git remote get-url ${remote})"
        if [ "${url}" == "${1}" ]; then
            rname="${remote}"
            break
        elif [ "$(git_url_switch_protocol ${url})" == "${1}" ]; then
            rname="${remote}"
            break
        fi # No else, not a match
    done
    echo "${rname}"
}

is_git_remote() {
    ## If $1 is a valid remote in the current repo, return it, otherwise
    ## return an empty string
    local remote
    local rname=""
    for remote in $(git remote); do
        if [ "${remote}" == "${1}" ]; then
            rname="${remote}"
            break
        fi
    done
    echo "${rname}"
}

git_branch_local() {
    ## Return the local branch name, $1, if it exists, otherwise
    ##    return an empty string
    git branch --list "${1}" | sed -e 's@[ \t*]*@@'
}

git_branch_upstream() {
    ## Find the upstream branch of a local branch ($1)
    git rev-parse --abbrev-ref "${1}@{upstream}" 2> /dev/null
}
