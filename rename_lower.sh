#!/usr/bin/env bash

if [ "$1" != "--help" ]; then
	case "$1" in
		'')             ;;
		--find-command) mv -nT "$2" "${2,,}"
		                ;;
		*)              find "$@" -depth -name "*[[:upper:]]*" -execdir "$0" "--find-command" \
		                '{}' ';'
		                ;;
	esac
	exit
fi

USAGE="Usage: $(basename "$0") [--help] NAME...

Converts the name of each file 'NAME' (and of its contents, if it's a directory) to lowercase.

	--help	display this help and exit"

echo "$USAGE"
