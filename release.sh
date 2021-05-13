#! /bin/bash

version=$1
commit=$2

if [ $# = 0 ]; then
    echo required argument
    echo please set version name
    exit 1
fi

if [ $# = 1 ]; then
    echo required argument
    echo please set commit hash
    exit 1
fi

if [[ ! $version =~ ^v+[0-9](.[0-9]){1,2}$ ]]; then
    echo "invalid format"
    exit 1
fi

create_git_tag() {
    git tag -a ${1} ${2}
    git tag -a stg-${1} ${2}
    git tag -a dev-${1} ${2}
    git tag -a sandbox-${1} ${2}
}

push_git_tag() {
    git push origin ${1}          # for production
    git push origin stg-${1}
    git push origin dev-${1}
    git push origin sandbox-${1}
}

create_git_tag $version $commit
push_git_tag $version


