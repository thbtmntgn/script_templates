#!/usr/local/bin/perl

use strict;
use warnings;

################################################################################

############
# PACKAGES #
############

use Cwd;
use Getopt::Long;

################################################################################

#############
# FUNCTIONS #
#############

sub usage {

	print <<EOF;

Usage:
	$0 -a xxx [-o OUTDIR] [-v]
	$0 [-h]

Required arguments:
	-a | --argument : xxx

Optionnal arguments:
	-o | --outdir   : output directory      [by default: working directory]

Help:
	-h | --help     : print this help
	-v | --verbose  : activate verbose mode [by default: not activated]

Description:

	TO BE COMPLETED!
EOF

	exit;

}

################################################################################

############
# DEFAULTS #
############

my $argA    = "NOTDEFINED";
my $outdir  = getcwd();
my $verbose = 0;
my $help    = 0;

################################################################################

###########
# OPTIONS #
###########

GetOptions (
	"a|argument=s" => \$argA,     # string
	"o|outdir=s"   => \$outdir,  # file
	"v|verbose"    => \$verbose, # flag
	"h|help"       => \$help,    # flag
) or die ("Error in command line arguments\n");

################################################################################

if( $help || $argA eq "NOTDEFINED" ) {
	usage();
}

################################################################################

################
# START SCRIPT #
################

print "\n# BEGIN $0\n";

################################################################################

if ( $verbose ){
	print "\t[VERBOSE] ---> Argument -a : ".$argA."\n" ;
	print "\t[VERBOSE] ---> Output directory : ".$outdir."\n" ;
}

################################################################################

##############
# END SCRIPT #
##############

print "# END $0\n\n";
