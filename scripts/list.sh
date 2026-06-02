#!/bin/bash
#-----------------------------------------------------------------------------
#
#		list.sh
#
#		Script that gathers the new and modified docker files
#
#		Arguments:
#			<none>
#
#		Environment Variables:
#			1. SHELL_UTILITIES_ACCESS_TOKEN
#			2. COMMIT_SHA_BEFORE
#			2. COMMIT_SHA_AFTER
#
#-----------------------------------------------------------------------------

# Setup
set -e
scriptDirectory="$(dirname "$0")"
scriptName="$(basename "$0")"
errorList=()
utilitiesRepo="https://$SHELL_UTILITIES_ACCESS_TOKEN@raw.githubusercontent.com/zamstation/shell_utilities/main/lib/src"
utilityScripts=("logger.sh" "error_thrower.sh")
for utilityScript in "${utilityScripts[@]}"; do
	if [[ ! -f "$scriptDirectory/$utilityScript" ]]; then
		curl -s "$utilitiesRepo/$utilityScript" -o "$scriptDirectory/$utilityScript"
	fi
done
source "$scriptDirectory/logger.sh" $scriptName
source "$scriptDirectory/error_thrower.sh" $scriptName $errorList
set +e

#
# Gathering the list of new and modified Dockerfiles
#
logStep "Gathering the list of new and modified Dockerfiles"
readarray -t dockerFiles < <(git diff --name-only $COMMIT_SHA_BEFORE..$COMMIT_SHA_AFTER | grep -sE "lib/.+/Dockerfile$")
if [[ ${#dockerFiles[@]} -eq 0 ]]; then
	echo "No new docker file found."
else
	printf "%s\n" "${dockerFiles[@]}"
fi
echo ${dockerFiles[@]} >docker_file_list.txt

#
# Shutdown
#
exit 0

#-----------------------------------------------------------------------------
