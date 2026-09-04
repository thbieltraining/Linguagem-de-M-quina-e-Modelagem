Como compilar?

*1- Use o powershell para achar seu build tools caso não esteja em um ambiente já prepardo e também prepar eu arquivo .obj .
   **1.1 -  roda esses comando em sequência:  
" nasm -f win64 "Ola Mundo Win.asm" -o ola.obj "
" Get-ChildItem "C:\Program Files*\Microsoft Visual Studio" -Recurse -Filter "vcvars64.bat" -ErrorAction SilentlyContinue | Select-Object FullName "
   **1.2 - Bora pro CMD com o comando copiado: 
*2- Agora é CMD, cola o comando. 
   **2.1 - Roda um CD para seu diretório de trabalho só por garantia 
   **2.2 - Roda novamente:
" nasm -f win64 "Ola Mundo Win.asm" -o ola.obj "
   ** Agora vamos direcionar a compilação: 
" cl.exe ola.obj kernel32.lib /Fe:ola.exe /link /entry:mainCRTStartup /subsystem:console "
 

-- Por último e muito importante : 
[ola.exe]

