#!/usr/bin/Rscript
# Author:
# Email:
# Date:
# Script:

################################################################################
# TODO:
# - 
################################################################################

################################################################################
# R PACKAGES
################################################################################

library("optparse")

################################################################################

option_list = list(
	make_option( "--arg1",    type="character", default=NULL,   help="Argument 1 [required]"),
	make_option( "--arg2",    type="character", default="arg2", help="Argument 2 [by default: arg2]"),
	make_option( "--verbose", type="character", default="no",   help="Verbose    [by default: no]")
);

################################################################################

opt_parser = OptionParser(option_list=option_list);
opt        = parse_args(opt_parser);

if ( is.null(opt$arg1) || is.null(opt$arg2) ){
	print_help(opt_parser)
	stop("At least one argument must be supplied (input file)")
}

if ( opt$verbose != 'yes' && opt$verbose != 'no' ){
	print_help(opt_parser)
	stop("--verbose must be 'yes' or 'no'")
}

################################################################################

script_name <- basename( sub( ".*=", "", commandArgs()[4] ) )

cat( sprintf( "[%s] ---> START\n", script_name ) )

if (opt$verbose == "yes"){
	cat( sprintf( "[%s] ---> arg1   : %s\n", script_name, opt$arg1 ) )
	cat( sprintf( "[%s] ---> arg2   : %s\n", script_name, opt$arg2 ) )
	cat( sprintf( "[%s] ---> verbose: %s\n", script_name, opt$verbose ) )
}

################################################################################

cat( sprintf( "[%s] ---> END\n", script_name ) )
