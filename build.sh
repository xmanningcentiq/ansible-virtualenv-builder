#!/usr/bin/env bash

which docker > /dev/null 2>&1

if [[ "${?}" -gt 0 ]] ; then
    echo "Docker not found!"
    exit 1
fi

if [[ "${#}" -lt 1 ]] ; then
    echo "Please provide an environment name!"
    echo ""
    echo "Available Environments:"
    echo ""
    for e in Dockerfile-* ; do
        echo "${e/Dockerfile-/  - }"
    done
    echo ""
    exit 1
fi

if [[ ! -f "Dockerfile-${1}" ]] ; then
    echo "Dockerfile for ${1} not found!"
    exit 1
fi

test -d "out" || mkdir out
docker build -t "ve-ansible-${1}" -f "Dockerfile-${1}" .
docker run --name "ve-ansible-${1}-build" -v "$(pwd)/out:/tmp" -e __OS_RELEASE="${1}" "ve-ansible-${1}"
docker rm "ve-ansible-${1}-build"
docker rmi "ve-ansible-${1}"
