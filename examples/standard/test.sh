  # Define tdrel function
  tdrel ()
  {
      set -e
      # shellcheck disable=SC2046
      local curdir=$(basename "$(pwd)");
      alias stfi='curl https://raw.githubusercontent.com/libre-devops/utils/dev/scripts/terraform/tf-sort.sh | bash -s -- input.tf input.tf'
      alias stfo='curl https://raw.githubusercontent.com/libre-devops/utils/dev/scripts/terraform/tf-sort.sh | bash -s -- output.tf output.tf'
      alias td='terraform-docs markdown . >> README.md'

      if ls *.tf &> /dev/null;  then
         stfi
         stfo
         echo "" > README.md && echo '```hcl' | cat - build.tf | cat - README.md > temp.md && mv temp.md README.md
         td
         git add --all
         git commit -m "Update module"
         git push
         git tag 1.0.0 --force
         git push --tags --force

      else
          echo "Error: No terraform files found within ${curdir}";
      fi
  }