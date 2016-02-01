/**********************************************************
 * exampleUnixTime -  this program illustrates how to obtain
*    a Unix timestamp, how to compute a RTT, and how to print 
*    a timestamp as a human readable string.
*
* Notes:
*
* Revisions
*   $A0: 1-21-2016  release v1.0 
*
 **************************************************************/
#include "ex2.h"

void signal_handler();
double getTime();


#define TEST_SLEEP 1
// 1: test sleep  for TEST_SLEEP seconds
// 0: loop forever running instructions
#define LOOP_TEST  1


int main(int argc, char *argv[])
{
  double time = 0.0;
  struct sigaction sig;
  double i;
  double j;
  double innerLoopCount=1000000000;

  /* setup signals */
  memset(&sig,0,sizeof(sig));
  sig.sa_handler = signal_handler;
  sigaction (SIGINT,  &sig, NULL);
  sigaction (SIGALRM, &sig, NULL);
	
  while (1) 
  {
    //Example setting a timer
    alarm(2);
    time = getTime();

    //The alarm will pop is the inner function does not finish first`
    if (LOOP_TEST > 0 ) {
      sleep(TEST_SLEEP);
    } 
    else {
      j=1024;
      for (i=0;i<innerLoopCount;i++) {
        j += i / 1.1;
      }
    }
    time = getTime() - time;	
    alarm(0);
    printf("%3.7f\n",time);
  }     

  exit(0);
}

double getTime()
{
	struct timeval curTime;
	(void) gettimeofday (&curTime, (struct timezone *) NULL);
	return (((((double) curTime.tv_sec) * 1000000.0) 
             + (double) curTime.tv_usec) / 1000000.0); 
}

void signal_handler(int sig) {
  switch(sig) {
    case SIGINT:
      printf("SIGINT:   Exit! \n");
      exit(0);
      break;
    case SIGALRM:
      printf("SIGALRM:   Exit! \n");
      exit(0);
      break;
  }
}


