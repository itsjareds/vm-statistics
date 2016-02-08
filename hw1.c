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
#include "hw1.h"

void signal_handler();
double getTime();


#define TEST_SLEEP 1
// 1: test sleep  for TEST_SLEEP seconds
// 0: loop forever running instructions
#define LOOP_TEST  1


int main(int argc, char *argv[])
{
  double t = 0.0;
  struct sigaction sig;
  unsigned int k = 0;
  unsigned int iters = atoi(argv[1]); //Purposefully not validating input
  unsigned int bs = atoi(argv[2]);
  int sum;
  unsigned char *block = NULL;

  /* initialize RNG */
  srand(time(NULL));

  /* setup signals */
  memset(&sig,0,sizeof(sig));
  sig.sa_handler = signal_handler;
  sigaction (SIGINT,  &sig, NULL);
  sigaction (SIGALRM, &sig, NULL);
  
  /* allocate and initialize data block */
  block = (unsigned char*)malloc(sizeof(unsigned char) * bs);
  memset(block,rand()%256,sizeof(unsigned char)*bs);
	
  while (k < iters) 
  {
    t = getTime();
    sum = csum((unsigned short*)block, bs);
    t = getTime() - t;	
    printf("%3.7f 0X%xd \n",t,sum);
    k++;
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


