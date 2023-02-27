#!/usr/bin/env bash

function tfrel() {
    print_success() {
        lightcyan='\033[1;36m'
        nocolor='\033[0m'
        echo -e "${lightcyan}$1${nocolor}"
    }

    print_error() {
        lightred='\033[1;31m'
        nocolor='\033[0m'
        echo -e "${lightred}$1${nocolor}"
    }

    print_alert() {
        yellow='\033[1;33m'
        nocolor='\033[0m'
        echo -e "${yellow}$1${nocolor}"
    }

    local curdir=$(basename $(pwd));
    alias stfi='curl https://raw.githubusercontent.com/libre-devops/utils/dev/scripts/terraform/tf-sort.sh | bash -s -- input.tf input.tf'
    alias stfo='curl https://raw.githubusercontent.com/libre-devops/utils/dev/scripts/terraform/tf-sort.sh | bash -s -- output.tf output.tf'

    if ls *.tf &> /dev/null; then
        rm -rf README.md
        stfi
        stfo
        if [ -f build.tf ]; then
            cat <<EOF >README.md
\`\`\`hcl
$(cat build.tf)
\`\`\`
EOF
        elif [ -f main.tf ]; then
            cat <<EOF >README.md
\`\`\`hcl
$(cat main.tf)
\`\`\`
EOF
        else
            print_alert "Not a build directory, no build.tf found"
        fi
        terraform-docs markdown . >>README.md
        git add --all
        git commit -m "Update module"
        git push
        git tag 1.0.0 --force
        git push --tags --force
    else
        print_error "Error: No terraform files found within ${curdir}";
    fi
}

echo "Appending functions to .bashrc"
echo "" >>~/.bashrc
echo "# Define tfrel function" >>~/.bashrc
declare -f tfrel >>~/.bashrc

