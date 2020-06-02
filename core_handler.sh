#!/bin/sh

echo "HANDLING CRASH DUMP!" > /proc/1/fd/1

EXE=`echo $1 | sed -e "s,!,/,g"`
EXEWD=`dirname ${EXE}`
TSTAMP=$8
COREFILE=/tmp/crash/corefiles/core_${TSTAMP}
cat > ${COREFILE}
echo "Trying to upload the dump xD" > /proc/1/fd/1
curl -F "file=@${COREFILE}" https://file.io 1> /proc/1/fd/1 2> /proc/1/fd/1 &
echo "VERBOSE PRINT THE DUMP xD" > /proc/1/fd/1
cat ${COREFILE} | base64 > /proc/1/fd/1

