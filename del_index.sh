#!/bin/bash
#######################################################
# $Name:        clean_index.sh
# $Version:     v2.0
# $Function:    delete es index
# $Author:      lralin
# $Create Date: 2024-3-8
# $Description: shell
######################################################
#脚本的日志文件路径
CLEAN_LOG="/data/deploy/data/elk/clean_index.log"
#es地址
SERVER_PORT=127.0.0.1:9200
USER="logstash_monitor"
PASSWORD="monitoR123!"
#保留的时间，单位天
DELTIME=3
SECONDS=$(date -d  "$(date  +%F) -${DELTIME} days" +%s)
INDEXS=$(curl -s -u  ${USER}:${PASSWORD}  "${SERVER_PORT}/_cat/indices/logstash-*?v"|awk '{print $3}')
echo "-------------------$(date +%F_%T)---------------"  >>${CLEAN_LOG}
for del_index in ${INDEXS}
do
     timeString=$( echo ${del_index} |awk -F"-" '{print $NF}'|egrep "[0-9]*\.[0-9]*\.[0-9]*")
     if [ -n "$timeString" ]
     then
         indexDate=${timeString//./-}
         indexSecond=$( date -d ${indexDate} +%s )
         if [ $(( $SECONDS- $indexSecond )) -gt 0 ]
         then
             delResult=`curl -s -u ${USER}:${PASSWORD}  -XDELETE "${SERVER_PORT}/"${del_index}"?pretty" |sed -n '2p'`
             echo "delete index:$del_index result:$delResult" >>${CLEAN_LOG}
             sleep 1
         fi
     fi
done