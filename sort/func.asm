include 'format/format.inc' 

format ELF64

section '.text' executable

 public func

 func:
    ; R8 - j, R9 - i, R10 - key, R11 - A[i], RDI - beginning of array, RSI - size of array
    ; this is insertion sort implementation
    ; it's implemetation of pseudo-code from:
    ; https://www.ee.ryerson.ca/~courses/coe428/sorting/insertionsort.html

    mov R8, 1 ; set counter j(number of sorted elements in the beginning) to the 1
    Looping1:
        cmp R8, RSI ; here we compare counter with size of array(if it's less, we continue sorting)
        je EndOfLoop1 ; if no, our sorting is finished
        mov R10,[RDI + 8*R8] ; here we set value of key = A[j]
        mov R9, R8
        dec R9 ; in this two lines we set counter i(which will find place of inserted element) to j-1
        Looping2:
            cmp R9, 0 ; here we compare our counter of inserted position with 0(if it's 0, then we have found a place for it)
            jl EndOfLoop2 ; jumping to the end of this loop
            mov R11, [RDI+8*R9] ; here we set value of R11 = A[i]
            cmp R11, R10 ; here we compare value of A[i] with key
            jle EndOfLoop2 ; if it is <= key, then we have found a place for our inserting value
            ; here we are "shifting" our A[i] to A[i+1] if otherwise
            mov [RDI + 8*R9 + 8], R11 
            dec R9 ; reduce counter i by 1
            jmp Looping2
        EndOfLoop2:
            mov [RDI + 8*R9 + 8], R10 ; here we finally insert our value to it's place
            inc R8 ; increment counter j
            jmp Looping1
    EndOfLoop1:
            ret ; end of function
