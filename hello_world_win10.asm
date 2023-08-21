section .data
    hello db 'Hello, World!', 0

section .text
    global main

extern ExitProcess
extern GetStdHandle
extern WriteConsoleA

main:
    ; Obter o identificador do console padrão (stdout)
    push -11            ; STD_OUTPUT_HANDLE = -11
    call GetStdHandle
    mov r8, rax         ; Salvar o identificador em r8

    ; Escrever a string no console
    mov r9, hello      ; Endereço da string
    mov r10, 13        ; Tamanho da string
    lea rdx, [r10*2]   ; Calcular tamanho em bytes
    xor rcx, rcx       ; Posição inicial (0)
    call WriteConsoleA

    ; Sair do programa
    xor ecx, ecx       ; Código de saída 0
    call ExitProcess