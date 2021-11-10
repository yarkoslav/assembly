include 'format/format.inc' 

format ELF64

section '.text' executable

public main
; needed imports
extrn func
extrn printf

 main:
    push rbp
    ; for first and second printing
    mov R13, 0
    ; printing array before sorting
    jmp printingArray
    afterFirstPrinting:
    ; satisfying calling convention for func
    lea RDI, [arr]
    mov RSI, 10
    call func
    
    ; printing array after sorting
    jmp printingArray
    afterSecondPrinting:
    ; exiting function
    xor RAX, RAX
    pop rbp
    ret

printingArray:
    mov R12, 0
    Looping:
        cmp R12, 10
        jnl EndOfLoop
        
        ; satisfying calling convention for printf
        lea RDI, [msg]
        lea RBX, [arr]
        mov RSI, [RBX+8*R12]
        call printf
        inc R12
        jmp Looping
    EndOfLoop:
        inc R13
        cmp R13, 1
        je afterFirstPrinting
        jmp afterSecondPrinting

section '.data' writeable

arr dq 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
msg db "%zu",0xA,0
