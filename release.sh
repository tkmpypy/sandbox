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

push_git_tag() {
    echo "git push origin ${1}"          # for production
    echo "git push origin ${1}-staging"
    echo "git push origin ${1}-dev"
    echo "git push origin ${1}-sandbox"
}

push_git_tag $version

