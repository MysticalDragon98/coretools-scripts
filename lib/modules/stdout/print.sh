print () {
    local message="$@"

    printf "%b\n" "${message}\033[0m"
}