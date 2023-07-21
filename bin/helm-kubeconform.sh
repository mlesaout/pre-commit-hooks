#!/usr/bin/env bash

set -e
export PATH=$PATH:/usr/local/bin

if which helm &> /dev/null $? != 0 ; then
    echo "HELM must be installed"
    exit 1
fi

parse_cmdline_() {

  ARGS+=$(getopt -o a: --long args: -- "$@")
#    || return
#   eval "set -- $argv"

#   for argv; do
#     case $argv in
#       -a | --args)
#         shift
#         ARGS+=("$1")
#         shift
#         ;;
#       --)
#         shift
#         FILES=("$@")
#         break
#         ;;
#     esac
#   done
}

helm kubeconform "${ARGS[@]}" .
