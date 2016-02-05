# Q3
* Need to generate data to analyze linux behavior as the workload increases.
* Data block size should increase exponentially (2^n)
* Graph scale should be log_2(datasize) to give log scale
* Exp1: simple case
* Exp2: complicate exp1 with parallel execution
  * Way to do this: top level script, params (exp#, #cores)
  * `./runHW1 &` (background the process)
  * Do this twice, make sure output is to separate directories
  * For plots: make one plot for each core
* Exp3: 
