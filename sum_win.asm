section .data
    num1 dq 10.5        ; Primeiro número (ponto flutuante)
    num2 dq 20.7        ; Segundo número (ponto flutuante)
    result dq 0.0       ; Variável para armazenar o resultado

section .text
    global main

main:
    ; Carregar os números em registradores xmm0 e xmm1
    movsd xmm0, qword [num1]
    movsd xmm1, qword [num2]

    ; Realizar a soma
    addsd xmm0, xmm1

    ; Armazenar o resultado na variável 'result'
    movsd qword [result], xmm0

    ; Sair do programa
    ret

    








    section .data
    newline db 0Ah       ; Caractere de nova linha
    format db '%d', 0    ; Formato para impressão de inteiros

section .text
    global main

main:
    mov rsi, 2           ; Início do intervalo
    mov rdi, 100         ; Fim do intervalo

check_prime_loop:
    mov rax, rsi         ; Carregar o número a ser verificado
    mov rcx, 2           ; Começar a divisão por 2
    mov rdx, 0           ; Limpar o restante

    div rcx              ; rax / rcx

    cmp rdx, 0           ; Verificar se o restante é zero
    je not_prime          ; Se for zero, não é primo

    ; Imprimir o número primo
    mov rdi, rax         ; Colocar o número em rdi para impressão
    call print_number

not_prime:
    inc rsi              ; Próximo número

    cmp rsi, rdi         ; Verificar se chegamos ao fim do intervalo
    jle check_prime_loop ; Se não, repetir o loop

    ; Sair do programa
    ret

print_number:
    push rax
    push rcx

    xor rax, rax         ; Zerar rax para contar o número de dígitos
count_digits:
    inc rax
    shr rdi, 1
    jnz count_digits

    mov rcx, rax         ; Salvar a contagem em rcx
    xor rax, rax         ; Zerar rax novamente

print_digit_loop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    add dl, '0'
    push rdx
    dec rcx
    jnz print_digit_loop

print_digit_loop_end:
    pop rdx
    mov rax, 4
    mov rbx, 1
    mov rcx, rdx
    mov rdx, 1
    mov rsi, format
    syscall

    pop rcx
    pop rax

    ret
