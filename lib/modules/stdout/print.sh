print () {
    local message="$@"

    printf "${message}\033[0m\n"
}