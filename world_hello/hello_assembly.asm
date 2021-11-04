include 'format/format.inc' 

format ELF64

section '.text' executable

 public hello
 extrn printf
 extrn puts
 extrn exit
 extrn getpid

 hello:
    push    rbp         ; Stack should be alinged to 16!

    call    plt.getpid  
    mov     esi, eax    ; Результат виклику -- в EAX
    lea     rdi, [msg]  ; Увага! Автоматично йде відносно RIP!
    xor     rax, rax    ; Кількість використаних XMM регістрів для variadic arg
    call    plt.printf      ; "printf rdi, rsi"

    xor     edi, edi    ; exit code
    call    plt.exit

    ; OR: 
    xor     eax, eax    ; exit code
    pop     rbp
    ret

section '.data' writeable

msg db "Current process ID is %d.",0xA,0
