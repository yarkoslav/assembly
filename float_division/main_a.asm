include 'format/format.inc' 

format ELF64

section '.text' executable

public main
; needed imports
extrn func
extrn printf

 main:
    push rbp
    ; satisfying calling convention for func
    lea RDI, [a] ; here we set first argument(pointer to first array)
    lea RSI, [b] ; here we set second argument(pointer to second array)
    lea RDX, [x] ; here we set third argument(pointer to result array)
    mov RCX, 2 ; here we set fourth argument(size of arrays)
    call func
    
    ; satisfying calling convention for printf
    lea RDI, [msg] ; here we set first argument(pointer to message)
    lea RAX, [x] ; here we set RAX as pointer to array
    movsd XMM0, [RAX] ; here we set second argument(first double)
    movsd XMM1, [RAX+8] ; here we set third argument(second double)
    ; we set this values in XMM registers, because they are floats(doubles)
    call  printf

    ; exiting function
    pop rbp
    ret


section '.data' writeable

a dq 1.0f, 1000.0f ; first array
b dq -1.0f, 1.0f ;second array
x dq 0, 0 ; result array
msg db "Result is: %f %f",0xA,0 ; message to be printed
