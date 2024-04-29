login () {
    local user=$1
    local current_user=$(whoami)

    if [ "$current_user" = "root" ]; then
        return
    fi

    if [ "$current_user" != "$user" ]; then
        sudo su -s /bin/bash - $user <<EOF
cd /home/$user
exec bash
EOF
    fi
}

login admin
