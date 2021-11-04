include 'format/format.inc' 

format ELF64

section '.text' executable

 public divide

 divide:
    ; integer division
    ; xor RDX, RDX
    ; mov RAX, RDI
    ; mov RCX, RSI
    ; div RCX
    ; ret


    ; floating division
    fld qword [RDI]
    fld qword [RSI]
    fdiv st0, st1
    fstp qword [RDX]
    ret
