section .text
    global _start
    extern parseAsciiToInt

_start:

    ; Reads A
    mov eax, 3h
    mov ebx, 0h
    mov ecx, aBuffer
    mov edx, aBufferSize
    int 80h

    push aBufferSize
    push aBuffer
    call parseAsciiToInt

    mov eax, 3h
    mov ebx, 0h
    mov ecx, bBuffer
    mov edx, bBufferSize
    int 80h
    
    mov eax, 3h
    mov ebx, 0h
    mov ecx, cBuffer
    mov edx, cBufferSize
    int 80h

   ;Read A
    ;Validate A and parse ASCII
    ;Allocate correct place to A

   ;Read B
    ;Validate B and parse ASCII
    ;Allocate correct place to B

   ;Read C
    ;Validate C and parse ASCII
    ;Allocate correct place to C

   ;Calculate delta
    ;Return no roots if delta < 0

   ;Calculate root 1
    ;Convert to ASCII
    ;If remainder != 0, contact the fraction

   ;Calculate root 2
    ;Convert to ASCII
    ;If remainder != 0, contact the fraction

   ;Print roots in screen

   ;OBS: Just integers

section .data

section .bss