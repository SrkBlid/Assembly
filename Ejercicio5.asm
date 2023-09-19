%include "asm_io.inc"

section .data
    cad1 db "Los valores del arreglo a1 son: ", 0
    cad2 db "Los valores del arreglo a2 son: ", 0
    cad3 db "Los valores del arreglo a3 son: ", 0
    cadSep db " ", 0
    
    a1 db 0, 1, 2, 3
    a2 dw 4, 5, 6, 7
    a3 dd 8, 9, 10, 11

section .text
global _asm_main
_asm_main:
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
    
    ;ejercicio 5
    mov eax, cad1
    call print_string
    mov eax, 0
    mov ecx, 4
    mov ebx, 0
    
    arreglo1:
        mov al, [a1+ebx]
        call print_int
        mov eax, cadSep
        call print_string
        xor eax, eax
        inc ebx
        cmp ecx, ebx
        je iniArreglo2
        jmp arreglo1
    
    iniArreglo2:
        mov eax, cad2
        call print_nl
        call print_string
        mov ecx, 8
        mov ebx, 0
        mov eax, 0
        
    arreglo2:
        mov ax, [a2+ebx]
        call print_int
        mov eax, cadSep
        call print_string
        xor eax, eax
        inc ebx
        inc ebx
        cmp ecx, ebx
        je iniArreglo3
        jmp arreglo2
        
    iniArreglo3:
        mov eax, cad3
        call print_nl
        call print_string
        mov ecx, 16
        mov ebx, 0
        mov eax, 0
        
    arreglo3:
        mov eax, [a3+ebx]
        call print_int
        mov eax, cadSep
        call print_string
        inc ebx
        inc ebx
        inc ebx
        inc ebx
        cmp ecx, ebx
        je final
        jmp arreglo3
    
    final:
        call print_nl
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
    
    ret