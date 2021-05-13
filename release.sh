#! /bin/bash

version=$1
comment=$2
commit=$3

if [ $# = 0 ]; then
    echo required argument
    echo please set version name
    exit 1
fi

if [ $# = 1 ]; then
    echo required argument
    echo please set commit comment
    exit 1
fi

if [ $# = 2 ]; then
    echo required argument
    echo please set commit hash
    exit 1
fi

if [[ ! $version =~ ^v+[0-9](.[0-9]){1,2}$ ]]; then
    echo "invalid format"
    exit 1
fi

create_git_tag() {
    git tag -a ${1} -m ${2} ${3}
    git tag -a stg-${1} -m ${2} ${3}
    git tag -a dev-${1} -m ${2} ${3}
    git tag -a sandbox-${1} -m ${2} ${3}
}

push_git_tag() {
    git push origin ${1}          # for production
    git push origin stg-${1}
    git push origin dev-${1}
    git push origin sandbox-${1}
}

create_git_tag $version $comment $commit
push_git_tag $version


