#include <stdio.h>
#include "add3.h"


int main() {
    int a, b, c, d;
    scanf("%d %d %d", &a, &b, &c);
    d = add3(a, b, c);
    printf("%d", d);
    return 0;
}
