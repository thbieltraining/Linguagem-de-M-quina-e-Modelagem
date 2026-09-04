# ⚙️ Olá Mundo em Assembly x64 - Windows

![Assembly](https://img.shields.io/badge/Assembly-x86--64-orange)
![NASM](https://img.shields.io/badge/Assembler-NASM-blue)

Projeto desenvolvido para estudos em **Assembly x86-64**, demonstrando o processo completo de montagem, linkedição e geração de um executável Windows utilizando **NASM** e as ferramentas de compilação da Microsoft.

O objetivo é compreender, na prática, o caminho entre um arquivo fonte `.asm`, a geração de um arquivo objeto `.obj` e a criação de um executável `.exe`.

---

## 📌 Funcionalidades

- Montagem de código Assembly utilizando NASM.
- Geração de arquivos objeto no formato Windows 64 bits.
- Configuração manual do ambiente MSVC.
- Linkedição utilizando bibliotecas nativas do Windows.
- Geração de executáveis `.exe`.
- Execução de aplicações Assembly através do terminal.

---

## 🛠️ Destaques Técnicos

1. **Arquitetura x86-64:**  
   Código preparado para execução em ambientes Windows 64 bits.

2. **NASM (Netwide Assembler):**  
   Utilizado para transformar o código Assembly `.asm` em um arquivo objeto `.obj`.

3. **Microsoft Visual C++ Build Tools:**  
   Utilizado para realizar a etapa de linkedição e geração do executável final.

4. **Windows API:**  
   Utilização da biblioteca `kernel32.lib` durante o processo de geração do executável.

---

## 🚀 Como Compilar e Executar

O processo de compilação segue o seguinte fluxo:

```text
.asm
 ↓
NASM
 ↓
.obj
 ↓
MSVC / Linker
 ↓
.exe
 ↓
Execução
