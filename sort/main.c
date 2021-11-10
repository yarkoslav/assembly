#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <inttypes.h>
#include "func.h"

int main() {
  size_t size = 10;
  uint64_t *to_sort = malloc(size * sizeof(uint64_t));
  for(uint64_t i = 0; i < size; ++i){
    to_sort[i] = size-i;
  }
  for (size_t i = 0; i < size; ++i){
      printf("%" PRIu64 "\n", to_sort[i]);
  }
  func(to_sort, size);
  for(int i = 0 ; i < size; ++i){
    printf("%" PRIu64 "\n", to_sort[i]);
  }
  return 0;
}
