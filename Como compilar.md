# ⚙️ Como Compilar

### 1. Preparando o ambiente

Utilize o **PowerShell** para localizar o ambiente de compilação do Visual Studio, caso você não esteja utilizando um terminal já preparado.

Primeiro, gere o arquivo objeto `.obj`:

```powershell
nasm -f win64 "Ola Mundo Win.asm" -o ola.obj
```

Em seguida, localize o arquivo `vcvars64.bat`:

```powershell
Get-ChildItem "C:\Program Files*\Microsoft Visual Studio" -Recurse -Filter "vcvars64.bat" -ErrorAction SilentlyContinue | Select-Object FullName
```

Copie o caminho retornado pelo comando.

---

### 2. Configurando o ambiente de compilação

Agora abra o **CMD (Prompt de Comando)**.

Cole e execute o caminho do `vcvars64.bat` encontrado anteriormente para preparar o ambiente de compilação.

Depois, navegue até o diretório onde está localizado o projeto:

```cmd
cd "CAMINHO_DO_SEU_PROJETO"
```

---

### 3. Gerando novamente o arquivo objeto

Por garantia, execute novamente o NASM:

```cmd
nasm -f win64 "Ola Mundo Win.asm" -o ola.obj
```

---

### 4. Gerando o executável

Agora vamos realizar a linkedição e gerar o arquivo `.exe`:

```cmd
cl.exe ola.obj kernel32.lib /Fe:ola.exe /link /entry:mainCRTStartup /subsystem:console
```

Após a compilação, será gerado o executável:

```text
ola.exe
```

---

## ▶️ Executando

Por último — e muito importante 😄 — execute:

```cmd
ola.exe
```

Ou simplesmente abra:

```text
[ ola.exe ]
```