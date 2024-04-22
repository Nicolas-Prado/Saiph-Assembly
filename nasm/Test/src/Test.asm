section .text
    global _start

%include "../../WLib/include/WLib.inc"

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 4
    int 80h

    push 4
    push buffer
    call parseStringToInt

    ; Syscall 0x03, to read string from user, is terminate by a space, the space is too inserted in the buffer
    ; If rest some data from the input that are not saved in memory, it will overflow out of the program! You
    ; can test it by making a full string and click enter, it will finish the string and overflow the enter to 
    ; the cmd

    ;push 3
    ;push dword buffer
    ;call parseStringToInt

    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    buffer dd 0

section .bss
    ;buffer resb 4