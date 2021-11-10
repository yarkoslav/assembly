#include <stdio.h>
#include <stdlib.h>
#include "func.h"

int main() {
    size_t size = 2;
    double *a = malloc(size * sizeof(double));
    double *b = malloc(size * sizeof(double));
    double *x = malloc(size * sizeof(double));
    a[0] = 1.0;
    b[0] = -1.0;
    a[1] = 1000.0;
    b[1] = 1.0;
    func(a, b, x, size);
    printf("Result is: %f %f\n", x[0], x[1]);
    free(a);
    free(b);
    free(x);
    return 0;
}
