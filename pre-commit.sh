#!/bin/sh
#
# This pre-commit hook will execute the `update-index.fsx` script and commit the resulting changes on `arc-validate-package-index.json`.
git diff --cached --name-only --diff-filter=ACM > file_changes.txt
printf "\e[32mfile changes in new commit:\e[0m\n"
cat file_changes.txt
printf "\n"
dotnet fsi update-index.fsx
git add arc-validate-package-index.json
rm file_changes.txt
