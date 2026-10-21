# Task 1 – Static vs Stack vs Heap Arrays

## Introduction

This program compares three ways of creating the same large array in C:

- **Static** – the array is declared with `static`, so it is created once and lives for the whole program.
- **Stack** – the array is a normal local variable, so it is created on the stack every time the function is called.
- **Heap** – the array is created with `malloc` and removed with `free` every time the function is called.

Each function is called **100,000 times**, and the program prints how long each one took.

## How to run

Open a terminal in the `Task1` folder and run:

```bash
gcc task.c -o task
./task
```

Example output:

```
static: 0.0001 s
heap: 0.0077 s
stack: 0.0002 s
```

## How the file was written (step by step)

### Step 1 – Static array (commit `add static array`)

First I added the includes, two constants, and the static function:

```c
#define SIZE  100000   // number of ints in the array
#define CALLS 100000   // how many times each function is called

int use_static() {
    static int arr[SIZE];
    arr[0] = 1;
    return arr[0];
}
```

In `main` I measure the time with `clock()`: save the time, run the loop, then print the difference divided by `CLOCKS_PER_SEC` to get seconds.

```c
t = clock();
for (int i = 0; i < CALLS; i++) use_static();
printf("static: %.4f s\n", (double)(clock() - t) / CLOCKS_PER_SEC);
```

### Step 2 – Heap array (commit `add heap array`)

Next I added a function that asks the system for memory with `malloc`, uses it, and gives it back with `free`:

```c
int use_heap() {
    int *arr = malloc(SIZE * sizeof(int));
    arr[0] = 1;
    int r = arr[0];
    free(arr);
    return r;
}
```

I also added a loop for it in `main` that prints the `heap` time. Before the loop, `t = clock();` starts a new timer, so only the heap calls are measured.

### Step 3 – Stack array (commit `add stack array`)

Last I added the stack version. It is a normal local array:

```c
int use_stack() {
    int arr[SIZE];
    arr[0] = 1;
    return arr[0];
}
```

And one more loop in `main` that prints the `stack` time, again starting a new timer with `t = clock();` before it.

## Explaining the results

- **Static is the fastest.** The array is created only once when the program starts. Calling the function just writes one value, so no memory is created at all during the calls.
- **Stack is also very fast.** Creating a local array only moves the stack pointer by `SIZE * sizeof(int)` bytes. This is one CPU instruction, so it costs almost nothing, even for a big array.
- **Heap is the slowest.** `malloc` and `free` are real function calls. They have to search for a free block of memory, keep track of it, and give it back. For a large array (400 KB) the system may even ask the operating system for memory every time. This takes much longer than moving the stack pointer.

So the order is: **static ≈ stack < heap**.

> **Note:** With optimizations on (`gcc -O2`), all three show `0.0000 s`, because the compiler sees the functions do almost nothing and removes the work. That is why the program should be compiled without `-O2` for this test.
