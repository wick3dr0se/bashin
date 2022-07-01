#include "tinyexpr.h"
#include <stdio.h>

int main() {
  char var[100];

  fgets(var, 100, stdin);
  printf("%f\n", te_interp(var, 0));

  return 0;
}
