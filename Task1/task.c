#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE  100000
#define CALLS 100000

int use_static() {
    static int arr[SIZE];
    arr[0] = 1;
    return arr[0];
}
int use_heap() {
    int *arr = malloc(SIZE * sizeof(int));
    arr[0] = 1;
    int r = arr[0];
    free(arr);
    return r;
}

int main() {
    clock_t t;
 
    t = clock();
    for (int i = 0; i < CALLS; i++) use_static();
    printf("static: %.4f s\n", (double)(clock() - t) / CLOCKS_PER_SEC);

    for (int i = 0; i < CALLS; i++) use_heap();
    printf("heap: %.4f s\n", (double)(clock() - t) / CLOCKS_PER_SEC);
 

    return 0;
}