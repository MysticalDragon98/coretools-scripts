clear

if [ -f ~/welcome.txt ]; then
    cat welcome.txt | while IFS= read -r line; do echo -e "$line"; done
fi