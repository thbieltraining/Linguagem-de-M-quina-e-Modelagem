; Vamo criar um cod mais simples, mas mais compplexo que o anterior
; Vai ser nossa entrada
; Vamo de Olá, Mundo! 


section .data
    mensagem db "Ola, mundo!", 10
    tamanho equ $ - mensagem

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, mensagem
    mov rdx, tamanho
    syscall

    mov rax, 60
    mov rdi, 0
    syscall