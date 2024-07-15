; Create date: 21/04/2024
; Update date: 21/04/2024
; Author: Watashi wa nikorasu arumeida purado

; Desc: Integer to String ASCII
; Input:
    ; First param: int(32bits) [int -> string]
; Output:
    ; eax = char* [string address]
    ; ebx = int [string size]
    ; edx = int [0, not have error]

section .bss

section .data
; Pointers
    inversedString db 10 dup(0) ; max 4294967295
    string db 10 dup(0) ; max 4294967295

section .text
global parseIntToString
parseIntToString:
    ; Function prologue
    push ebp
    mov ebp, esp

    ; Accessing parameters from stack
    mov ebx, [ebp + 8]  ; Int value

    ; Break int into inversed string
    xor ecx, ecx
    mov esi, inversedString
    mov eax, ebx
    mov ebx, 10
    .loop_intToInversedString:
        xor edx, edx
        div ebx

        add edx, 00110000b

        mov [esi], edx

        inc esi
        inc ecx

        cmp eax, 0
        jne .loop_intToInversedString

    ; Invert string
    mov esi, string
    mov ebx, inversedString

    push ecx
    dec ecx
    add ebx, ecx
    .loop_invertString:
        mov edx, [ebx]
        mov [esi], edx

        inc esi
        dec ebx
        dec ecx
        jns .loop_invertString

    pop ecx

    ; Return values
    mov eax, string ; String address
    mov ebx, ecx ; String size
    xor edx, edx ; Error code

    ; Function epilogue
    mov esp, ebp
    pop ebp
    ret