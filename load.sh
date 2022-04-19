#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 19.04.2022
#
# CONFIG
## load all params: in out status


# START

## load in from csv
## first headers line to , loop

## iteration of headers, from 0 line csv file

## iteration of rows , from 1 to the end csv file

## iteration step save to status

# ./load.sh "1/in.csv" "1/out.csv" "1/status.csv"
# [ -z "$HEADERS" ] && $HEADERS=$1
## split headers
## get second header and execute script

IN=$1
OUT=$2
STATUS=$3

## Save
#cat $IN > $OUT
HEADERS="domain,http_status"

echo $HEADERS > $OUT


OBJECT_LIST=$(cat $IN)

for object in $OBJECT_LIST
do
   echo $object
   url="https://$object"
   RUN=$(sh load/http_status.sh $url)
   echo $RUN >> $OUT

done