#!/bin/bash

#definition of work environments
prod="/var/www/myProject/sites/www"
stage="/var/www/myProject/stage/sites/www"
dev="/var/www/myProject/dev/sites/www"


currentPath=`pwd`
currentEnv=""

#path within project, without evironment prefix
path=""
#path after environment
pathNew=""

function determineEnv
{
    #checking where are we at the moment
    if [[ "$currentPath" == *$prod* ]]
    then
        currentEnv='prod'
    elif [[ "$currentPath" == *$stage* ]]
    then
        currentEnv='stage'
    elif [[ "$currentPath" == *$dev* ]]
    then
        currentEnv='dev'
    fi

}


determineEnv

#if there is an argument
if [[ $# == 1 ]]
then

    currentEnvRest=$(eval echo $`echo $currentEnv`)

    currentEnvRest=$(echo $currentEnvRest| sed s,/,\\\\\\/,g)

    pathNewPart1=$(eval echo $`echo $1`)
    pathNewPart2=$(echo $currentPath | sed "s/.*$currentEnvRest\/*\(.*\)/\1/")
    pathNew=$pathNewPart1"/"$pathNewPart2


else
    determineEnv
fi


if [[ $currentEnv != "" && $# == 0 ]]
then
    echo "You are on" $currentEnv
elif [[ $currentEnv != "" && $# == 1 ]]
then
    echo "Switched from" $currentEnv "to" $1
    #echo "cd: "$pathNew
    #`cd $pathNew` #doesn't work, so here's little hack...
    pushd $pathNew >/dev/null

else
    echo 'You are outside of defined working environments.'
fi
