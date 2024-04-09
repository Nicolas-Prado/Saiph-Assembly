 ; Standard library of Worcnaz Kyouma Prado A.
; Begin to made in: 31/03/2024
; Author: Watashi, nikorasu arumeida purado

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
    global parseStringToInt
    parseStringToInt:
        ; Function prologue
        push eax
        mov ebp, esp

        ; Accessing parameters from stack
        mov eax, [ebp + 8]  ; String address
        mov edx, [ebp + 12]  ; String length

        ; Input validation
        cmp edx, 0
        jle parseStringToInt_error_invalidInput2

        ; Ascii number to Binary Number
        push eax
        mov esi, eax
        xor ecx, ecx

        parseStringToInt_loop_asciiParse:
            mov al, [esi]

            cmp al, 00000000b
            jne parseStringToInt_conditional_noParseZero
            mov al, 00110000b
            parseStringToInt_conditional_noParseZero:

            cmp al, '0'
            jb parseStringToInt_error_invalidInput1

            cmp al, '9'
            ja parseStringToInt_error_invalidInput1

            sub al, 00110000b

            mov [esi], al

            inc esi

            inc ecx
            cmp ecx, edx
            jb parseStringToInt_loop_asciiParse

        ; Sum of the binary numbers
        xor eax, eax ; Temporary number tenPotency
        xor ebx, ebx ; Sum number
        pop esi
        xor ecx, ecx
        parseStringToInt_loop_sumIntegers:
            mov al, [esi]
            cmp ecx, 0
            je parseStringToInt_loopEnd_tenPotency
            push ecx
            parseStringToInt_loop_tenPotency:
                imul eax, 10
                dec ecx
                cmp ecx, 0
                ja parseStringToInt_loop_tenPotency
            
            parseStringToInt_loopEnd_tenPotency:

            add ebx, eax

            pop ecx

            inc esi

            inc ecx
            cmp ecx, edx
            jb parseStringToInt_loop_sumIntegers

        ; Calculate number size
        mov eax, ebx
        xor ecx, ecx
        cmp eax, 0
        je parseStringToInt_loopEnd_rightShiftCalcIntSize
        parseStringToInt_loop_rightShiftCalcIntSize:
            shr eax, 1
            inc ecx
            cmp eax, 0
            jne parseStringToInt_loop_rightShiftCalcIntSize

        parseStringToInt_loopEnd_rightShiftCalcIntSize:
        mov eax, ecx
        mov ecx, 10
        xor edx, edx
        div ecx
        inc eax
        cmp edx, 0
        je parseStringToInt_condition_notRemainder
        inc eax
        parseStringToInt_condition_notRemainder:

        ; Return values
        mov eax, ebx ; Int value
        mov edx, ecx ; Int size
        xor ebx, ebx ; Error desc
        xor ecx, ecx ; Error size

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret

        ; Errors
        parseStringToInt_error_invalidInput1:
            pop esi ;Push no processo! Veja no loop

            mov ebx, parseStringToInt_error_invalidInput1_message
            mov ecx, parseStringToInt_error_invalidInput1_messageLength

            ; Function epilogue
            mov esp, ebp
            pop ebp
            ret

        parseStringToInt_error_invalidInput2:
            mov ebx, parseStringToInt_error_invalidInput2_message
            mov ecx, parseStringToInt_error_invalidInput2_messageLength

            ; Function epilogue
            mov esp, ebp
            pop ebp
            ret

    ; Desc: Integer to String ASCII
    ; Input:
        ; First param: int* [address of the integer]
        ; Second param: int [length of the integer]
    ; Output:
        ; eax = char* [string pointer]
        ; ebx = char* [error desc address, 0 if no error]
        ; ecx = int [error desc size]
        ; edx = int [length of the string]

    global parseIntToString
    parseIntToString:
        ; Function prologue
        push ebp
        mov ebp, esp

        ; Accessing parameters from stack
        mov eax, [ebp + 8]  ; Integer address
        mov edx, [ebp + 12]  ; Integer length

        ; Input validation
        cmp edx, 0
        jle parseIntToString_error_invalidInput1

        cmp edx, 4
        jg parseIntToString_error_invalidInput1

        ; Get value
        mov esi, eax
        mov ecx, edx
        xor eax, eax
        xor edx, edx
        parseIntToString_loop_getMultiByteValue:
            mov dl, [esi]
            shl eax, 8
            add eax, edx
            inc esi
            dec ecx
            jnz parseIntToString_loop_getMultiByteValue
        
        ; Get Integer array
        mov ebx, 10
        xor ecx, ecx
        xor edx, edx
        mov esi, parseIntToString_pointer_inversedDigitArray
        parseIntToString_loop_getIntegerDigitArray:
            div ebx
            mov [esi], edx

            inc esi
            inc ecx

            add edx, eax
            cmp edx, 0
            jne parseIntToString_loop_getIntegerDigitArray
        cmp ecx, 2
        jb parseIntToString_condition_decreaseEcxDigitsCounter
        dec ecx
        parseIntToString_condition_decreaseEcxDigitsCounter:

        ; Inverse inversedDigitArray
        mov esi, parseIntToString_pointer_digitArray
        mov ebx, parseIntToString_pointer_inversedDigitArray
        add ebx, ecx
        dec ebx
        parseIntToString_loop_inverseDigitArray:
            mov eax, [ebx]
            mov [esi], eax

            inc esi
            dec ebx
            cmp ebx, parseIntToString_pointer_inversedDigitArray
            jae parseIntToString_loop_inverseDigitArray

        ; Parse Integer array to Ascii array
        mov esi, parseIntToString_pointer_digitArray
        mov edx, ecx
        parseIntToString_loop_intArrayToString:
            mov al, [esi]
            add al, 00110000b
            mov [esi], al

            inc esi

            dec ecx
            cmp ecx, 0
            ja parseIntToString_loop_intArrayToString
            
        ; Return values
        mov eax, parseIntToString_pointer_digitArray ; String pointer
        mov edx, edx ; String size
        xor ebx, ebx ; Error desc
        xor ecx, ecx ; Error size

        ; Function epilogue
        mov esp, ebp
        pop ebp
        ret

        ; Errors
        parseIntToString_error_invalidInput1:
            mov ebx, parseIntToString_error_invalidInput1_message
            mov ecx, parseIntToString_error_invalidInput1_messageLength
            ret

section .data
    ; Debug data
    debugTest db "debug", 0Ah, 0
    debugTestlength equ $ - debugTest

    ; Debug
    ; pusha
    ; mov eax, 4
    ; mov ebx, 1
    ; mov ecx, debugTest
    ; mov edx, debugTestlength
    ; int 0x80
    ; popa

    ; Errors
    parseStringToInt_error_invalidInput1_message db "Please, give a correct integer number", 0Ah, 0
    parseStringToInt_error_invalidInput1_messageLength equ $ - parseStringToInt_error_invalidInput1_message

    parseStringToInt_error_invalidInput2_message db "Please, give a correct integer length, can't be 0 or negative", 0Ah, 0
    parseStringToInt_error_invalidInput2_messageLength equ $ - parseStringToInt_error_invalidInput2_message

    parseIntToString_error_invalidInput1_message db "Please, give a correct integer length, can't be 0, negative or higher than 4 bytes", 0Ah, 0
    parseIntToString_error_invalidInput1_messageLength equ $ - parseIntToString_error_invalidInput1_message

section .bss
    ; Unitialized variables

    ; parseIntToString
    parseIntToString_pointer_inversedDigitArray resb 10
    parseIntToString_pointer_digitArray resb 10
