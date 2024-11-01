#!/bin/bash

case $1 in
master)
    GITHUB_TOKEN=$2 yarn deploy:prod
    ;;
beta)
    GITHUB_TOKEN=$2 yarn deploy:beta
    ;;
*)
    printf "Parâmetro inválido, uso correto: build [beta | main]" >&2
    exit 1
    ;;
esac
