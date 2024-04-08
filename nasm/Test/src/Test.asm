section .text
    global _start

%include "../../WLib/include/WLib.inc"

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 4
    int 80h

    push 3
    push dword buffer
    call parseStringToInt

    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data

section .bss
    buffer resb 4