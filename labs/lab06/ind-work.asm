%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите значение x: ',0
    res: DB 'Результат: y = (2 + x)^2 = ',0

SECTION .bss
    x: RESB 80

SECTION .text
GLOBAL _start
_start:
    mov eax, msg
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    add eax, 2      ; EAX = 2 + x
    mov ebx, eax    ; Сохраняем (2 + x) в EBX
    mul ebx         ; EAX = (2 + x) * (2 + x)
    mov edi, eax
    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
