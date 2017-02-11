#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

# Deploys the contents of public/ to the master branch
cd public/

git init
git config user.name "Sean T. Allen"
git config user.email "sean@monkeysnatchbanana.com"
git remote add upstream "https://$GH_TOKEN@github.com/seantallen/monkeysnatchbanana.com"
git fetch upstream
git reset upstream/master

touch .

git add -A .
git commit -m "rebuild website from revision ${rev} of source branch"
git push -q upstream HEAD:master
