include 'format/format.inc' 

format ELF64

section '.text' executable

public main
; needed imports
extrn func
extrn printf

 main:
    push rbp
    mov R13, 0 ; this value is storing information is it our first or second printing(because we need to move to different lines of our code in this cases)
    ; printing array before sorting
    jmp printingArray
    afterFirstPrinting:
        ; satisfying calling convention for func
        lea RDI, [arr] ; set in RDI first argument(pointer to array)
        mov RSI, 10 ; set in RSI second argument(size of array)
        call func
    
        ; printing array after sorting
        jmp printingArray
    afterSecondPrinting:
        ; exiting function
        pop rbp
        ret

printingArray:
    mov R12, 0 ; counter for printing array
    Looping:
        cmp R12, 10 ; compare counter with size of array
        jnl EndOfLoop ; if it is >=, then we end our loop
        
        ; satisfying calling convention for printf
        lea RDI, [msg] ; set in RDI first argument(pointer to string)
        lea RBX, [arr] ; here we set in RBX pointer to our array
        mov RSI, [RBX+8*R12] ; here we set in RSI second argument(element of array to be printed)
        call printf
        inc R12 ; increment counter
        jmp Looping
    EndOfLoop:
        inc R13 ; here we increment our value, which stores data about number of printing
        cmp R13, 1 ; if it is 1, it's our first printing
        ; otherwise, it's second
        je afterFirstPrinting
        jmp afterSecondPrinting

section '.data' writeable

arr dq 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 ; our array
msg db "%zu",0xA,0 ; our message to be printed(value of array)
