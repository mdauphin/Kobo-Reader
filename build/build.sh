#!/bin/bash

# Exit on subcommand failure or on undefined variable reference
set -e -u

#export PATH=$PATH:/home/max/CodeSourcery/Sourcery_G++_Lite/bin/
export KOBO_SCRIPT_DIR="`dirname $0`"

i=$1
	if echo "${SKIP:-}" | grep -q \\\<"$i"\\\> ; then
		echo "Building of $i suppressed by \$SKIP"
		continue
	fi
	$KOBO_SCRIPT_DIR/scripts/$i.sh 2>&1 | tee $i.log
	if test "${PIPESTATUS[0]}" -ne 0 ; then
		echo "Build failed at $i.sh, aborting"
		exit 1
	fi

echo "Library build completed successfully"
