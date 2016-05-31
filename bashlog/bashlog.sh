session_log_command() {
    local status=$?
    local command
    local cwd
    cwd=$PWD

    command=$(history -a >(tee -a ~/.bash_history))

    if [[ -n "$command" ]] && [ "$command" != " " ]; then
        logger -p user.notice "bashlog: process id [$$] from [$SSH_CONNECTION]: [CWD=$cwd] Executing command [$command - Status: $status]"
        history -c; history -r
        printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"
    fi
}

PROMPT_COMMAND=session_log_command

