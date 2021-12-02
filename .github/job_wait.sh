#!/bin/bash

jenkins_url=$1
job_name=$2
jenkins_token=$3

while true
do
  curl -s ${jenkins_url}/job/${job_name}/lastBuild/api/json --user jenkins:${jenkins_token} > out.json
  res=$(jq -r .result out.json)
  if [[ ${res} == "null" ]]; then
          sleep 10
          curl -s ${jenkins_url}/job/${job_name}/lastBuild/api/json --user jenkins:${jenkins_token} > out.json
          res=$(jq -r .result out.json)
  else
  if [[ ${res} == "SUCCESS" ]]; then
         ret=0
         break;
  else
          ret=1
          break;
  fi
  fi
done
exit $ret
