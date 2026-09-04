; ============================================
; Ola Mundo Win.asm - Windows x64 NATIVO (sem C), usando Win32 API direta
; Todos nossos cod anteriores eram para Linux, e usavam syscalls diretas (mov rax, 1 / syscall).
;
; Diferenca fundamental do Linux: o Windows NAO expoe numeros de syscall
; diretos pro programador (como fazia o "mov rax, 1 / syscall" no Linux).
; Em vez disso, voce chama FUNCOES exportadas pela kernel32.dll
; (GetStdHandle, WriteFile, ExitProcess) -- essas funcoes, por baixo dos
; panos, e' que fazem a chamada real ao kernel do Windows.
;
; Compilar:
;   nasm -f win64 "Ola Mundo Win.asm" -o ola.obj
; Linkar (sem precisar de C/cl.exe, so o linker):
;   link.exe ola.obj kernel32.lib /entry:mainCRTStartup /subsystem:console /out:ola.exe
; Rodar:
;   .\ola.exe
; ============================================

default rel              ; usa enderecamento relativo ao RIP (padrao recomendado no win64)

extern GetStdHandle
extern WriteFile
extern ExitProcess

section .data
    mensagem db "Ola, mundo!", 13, 10   ; Windows usa CRLF (13,10), Linux usa so LF (10)
    tamanho equ $ - mensagem

section .bss
    hStdOut resq 1              ; vai guardar o "handle" (identificador) da tela
    bytesEscritos resd 1          ; a API exige um lugar pra guardar quantos bytes foram escritos

section .text
    global mainCRTStartup         ; ponto de entrada (equivalente ao _start do Linux)

mainCRTStartup:
    ; RESERVA DE PILHA: convencao Win64 exige "shadow space" (32 bytes) antes
    ; de qualquer CALL, mais espaco extra se a funcao tiver mais de 4 parametros.
    ; WriteFile tem 5 parametros, entao reservamos 48 bytes (32 + 16 de folga,
    ; mantendo o alinhamento de 16 bytes que a convencao exige).
    sub rsp, 48

    ; ---- pega o "handle" da saida padrao (a tela) ----
    mov ecx, -11                  ; STD_OUTPUT_HANDLE = -11 (constante fixa da API)
    call GetStdHandle
    mov [hStdOut], rax

    ; ---- escreve a mensagem na tela, via WriteFile ----
    ; Convencao Win64: 1o-4o parametros vao em RCX, RDX, R8, R9
    mov rcx, [hStdOut]              ; 1o parametro: o handle da tela
    lea rdx, [mensagem]               ; 2o parametro: ponteiro pra string
    mov r8d, tamanho                     ; 3o parametro: quantos bytes escrever
    lea r9, [bytesEscritos]                ; 4o parametro: onde a API vai guardar "quantos bytes escreveu de fato"
    mov qword [rsp+32], 0                     ; 5o parametro (lpOverlapped=NULL) vai NA PILHA, logo apos o shadow space
    call WriteFile

    ; ---- encerra o programa ----
    xor ecx, ecx                    ; codigo de saida = 0 (sucesso)
    call ExitProcess