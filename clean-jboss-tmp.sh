#!/bin/bash

function cleanTmpDir {
	echo "  Cleaning ${1}/${2}"
	rm -rf "${1}/${2}"

}

function cleanNode {
	echo "Cleaning \"${1}\" jboss node"
	for tmpDir in data log tmp work
	do
		cleanTmpDir ${1} ${tmpDir}
	done
}


if [ $# -eq 0 ]
then
	for dir in $(find server -maxdepth 1 -mindepth 1 -type d)
	do
		cleanNode ${dir}
	done
else
	if [ -e "server/${1}" ]
	then
		cleanNode "server/${1}"
	else
		echo "${1} is not a subdir of server dir"
	fi
fi
