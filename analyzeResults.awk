#!/usr/bin/awk
# assumes variable `scale' set from shell script
# assumes input is pre-sorted by $1

BEGIN {
  i = 0
  sum = 0
  sumsq = 0
}

{
  usec = $1 * 1000000
  a[i++] = usec
  sum += usec
  sumsq += usec^2
}

END {
  if (NR > 0) {
    printf("%d %d %.3f %.3f %.3f\n",
           NR, scale, sum/NR, a[NR/2], sqrt(sumsq/NR - (sum/NR)^2))
  }
}
