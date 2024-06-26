#!/bin/bash
source $(dirname "${BASH_SOURCE[0]}")/lib/modules/stdout/print.sh
source $(dirname "${BASH_SOURCE[0]}")/lib/modules/utils/alias.sh
#* Imports

PATH="$PATH:/home/admin/.bin"

clear

if [ -f ~/welcome.txt ]; then
    cat welcome.txt | while IFS= read -r line; do echo -e "$line"; done
fi

if [ -f ~/.ps1 ]; then
    source ~/.ps1
fi

# Display CPU Usage
display_free_cpu () {
    local free_cpu=$(mpstat 1 1 -o JSON | jq '.sysstat.hosts[0].statistics[0]["cpu-load"][0].idle')

    print "  \x1b[1mFree CPU:\x1b[0m" $free_cpu%
}

display_free_memory () {
    local free_memory=$(free | grep Mem | awk '{ print $7/$2 * 100.0 }')

    print "  \x1b[1mFree Memory:\x1b[0m" $free_memory%
}

display_free_disk () {
    local free_disk=$(df -h | grep '/$' | awk '{ print $5 }' | awk -F'%' '{ printf "%d%%\n", 100 - $1 }')

    print "  \x1b[1mFree Disk:\x1b[0m" $free_disk
}

print ""

# display_free_cpu
display_free_memory
display_free_disk

print ""
# print "  \x1b[36m?\x1b[0m To view the current services status, use the \`\x1b[33mvm services\x1b[0m\` command"
# print "  \x1b[36m?\x1b[0m To view the system status, use the \`\x1b[33mvm status\x1b[0m\` command"
