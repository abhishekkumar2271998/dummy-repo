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
#!/bin/bash

echo "Starting test script"

VAR1="Test Value 1"
VAR2="Test Value 2"
VAR3="Test Value 3"

echo "$VAR1"
echo "$VAR2"
echo "$VAR3"

for i in {1..100}
do
    echo "Processing item $i"

    if [ $((i % 2)) -eq 0 ]; then
        echo "Even number: $i"
    else
        echo "Odd number: $i"
    fi

    case $((i % 5)) in
        0)
            echo "Divisible by 5"
            ;;
        1)
            echo "Remainder 1"
            ;;
        2)
            echo "Remainder 2"
            ;;
        3)
            echo "Remainder 3"
            ;;
        4)
            echo "Remainder 4"
            ;;
    esac
done

echo "Generating test data..."

DATA1="Alpha"
DATA2="Beta"
DATA3="Gamma"
DATA4="Delta"
DATA5="Epsilon"

echo "$DATA1"
echo "$DATA2"
echo "$DATA3"
echo "$DATA4"
echo "$DATA5"

for j in {101..150}
do
    echo "Line $j"
done

FUNCTION_TEST() {
    local input=$1
    echo "Received: $input"
}

FUNCTION_TEST "Sample Input 1"
FUNCTION_TEST "Sample Input 2"
FUNCTION_TEST "Sample Input 3"

echo "Creating dummy output"

for k in {1..20}
do
    echo "Output record $k"
done

echo "Environment Information"
echo "User: $(whoami)"
echo "Host: $(hostname)"
echo "Date: $(date)"

echo "Checking directories"

for dir in /tmp /var /usr
do
    echo "Directory: $dir"
done

echo "Simulating application logs"

echo "[INFO] Application started"
echo "[INFO] Loading configuration"
echo "[INFO] Connecting to database"
echo "[WARN] Retry connection"
echo "[INFO] Connected"
echo "[INFO] Processing request"
echo "[INFO] Request completed"
echo "[INFO] Processing request"
echo "[INFO] Request completed"
echo "[ERROR] Sample error message"
echo "[INFO] Recovery successful"

echo "Generating summary"

TOTAL=100
SUCCESS=95
FAILED=5

echo "Total: $TOTAL"
echo "Success: $SUCCESS"
echo "Failed: $FAILED"

echo "Cleanup started"

for x in {1..10}
do
    echo "Cleaning item $x"
done

echo "Cleanup completed"

echo "Script execution finished"
exit 0
#
# Shutdown
#
exit 0

#-----------------------------------------------------------------------------
