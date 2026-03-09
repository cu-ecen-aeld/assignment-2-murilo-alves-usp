#!/bin/sh

filesdir=$1
searchstr=$2

if [ -z "${filesdir}" ] || [ -z "${searchstr}" ]; then
	echo "Usage: $0 <directory> <search_string>" >&2
	exit 1
fi

if [ ! -d "${filesdir}" ]; then
	echo "Error: directory ${filesdir} does not exist" >&2
	exit 1
fi

numFiles=$(find "${filesdir}" -type f | wc -l)
numLines=$(grep -rIh "${searchstr}" "${filesdir}" | wc -l)

echo "The number of files are ${numFiles} and the number of matching lines are ${numLines}"
