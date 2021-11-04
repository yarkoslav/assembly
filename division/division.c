#include <stdio.h>
#include "division.h"

int main(){
    double a, b, c;
    scanf("%lf %lf %lf", &a, &b, &c);
    divide(&a, &b, &c);
    printf("%lf", c);
    return 0;
}
