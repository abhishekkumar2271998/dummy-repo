#!/bin/bash
#-----------------------------------------------------------------------------
#
#		deploy.sh
#
#		Script that
#			- find out the modified docker files
#			- build container images using them
#			- pushes the built images to docker hub
#
#		Arguments:
#			<none>
#
#		Environment Variables:
#			1. SHELL_UTILITIES_ACCESS_TOKEN
#
#-----------------------------------------------------------------------------

# Setup
set -e
scriptDirectory="$(dirname "$0")"
scriptName="$(basename "$0")"
errorList=(
	"DOCKER_BUILD_ERROR"
	"DOCKER_PUBLISH_ERROR"
)
utilitiesRepo="https://$SHELL_UTILITIES_ACCESS_TOKEN@raw.githubusercontent.com/zamstation/shell_utilities/main/lib/src"
utilityScripts=("logger.sh" "error_thrower.sh")
for utilityScript in "${utilityScripts[@]}"; do
	if [[ ! -f "$utilityScript" ]]; then
		curl -s "$utilitiesRepo/$utilityScript" -o "$scriptDirectory/$utilityScript"
	fi
done
source "$scriptDirectory/logger.sh" $scriptName
source "$scriptDirectory/error_thrower.sh" $scriptName $errorList
set +e

#
# Parsing Arguments
#
logStep "Parsing Arguments"
dockerFiles=($1)
logMeta "Dockerfile list" "$1"
if [[ $dockerFiles == "" ]]; then
	echo "No new docker file found. Exiting program."
	exit 0
fi

#
# Building and pushing containers
#
for dockerFile in "${dockerFiles[@]}"; do

	repoName="$(basename $(dirname $dockerFile))"
	logStep "Building container: zamstation/$repoName"
	echo -e "Running docker build . -f $dockerFile -t zamstation/$repoName"
	docker build . -f "$dockerFile" -t zamstation/$repoName
	exitCode=$?
	if [[ exitCode -ne 0 ]]; then
		throwAndExit "DOCKER_BUILD_ERROR" "Building docker image 'zamstation/$repoName' failed."
	fi

	logStep "Pushing container: zamstation/$repoName"
	echo -e "Running docker push zamstation/$repoName"
	docker push zamstation/$repoName
	exitCode=$?
	if [[ exitCode -ne 0 ]]; then
		throwAndExit "DOCKER_PUBLISH_ERROR" "Publishing docker image 'zamstation/$repoName' failed."
	fi

done

#
# Shutdown
#
exit 0

#-----------------------------------------------------------------------------
