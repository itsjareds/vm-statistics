/**********************************************************
 * exampleUnixTime -  this program illustrates how to obtain
*    a Unix timestamp, how to compute a RTT, and how to print 
*    a timestamp as a human readable string.
*
* Notes:
*  -to build, just issue 'gcc exampleUnixTime.c'
*
* Revisions
*
 **************************************************************/
#include <stdio.h>
#include <stdlib.h>     /* for atoi() and exit() */
#include <unistd.h>
#include <sys/time.h>
#include <string.h>     /* for memset() */
#include <signal.h>
#include <errno.h>
#include <time.h>       /* for time() */

unsigned short csum(unsigned short *ptr, int nbytes);

