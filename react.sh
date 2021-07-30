#!/bin/bash
echo "$1, $2, $3, $4"

source /home/christian/bin/functions.sh

operation=$1
type=$2
name=$3

checkComponentName $name

case $operation in
create)
    echo "create operation"
    shift # past argument
    shift # past value
    ;;
remove)
    echo "remove operation"
    shift # past argument
    shift # past value
    ;;
*)        # unknown option
    shift # past argument
    ;;
esac
