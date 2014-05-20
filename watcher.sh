#!/usr/bin/env bash


W_PATH="./views"
while true
do
  echo "waiting"
  per=$(ls -l $W_PATH)
  sleep 1 
  now=$(ls -l $W_PATH)
 # diff <(echo $per) <(echo $now)
 changedfile=$(diff <(echo $per) <(echo $now) | awk ' { print ( $(NF) ) }' | tail -n1)
 echo $changedfile

  curl -i -F path=$W_PATH -F filedata=@"$W_PATH/$changedfile" http://hackday.helium.atom.cf-app.com/upload
done



