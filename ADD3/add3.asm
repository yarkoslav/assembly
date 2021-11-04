include 'format/format.inc' 

format ELF64

public add3 

section '.text' executable

 add3:
    add RDI, RSI
    add RDI, RDX
    mov RAX, RDI
    ret
