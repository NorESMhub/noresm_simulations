## Utility functions

perr() {
    ## Write an error message and exit if an error has been found
    ## $1 is an error code (zero means no error)
    ## $2 is an error message
    if [ ${1} -ne 0 ]; then
        echo "ERROR: ${2}"
        exit ${1}
    fi
}

yn_query() {
    ## Run a yes / no query based on a prompt ($*)
    local resp
    while true; do
        read -p "$* [yes/no]? " resp
        case ${resp} in
            [Yy][Ee][Ss])
                return 0
                ;;
            [Nn][Oo])
                return 1
                ;;
        esac
    done
}

query() {
    ## Run a query based on a set of choices ($1) and a prompt ($2-)
    ## The prompt string is of the form rval1:<prompt1>%rval2:<prompt2>...
    ## where rval is a numeric value to return upon selection
    ## Use at signs (@) instead of spaces in prompt strings
    local -A choices
    local choice
    local keys
    local prompts="${1}"
    local resp
    local temp
    shift
    # Load the choices array
    for resp in ${prompts//%/ }; do
        temp=(${resp//:/ })
        choices[${temp[0]}]="${temp[1]//@/ }"
    done
    # Create the list of keys
    IFS=$'\n' keys=($(sort -n <<<"${!choices[@]}"))
    unset IFS
    while true; do
        for choice in ${keys[@]}; do
            printf "%2d: %s\n" ${choice} "${choices[${choice}]}"
        done
        read -p "$* " resp
        if [[ ${resp} =~ ^[0-9]+$ ]]; then
            for choice in ${!choices[@]}; do
                if [ ${choice} -eq ${resp} ]; then
                    return ${choice}
                fi
            done
        else
            echo "Please enter only digits"
        fi
    done
}
