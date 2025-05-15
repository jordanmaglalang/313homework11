SECTION .data
inputBuf: 
    db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A ; an Input buffer of 8 bytes to be converted to ASCII hex
SECTION .bss
outputBuf:
    resb 80 ; an Output buffer that reserves uninitlized 80 bytes  
SECTION .text
    global _start 
_start:
    lea esi, [inputBuf] ; stores value of memory address of inputbuf
    lea edi, [outputBuf] ; stores value of memory address of outputbuf
    mov ecx, 8 
loop1:
    mov al, [esi]  ; moves the value of the input into a al register
    mov ah, al  ; moves the al register value to ah reigster

    ; Translates upper byte to ASCII hex
    and ah, 0F0h ; masks the lower byte to isolate upper byte
    shr ah, 4 ; shifts the byte 4 bits to get correct ascii value
    cmp ah, 9
    jbe if_digit ; if value is 0-9, jump to digit conversion 
    add ah, 37h ; if value is greater, converts to corresponding ASCII value
    jmp store_high ; places upper byte into output

    
    
    

if_digit:
    add ah, 30h ; converts to corresponding ASCII value if a digit

store_high:
    mov [edi], ah  ; places upper byte into output 
    inc edi ; moves output buffer 
    
    ;translates lower byte to ASCII hex
    mov ah, al ; moves the al register value to ah reigster
    and ah, 0Fh ; masks the upper byte to isolate lower byte
    cmp ah, 9
    jbe if_digit2  ; if value is 0-9, jump to digit conversion 
    add ah, 37h  ; if value is greater, converts to corresponding ASCII value
    jmp store_low ; places lower byte into output

if_digit2:
    add ah, 30h ; converts to corresponding ASCII value if a digit

store_low:
    mov [edi], ah ; places lower byte into output
    inc edi ; moves output buffer

    mov byte [edi], ' ' ; adds a space between each byte's hex representation
    inc edi
    
    inc esi
    loop loop1 ; repeats process for all 8 bytes
    
output:
    ; displays final outputBuf
    mov eax, 4 
    mov ebx, 1 
    lea ecx, [outputBuf]
    mov edx, 24
    int 80h 

    mov ebx,0
    mov eax,1   
    int 80h

