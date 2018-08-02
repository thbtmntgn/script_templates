#!/bin/bash
# Author:
# Email:
# Date:
# Script:

################################################################################
# TODO:
# - 
################################################################################

################################################################################
# BASH CONFIGURATION
################################################################################

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

################################################################################
# FUNTIONS
################################################################################

function USAGE() {

	printf "Usage:\n\t%s -a PARAM [PARAMETERS]\n" $( basename ${0} )
	printf "\t%s [-h]\n" $( basename ${0} )

	cat <<EOF

Required parameters:
	-a : parameter             [required]

Optional parameters:
	-o : output directory      [by default: working directory]
	-c : CPU number            [by default: 1]
	-v : verbose mode (yes|no) [by default: no]

Help:
	-h : print this help

Description:

	TO BE COMPLETED!

EOF

	exit ${1:-0}

}

################################################################################
# BY DEFAULT VALUES
################################################################################

PARAM_PATH="NOTDEFINED"

OUTDIR=$( pwd )
CPU=1
VERBOSE="no"

################################################################################
# OPTION PARSING
################################################################################

while getopts ":a:o:c:v:h" OPTION ; do
	case ${OPTION} in
		a)
			PARAM_PATH=${OPTARG}
			# PARAM_FULLNAME=$( basename ${PARAM_PATH} )
			# PARAM_NAME=${PARAM_FULLNAME%%.*}
			# PARAM_EXTENSION=${PARAM_FULLNAME#*.}
			;;
		o)
			OUTDIR=${OPTARG}
			;;
		c)
			CPU=${OPTARG}
			;;
		v)
			VERBOSE=${OPTARG}
			;;
		h)
			USAGE
			;;
		:)
			echo -e "Error: option -${OPTARG} requires an parameter."
			exit 1
			;;
		\?)
			echo -e "Error: invalid option -${OPTARG}"
			exit 1
			;;
	esac
done

################################################################################
# VERIFICATIONS
################################################################################

if [[ ${PARAM_PATH} == "NOTDEFINED" ]] ; then
	USAGE
	exit 1
fi

if [[ ! ${CPU} =~ ^[0-9]+$ ]] ; then
	echo -e "-c parameter needs an integer greater than 0"
	exit 1
fi

if [[ ${VERBOSE} != "no" && ${VERBOSE} != "yes" ]] ; then
	echo -e "-v parameter needs 'yes' or 'no' as value"
	exit 1
fi

################################################################################
# BEGIN SCRIPT
################################################################################

echo -e "[$( basename ${0}): ${SECONDS}s] ---> START"

################################################################################

if [[ ${VERBOSE} == "yes" ]] ; then
	echo -e "[$( basename ${0}): ${SECONDS}s] ---> Parameter       : ${PARAM_PATH}"
	echo -e "[$( basename ${0}): ${SECONDS}s] ---> Output directory: ${OUTDIR}"
	echo -e "[$( basename ${0}): ${SECONDS}s] ---> CPU number      : ${CPU}"
	echo -e "[$( basename ${0}): ${SECONDS}s] ---> Verbose mode    : ${VERBOSE}"
fi

if [[ ${VERBOSE} == "yes" ]] ; then
	CMD="script.sh -a ${R1_PATH} -v"
	echo -e "[$( basename ${0}): ${SECONDS}s] ---> script.sh description"
else
	CMD="script.sh -a ${R1_PATH}"
fi

CMD="script.sh -a ${PARAM_PATH} -v ${VERBOSE}"
echo -e "[$( basename ${0}): ${SECONDS}s] ---> ${CMD}"
#eval ${CMD}

################################################################################
# END SCRIPT
################################################################################

echo -e "[$( basename ${0}): ${SECONDS}s] ---> END"
