clear
clear all
clear matrix
set mem 1g
set more off, permanently
set maxvar 15000
set matsize 10000
set emptycells drop, permanently

global dir "C:/Users/suraj/Downloads/2017026data/JPE_replication"

global codedir "$dir/code_rep" 	
global input "$dir/input_rep"
global output "$dir/output_rep/tables" 
global plots "$dir/output_rep/plots" 

foreach package in sutex reghdfe geonear tmpdir reg2hdfe {
 		capture which `package'
 		if _rc==111 ssc install `package'
 }
 
 
*1. Main tables
do "$codedir/replication_main.do"
 
*2. Appendix tables
do "$codedir/replication_appendix.do"

*3. Afrobarometer tables
do "$codedir/replication_afrobarometer.do"

/*4. Produce Conley Standard Errors for all tables 
(This takes a long time!)*/
do "$codedir/replication_conleySE.do"

/*Replicate all figures except 4- 6. For Fig 4-6, 
use the R scripts in the code_rep folder*/
do "$codedir/replication_figures.do"
