; Como já escrito no começo do título, bora aprender um pouco sobre as linguagens de baixo nível

; Linguagem de baixo nível
; É aquela que está mais próxima do hardware do computador.
; Ela trabalha com instruções que o processador entende com mais proximidade.
; Por isso, o programador precisa conhecer melhor como o computador funciona.

; Exemplo de linguagem de baixo nível:
; Assembly
; O Assembly usa instruções como:
; MOV AX, 1
; ADD AX, 2

; Isso significa:
; - mover o valor 1 para o registrador AX
; - somar 2 ao valor que está em AX

; A linguagem de baixo nível é mais difícil de escrever e entender
; porque ela tem menos abstração e mais detalhes técnicos.

; Vantagens:
; - maior controle do hardware
; - melhor desempenho
; - útil em sistemas embarcados e drivers

; Desvantagens:
; - mais complicada
; - mais sujeita a erros
; - menos legível para humanos

; Em resumo:
; Linguagem de baixo nível = próxima do computador, não da pessoa.
; Ela é mais difícil, mas dá mais controle e eficiência.

; Programa introdutório em Assembly
; Este exemplo soma dois valores

section .data
    valor1 db 10
    valor2 db 5
    resultado db 0

section .text
    global _start

_start:
    mov al, [valor1]   ; move 10 para o registrador AL
    add al, [valor2]   ; soma 5 ao valor atual
    mov [resultado], al ; guarda o resultado em resultado

    ; fim do programa
    mov eax, 1
    xor ebx, ebx
    int 0x80    