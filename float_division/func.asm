include 'format/format.inc' 

format ELF64

section '.text' executable

 public func

 func:
    ; RAX - i - counter, RDI - first array(a), RSI - second array(b), RDX - result array(x), RCX- size
    mov RAX, 0
    Loop1:
        cmp RAX, RCX ; compare counter with size of arrays
        jnl EndOfProgram ; if counter is >= size => end of program
        movsd XMM0, [RDI + 8*RAX] ; move double from first array
        movsd XMM1, [zero] ; set second register as 0(to subtract value)
        subsd XMM1, [RSI + 8*RAX] ; subtract value from second array(our solution is -b/a)
        divsd XMM1, XMM0 ; division of two values
        movsd [RDX + 8*RAX], XMM1 ; moving result to result array
        inc RAX ; increment counter
        jmp Loop1 ; jump to the beginning of the loop
    EndOfProgram:
        ret


section '.data' writeable

zero dq 0
