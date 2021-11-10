include 'format/format.inc' 

format ELF64

section '.text' executable

 public func

 func:
    ; R8 - j, R9 - i, R10 - key, R11 - A[i], RDI - beginning of array, RSI - size of array 
    mov RAX, 1
    mov R8, 1  
    cmp R8, RSI
    jl Looping1
    je EndOfLoop1
    Looping1:
    mov R10,[RDI + 8*R8] 
    mov R9, R8
    dec R9 
    cmp R9, 0
    jl EndOfLoop2
    mov R11, [RDI+8*R9]
    cmp R11, R10
    jle EndOfLoop2
    jg Looping2
    Looping2:
    mov [RDI + 8*R9 + 8], R11 
    dec R9
    cmp R9, 0
    jl EndOfLoop2
    mov R11, [RDI + 8*R9]
    cmp R11, R10
    jle EndOfLoop2
    jg Looping2
    jmp EndOfLoop2
    EndOfLoop2:
    mov [RDI + 8*R9 + 8], R10
    inc R8
    cmp R8, RSI
    jl Looping1
    je EndOfLoop1
    EndOfLoop1:
    mov RAX, 0
    ret
