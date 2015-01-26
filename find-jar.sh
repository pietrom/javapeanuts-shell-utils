#!/bin/bash
# Commonly available under GPL 3 license
# Copyleft Pietro Martinelli - javapeanuts.blogspot.com
if [ -z $1 ]
then
	echo "Usage: $0 <pattern>"
	echo "tar xf's output will be tested against provided <pattern> in order to select matching JARs"
	exit 1
else
	toSearch=$(echo ${1} | tr '.' '/')
	echo "Finding class ${1}: using pattern ${toSearch}"
	jarsFound=""
	for file in $(find . -name "*.jar"); do
		echo "Processing file ${file} ..."
	        out=$(jar tf ${file} | grep ${toSearch})
		if [ "${out}" != "" ]
		then
			echo "  Found '${1}' in JAR file ${file}"
			jarsFound="${jarsFound} ${file}"
		fi
	done
	echo "${jarsFound}"
	
	echo ""
	echo "Search result:"
	echo "" 
	
	if [ "${jarsFound}" != "" ]
	then
		echo "${1} found in"
		for file in ${jarsFound}
		do
			echo "- ${file}"
		done
	else
		echo "${1} not found"
	fi
	exit 0
fi
