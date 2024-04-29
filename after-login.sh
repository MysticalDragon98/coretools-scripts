login () {
    local user=$1
    local current_user=$(whoami)

    if [ "$current_user" == "root" ]; then
        return
    fi

    if [ "$current_user" != "$user" ]; then
        sudo su $user
    fi
}

login admin