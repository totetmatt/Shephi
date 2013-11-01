#!/bin/bash
properties=""
args=("$@")
re=':[0-9]+([.][0-9]+)?$'

function help {
	echo "Usage : $0 http://myhost:myport \"idFrom\" \"idTo\" True/Fase ae/ce/de [\"property1:value1\" \"property2:value2\" ...]"
    echo "========"
    echo "ae : Add Edge"
    echo "ce : Change Edge"
    echo "de : Delete Edge"
    echo "========"
}

for (( i=5;i<$#;i++)); do 
   property=${args[${i}]}
   if ! [[ ${args[${i}]} =~ $re ]] ; then
      properties="$properties, '"${property//:/\':\'}"'"
   else
      properties="$properties, '"${property//:/\':}
   fi 
 done
echo $properties
curl "$1/workspace0?operation=updateGraph" -d "{'$5':{'$2':{'label':'$2' $properties}}}"
