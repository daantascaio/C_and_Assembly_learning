section .data
    hello db 'Hello, World!',0

section .text
    global _start

_start:
    ; Escrever a string "Hello, World!" no stdout (saída padrão)
    mov rax, 1          ; syscall para escrever (sys_write)
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, hello     ; endereço da string
    mov rdx, 13         ; tamanho da string
    syscall             ; chamar o kernel

    ; Sair do programa
    mov rax, 60         ; syscall para sair (sys_exit)
    xor rdi, rdi        ; código de saída 0
    syscall             ; chamar o kernel