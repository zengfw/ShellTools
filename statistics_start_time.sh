#!bin/bash

LOG_START_TIME=/Users/cengfanwei/Desktop/start_time.txt
PACKAGE_NAME=$1
ACTIVITY_NAME=$2
TEST_TIME=$3

counter=0
while [[ $counter -lt $TEST_TIME ]]
do
    adb shell am start -W -n $PACKAGE_NAME/.$ACTIVITY_NAME >> $LOG_START_TIME
    adb shell am force-stop $PACKAGE_NAME
    sleep 1
    let counter++
done

time_list=`cat $LOG_START_TIME | grep TotalTime`

ALL_TOTAL_TIME=0
MAX_START_TIME=0
MIN_START_TIME=0

for time_item in $time_list
do
    t0=`echo "$time_item" | tr -cd "[0-9]"`
    let ALL_TOTAL_TIME+=t0

    if [[ $MAX_START_TIME -lt $t0 ]]; then
        MAX_START_TIME=$t0
    fi

    if [[ $MIN_START_TIME -eq 0 || $MIN_START_TIME -gt $t0 ]]; then
        MIN_START_TIME=$t0
    fi

done

avg_time=`echo "$ALL_TOTAL_TIME / $TEST_TIME" | bc`

echo "avg_time: $avg_time"
echo "max_time: $MAX_START_TIME"
echo "min_time: $MIN_START_TIME"


