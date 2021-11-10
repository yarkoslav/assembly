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
    lea RDI, [a]
    lea RSI, [b]
    lea RDX, [x]
    mov RCX, 2
    call func
    
    ; satisfying calling convention for printf
    lea RDI, [msg]
    lea RAX, [x]
    movsd XMM0, [RAX]
    movsd XMM1, [RAX+8]
    call  printf

    ; exiting function
    xor RAX, RAX
    pop rbp
    ret


section '.data' writeable

a dq 1.0f, 1000.0f
b dq -1.0f, 1.0f
x dq 0, 0
msg db "Result is: %f %f",0xA,0 
