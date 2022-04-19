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
HEADERS="domain,http_status_code"

echo $HEADERS > $OUT
i=0

OBJECT_LIST=$(cat $IN)
# sh load/http_status_code.sh https://softreck.com
for object in $OBJECT_LIST
do
  ((i++))
  [ $i = 1 ] && continue
   URL="https://$object"
   #url="$object"
   CMD="http_status_code"
   RUNS="./load/${CMD}.sh ${URL}"
   #echo $RUNS
   RUN=$($RUNS)
   #echo $RUN
   LINE="$object,$RUN"
   echo $LINE
   #[[ $RUN != "000" ]] &&
   sleep 2
   echo $LINE >> $OUT
done