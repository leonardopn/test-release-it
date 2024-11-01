#!/bin/bash

configureGit() {
    git config --global user.name "GCP CI Bot"
    git config --global user.email "gcp@ci.com"

    git remote set-url origin https://$1@github.com/leonardopn/test-release-it.git

    git fetch --prune --unshallow

    GITHUB_TOKEN=$1 yarn deploy:$2
}

case $1 in
master)
    configureGit $2 prod
    ;;
beta)
    configureGit $2 beta
    ;;
*)
    printf "Parâmetro inválido, uso correto: build [beta | main]" >&2
    exit 1
    ;;
esac
