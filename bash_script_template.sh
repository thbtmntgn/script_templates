#!/bin/bash
# Author:
# Email:
# Date:

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error when substituting.

TIME_START_SCRIPT=${SECONDS}

############
# FUNTIONS #
############

function USAGE() {

	printf "Usage:\n\t%s -a PARAM [-c CPU] [-o OUTDIR] [-v]\n" $( basename ${0} )
	printf "\t%s [-h]\n" $( basename ${0} )

	cat <<EOF

Required parameters:
	-a : parameter

Optionnal parameters:
	-c : CPU number               [by default: 1]
	-o : output directory         [by default: working directory]

Help:
	-h : print this help
	-v : to activate verbose mode [by default: not activated]

Description:

	TO BE COMPLETED!

EOF

	exit ${1:-0}

}

#####################
# BY DEFAULT VALUES #
#####################

PARAM_PATH="NOTDEFINED"

CPU=1
OUTDIR=$( pwd )

VERBOSE="NO"

##################
# OPTION PARSING #
##################

while getopts ":vha:c:o:" OPTION
do
	case ${OPTION} in
		a)
			PARAM_PATH=${OPTARG}
			PARAM_FULLNAME=$( basename ${PARAM_PATH} )
			PARAM_NAME=${PARAM_FULLNAME%%.*}
			PARAM_EXTENSION=${PARAM_FULLNAME#*.}
			;;
		c)
			CPU=${OPTARG}
			;;
		o)
			OUTDIR=${OPTARG}
			;;
		h)
			USAGE
			;;
		v)
			VERBOSE="YES"
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

#################
# VERIFICATIONS #
#################

if [[ ${PARAM_PATH} == "NOTDEFINED" ]] ; then
	USAGE
	exit 1
fi

################
# BEGIN SCRIPT #
################

echo -e "\n# BEGIN $( basename ${0} )"

################################################################################

if [[ ${VERBOSE} == "YES" ]] ; then
	echo -e "\n\t[VERBOSE PARAM] ---> Parameter       : ${PARAM}"
	echo -e "\t[VERBOSE PARAM] ---> CPU number      : ${ARGB}"
	echo -e "\t[VERBOSE PARAM] ---> Output directory: ${OUTDIR}"
	echo -e "\t[VERBOSE PARAM] ---> Verbose mode    : ${VERBOSE}"
fi

if [[ ${VERBOSE} == "YES" ]] ; then
	echo -e "\n\t[VERBOSE INFOS] --->$ script.sh description"
	CMD="script.sh -a ${PARAM} -v"
	echo -e "\t[VERBOSE COMMAND] --->$ {CMD}"
else
	CMD="script.sh -a ${PARAM}"
fi

eval ${CMD}

################################################################################

##############
# END SCRIPT #
##############

TIME_END_SCRIPT=$(( SECONDS - TIME_START_SCRIPT ))

echo -e "$( basename ${0} )\t${TIME_END_SCRIPT}" >> ${OUTDIR}/time.report

echo -e "\n# END OF $( basename ${0} ) IN ${TIME_END_SCRIPT} SECONDS"
