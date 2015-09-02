#!/bin/bash

if [[ $1 == "install" ]]; then
	echo "installing"
	foreman-installer
	exit $?
else
	echo "unknown command $1"
	exit 1
fi
