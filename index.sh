#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/lib/modules/stdout/print.sh
#* Imports

echo $(dirname "${BASH_SOURCE[0]}")

clear

if [ -f ~/welcome.txt ]; then
    cat welcome.txt | while IFS= read -r line; do echo -e "$line"; done
fi

# Display CPU Usage
display_free_cpu () {
    local free_cpu=$(mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]["cpu-load"][0].idle')

    print "\x1b[1mFree CPU:\x1b[0m" $free_cpu%
}

print "  \x1b[36m?\x1b[0m To view the current services status, use the `\x1b[33mvm services\x1b[0m` command"
print "  \x1b[36m?\x1b[0m To view the system status, use the `\x1b[33mvm status\x1b[0m` command"

display_free_cpu