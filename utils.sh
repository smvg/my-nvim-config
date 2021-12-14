#!/bin/bash

bailout_if_unsucessful ()
{
	if [ $1 -ne 0 ]; then
		echo "Make sure you install $2 before proceeding :D"
		exit 1
	fi
}

is_installed_bin ()
{
	which $1 > /dev/null
	bailout_if_unsucessful $? $1
}

is_installed_npm ()
{
	npm list -g $1 > /dev/null
	bailout_if_unsucessful $? $1
}

