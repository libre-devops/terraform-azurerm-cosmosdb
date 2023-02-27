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

  local curdir=$(basename $(pwd))
  local build_file=""
  if [ -f build.tf ]; then
    build_file="build.tf"
  elif [ -f main.tf ]; then
    build_file="main.tf"
  fi
  if [ "$build_file" != "" ]; then
    echo "" > README.md
    echo '```hcl' >> README.md
    cat "$build_file" >> README.md
    echo '```' >> README.md
  else
    print_alert "Not a build directory, no build.tf or main.tf found"
  fi
  terraform-docs markdown . >> README.md
  git add --all
  git commit -m "Update module"
  git push
  git tag 1.0.0 --force
  git push --tags --force
}

echo "Appending functions to .bashrc"
echo "" >>~/.bashrc
echo "# Define tfrel function" >>~/.bashrc
declare -f tfrel >>~/.bashrc

