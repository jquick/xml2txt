#! /bin/bash
#variables
DIR="Library/Application Support/Adium 2.0/Users/Default/Logs"

for a in ~/"$DIR"/Jabber.jquick*;
do
	for b in "$a"/hon*
  do
    for c in "$b"/*
    do
  	  OUTPUT="adium_logs/"`basename $(echo "${c%.chatlog}" | sed -e 's/[ |]/-/g' -e 's/[()]//g').txt`
      FILE=`basename "$(echo "${c%.chatlog}").xml"`
      ./xml2txt.rb "$OUTPUT" "$c"/"$FILE"
     done
  done
done
