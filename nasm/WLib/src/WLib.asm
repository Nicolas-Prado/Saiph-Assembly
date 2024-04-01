; Standard library of Worcnaz Kyouma Prado A.
; Begin to made in: 31/03/2024
; Author: Watashi, nikorasu arumeida purado

section .data
    ; Constants
    PI      equ 3.14159

section .bss
    ; Variables

section .text
    ; Functions

    ; strToIntArray========================================
    ; Desc: Transform strings in the format: "1,2,3,4" into its true array value, integer values
    ; Input:
        ; First param: char* [address of the string]
        ; Second param: int [length of the string]
    ; Output: 
        ; eax = int* [address of the int array, -1 if error]
        ; edx = int [length of the int array]
    global strToIntArray
    strToIntArray:
        ; Function prologue
        push ebp
        mov ebp, esp

        ; Accessing parameters from stack
        mov eax, [ebp + 12]  ; First param
        mov edx, [ebp + 8]  ; Second param

        push eax
        push edx
        call strToArray

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret

    ; strToArray===========================================
    ; Desc: Transform strings in the format: "1,2,3,4" into an array
    ; Input:
        ; First param: char* [address of the string]
        ; Second param: int [length of the string]
    ; Output: 
        ; eax = char* [address of the array, -1 if error]
        ; edx = int [length of the array]
    global strToArray
    strToArray:
        ; Function prologue
        push ebp
        mov ebp, esp

        ; Accessing parameters from stack
        mov eax, [ebp + 12]  ; First param
        mov edx, [ebp + 8]  ; Second param

        ; Process
        mov esi, eax ; esi will manage the string loop
        buffer resb 256 ; buffer used to save the chars
        mov ebx, buffer
        mov ecx, 0
        mov eax, 0
    
        loop_start:
        mov al, [esi]

        cmp al, ','
        jnz no_endstring
        mov [ebx], '\0'
        inc eax

        no_endstring:
        inc esi
        inc ebx
        inc ecx
        cmp ecx, edx
        jz end_loop
        jmp loop_start

        end_loop:
        mov [ebx], '\0'
        inc eax

        ; Return values
        mov edx, eax
        mov eax, buffer

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret