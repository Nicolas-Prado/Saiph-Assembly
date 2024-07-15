; Create date: 21/04/2024
; Update date: 21/04/2024
; Author: Watashi wa nikorasu arumeida purado

; Desc: String ASCII to Integer
; Input:
    ; First param: char* [address of the string]
    ; Second param: int [length of the string]
; Output:
    ; eax = int [integer value]
    ; edx = int [error code, 0 if no error]

section .bss

section .data
; Pointers
    intArray dd 0

; Errors
    extern error_invalidInput_code

section .text
global parseStringToInt
parseStringToInt:
    ; Function prologue
    push ebp
    mov ebp, esp

    ; Accessing parameters from stack
    mov ebx, [ebp + 8]  ; String address
    mov edx, [ebp + 12]  ; String length

    ; Input validation
    cmp edx, 0
    je .error_invalidInput
    cmp edx, 4
    ja .error_invalidInput

    ; Each char to int
    mov esi, ebx
    mov ebx, intArray
    xor ecx, ecx
    .loop_charToInt:
        mov al, [esi]

        cmp al, 00001010b
        je .loopEnd_charToInt

        ;pusha
        ;mov eax, 4
        ;mov ebx, 1
        ;mov ecx, esi
        ;mov edx, 1
        ;int 0x80
        ;popa

        sub al, 00110000b ;Populate SF if result is negative
        js .error_invalidInput
        cmp al, '9'
        ja .error_invalidInput

        mov [ebx], al

        inc ecx
        inc esi
        inc ebx

        cmp ecx, edx
        jb .loop_charToInt
    .loopEnd_charToInt:

    cmp ecx, 0
    je .error_invalidInput

    ; Sum arrayInt
    mov esi, intArray
    mov ebx, 0 ; Int sum
    mov edx, 10 ; Potency multiplicator
    
    dec ecx
    jz .loopEnd_intSum
    .loop_intSum:
        xor eax, eax
        mov al, [esi]

        push ecx
        .loop_intPotency:
            mul edx
            dec ecx
            cmp ecx, 0
            ja .loop_intPotency
        pop ecx

        add ebx, eax

        inc esi
        dec ecx

        cmp ecx, 0
        ja .loop_intSum
    .loopEnd_intSum:
    xor eax, eax
    mov al, [esi] ; Position 0

    add ebx, eax

    ; Return values
    mov eax, ebx ; Int value
    xor edx, edx ; Error code

    ; Function epilogue
    mov esp, ebp
    pop ebp
    ret

    ; Errors
    .error_invalidInput:
        xor eax, eax
        mov edx, [error_invalidInput_code]

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret