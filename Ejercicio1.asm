%include "asm_io.inc"
section .bss

section .data
var dd 10010b
var2 db 34h

section .text
global _asm_main
_asm_main:
    xor eax, eax
    ;Incrementar el valor del registro EAX
    inc eax
    ;Cargar el registro EBX con el decimal 18 con la label binaria
    mov ebx, [var]
    ;Sumar 200 a EAX
    add eax, 200
    call print_int
    call print_nl
    ;Mover el valor que se encuentra en la dirección de memoria de EBX al registro alto de EAX(AX)
    xor eax, eax
    mov ax, bx ;¿¿??
    call print_int
    call print_nl
    ;Multiplicar 52 especificado en hexadecimal (34h) con el valor almacenado en la dirección de memoria de EBX
    mov cx, [var2]
    mul cx
    call print_int
    call print_nl
    ;Sumar al registro EAX el valor que se encuentra almacenado en la dirección de memoria de EBX incrementado 4 veces
    add ebx, 4
    add eax, ebx
    call print_int
    call print_nl
    ret
    
    ;COMPILE
    ;nasm -f elf NOMBRE.asm
    ;nasm -f elf -d ELF_TYPE asm_io.asm
    ;gcc -m32 -o NOMBRE asm_io.o driver.c NOMBRE.o
