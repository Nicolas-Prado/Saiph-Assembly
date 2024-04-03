section .text
    global _start

_start:
    mov eax, 0x04
    mov ebx, 1
    mov ecx, hello_message
    mov edx, hello_message_length
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    hello_message db "Hello World! This must be a choice of Steins;Gate!", 0x0A, 0
    hello_message_length equ $ - hello_message

section .bss