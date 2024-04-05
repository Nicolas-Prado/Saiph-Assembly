; Standard library of Worcnaz Kyouma Prado A.
; Begin to made in: 31/03/2024
; Author: Watashi, nikorasu arumeida purado

section .data
    ; Constants

section .bss
    ; Variables

section .text
    ; Functions

    ; Desc: String ASCII to Integer
    ; Input:
        ; First param: char* [address of the string]
        ; Second param: int [length of the string]
    ; Output:
        ; eax = int [integer value]
        ; ebx = char* [error desc address, 0 if no error]
        ; ecx = int [error desc size]
        ; edx = int [length of the integer]
    global parseAsciiToInt
    parseAsciiToInt:
        ; Function prologue
        push ebp
        mov ebp, esp

        ; Accessing parameters from stack
        mov eax, [ebp + 8]  ; String address
        mov edx, [ebp + 12]  ; String length

        ; Input validation
        cmp edx, 0
        jle parseAsciiToInt_error_invalidInput2

        ; Ascii number to Binary Number
        push eax
        mov esi, eax
        xor ecx, ecx
        parseAsciiToInt_loop_asciiParse:
            mov al, [esi]

            cmp al, '0'
            jb parseAsciiToInt_error_invalidInput1

            cmp al, '9'
            ja parseAsciiToInt_error_invalidInput1

            sub al, 00110000b

            mov [esi], al

            inc esi

            inc ecx
            cmp ecx, edx
            jb parseAsciiToInt_loop_asciiParse

        ; Sum of the binary numbers
        xor eax, eax ; Temporary number tenPotency
        xor ebx, ebx ; Sum number
        pop esi
        xor ecx, ecx
        parseAsciiToInt_loop_sumIntegers:
            mov al, [esi]
            cmp ecx, 0
            je parseAsciiToInt_loopEnd_tenPotency
            push ecx
            parseAsciiToInt_loop_tenPotency:
                imul eax, 10
                dec ecx
                cmp ecx, 0
                ja parseAsciiToInt_loop_tenPotency
            
            parseAsciiToInt_loopEnd_tenPotency:

            add ebx, eax

            pop ecx

            inc esi

            inc ecx
            cmp ecx, edx
            jb parseAsciiToInt_loop_sumIntegers

        ; Calculate number size
        mov eax, ebx
        xor ecx, ecx
        cmp eax, 0
        je parseAsciiToInt_loopEnd_rightShiftCalcIntSize
        parseAsciiToInt_loop_rightShiftCalcIntSize:
            shr eax, 1
            inc ecx
            cmp eax, 0
            jne parseAsciiToInt_loop_rightShiftCalcIntSize

        parseAsciiToInt_loopEnd_rightShiftCalcIntSize:

        ; Return values
        mov eax, ebx ; Int value
        xor ebx, ebx ; Error desc
        mov edx, ecx ; Int size

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret

        ; Errors
        parseAsciiToInt_error_invalidInput1:
            parseAsciiToInt_error_invalidInput1_message db "Please, give a correct integer number", 0Ah, 0
            parseAsciiToInt_error_invalidInput1_messageLength equ $ - parseAsciiToInt_error_invalidInput1_message

            mov ebx, parseAsciiToInt_error_invalidInput1_message
            mov ecx, parseAsciiToInt_error_invalidInput1_messageLength
            ret

        parseAsciiToInt_error_invalidInput2:
            parseAsciiToInt_error_invalidInput2_message db "Please, give a correct integer length, can't be null or ", 0Ah, 0
            parseAsciiToInt_error_invalidInput2_messageLength equ $ - parseAsciiToInt_error_invalidInput2_message

            mov ebx, parseAsciiToInt_error_invalidInput2_message
            mov ecx, parseAsciiToInt_error_invalidInput2_messageLength
            ret
