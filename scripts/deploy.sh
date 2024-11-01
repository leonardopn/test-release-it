#!/bin/bash

configureGit() {
    git remote rm origin
    git remote add origin https://$1@github.com/leonardopn/test-release-it.git
    git symbolic-ref HEAD refs/heads/main

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
