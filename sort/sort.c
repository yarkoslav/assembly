#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "sort.h"
#include <inttypes.h>

int main() {
  int size = 10;
  uint64_t *to_sort = malloc((size+1)*sizeof(uint64_t));
  for(uint64_t i = 0; i < size; ++i){
    to_sort[i] = size-i;
  }
  for (int i = 0; i < size; ++i){
      printf("%" PRIu64 "\n", to_sort[i]);
  }
  sort(to_sort, size);
  for(int i = 0 ; i < size; ++i){
    printf("%" PRIu64 "\n", to_sort[i]);
  }
  return 0;
}
