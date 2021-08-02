#!/bin/bash
# Config

# Params
operation=$1
type=$2
name=$3
options=$4

source lib.sh
source component.sh

operation=$1
type=$2
name=$3

echo ${1^} ${2^} »${3^}«

# Component

if [[ $type == "component" ]]; then

    case $operation in
    add)
        component.add $name
        ;;
    remove)
        component.remove $name
        ;;
    *) # unknown option
        ;;
    esac

fi
