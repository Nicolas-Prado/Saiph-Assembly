section .text
    global _start

%include "../../WLib/include/WLib.inc"

_start:
    mov eax, 3h
    mov ebx, 0h
    mov ecx, buffer
    mov edx, 4
    int 80h

    push 3
    push buffer
    call parseStringToInt

    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data

section .bss
    buffer resb 4