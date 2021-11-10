set disassembly-flavor intel
set disassemble-next-line on
b _start
b __libc_start_main
b main
