#!/bin/sh

writefile=$1
writestr=$2

if [ -z "${writefile}" ] || [ -z "${writestr}" ]; then
	echo "Usage: $0 <file_path> <string_to_write>"
	exit 1
fi

mkdir -p "$(dirname "${writefile}")"
echo "${writestr}" > "${writefile}"

if [ $? -ne 0 ]; then
	echo "Error: failed to create ${writefile} with ${writestr}" >&2
	exit 1
fi
