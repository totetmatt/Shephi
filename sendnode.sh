#!/bin/bash
properties=""
args=("$@")
re=':[0-9]+([.][0-9]+)?$'

function help {
	echo "Usage : $0 http://myhost:myport \"id\" an/cn/dn [\"property1:value1\" \"property2:value2\" ...]"
    echo "========"
    echo "an : Add Node"
    echo "cn : Change Node"
    echo "dn : Delete Node"
    echo "========"
}

for (( i=3;i<$#;i++)); do 
   property=${args[${i}]}
   if ! [[ ${args[${i}]} =~ $re ]] ; then
      properties="$properties, '"${property//:/\':\'}"'"
   else
      properties="$properties, '"${property//:/\':}
   fi 
 done
echo $properties
curl "$1/workspace0?operation=updateGraph" -d "{'$3':{'$2':{'label':'$2' $properties}}}"
