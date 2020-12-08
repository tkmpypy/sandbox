#! /bin/bash

version=$1

if [ $# = 0 ]; then
    echo required argument
    echo please set version name
    exit 1
fi

if [[ ! $version =~ ^v+[0-9](.[0-9]){1,2}$ ]]; then
    echo "invalid format"
    exit 1
fi

create_git_tag() {
    git tag ${1}
    git tag ${1}-staging
    git tag ${1}-dev
    git tag ${1}-sandbox
}

push_git_tag() {
    git push origin ${1}          # for production
    git push origin ${1}-staging
    git push origin ${1}-dev
    git push origin ${1}-sandbox
}

create_git_tag $version
push_git_tag $version

