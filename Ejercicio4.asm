%include "asm_io.inc"

section .bss
    num resd 1

section .data
    cad1 db "Escriba el primer nùmero: ", 0
    cad2 db "Escriba el segundo nùmero: ", 0
    cadIg db "Los valores son iguales.", 0
    cadDes db "Los valores son distintos.",0

section .text
global _asm_main
_asm_main:
    xor eax, eax
    
    ;ejercicio 4
    mov eax, cad1
    call print_string
    call read_int
    mov [num], eax
    mov ebx, [num]
    
    mov eax, cad2
    call print_string
    call read_int
    
    cmp eax, ebx
    je iguales
    jmp noiguales
    
    iguales:
        mov eax, cadIg
        call print_string
        call print_nl
        jmp salir
        
    noiguales:
        mov eax, cadDes
        call print_string
        call print_nl
        jmp salir
        
    salir:
        xor eax, eax
        xor ebx, ebx
    
    ret