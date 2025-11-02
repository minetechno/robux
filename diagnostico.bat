@echo off
chcp 65001 >nul
color 0A
cls
echo ================================================================================
echo   DIAGNÓSTICO - robux.test
echo ================================================================================
echo.

echo [1] Verificando se WAMP está rodando...
echo.
curl -s http://localhost >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ WAMP está RODANDO
) else (
    echo ❌ WAMP NÃO está respondendo
    echo    Solução: Inicie o WAMP e aguarde o ícone ficar verde
)
echo.
echo ________________________________________________________________________________
echo.

echo [2] Verificando arquivo hosts...
echo.
findstr /C:"robux.test" C:\Windows\System32\drivers\etc\hosts >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ robux.test ENCONTRADO no arquivo hosts
    echo    Conteúdo:
    findstr /C:"robux.test" C:\Windows\System32\drivers\etc\hosts
) else (
    echo ❌ robux.test NÃO encontrado no arquivo hosts
    echo    Solução: Adicione esta linha ao arquivo hosts:
    echo    127.0.0.1   robux.test
    echo.
    echo    Como fazer:
    echo    1. Execute o Notepad como Administrador
    echo    2. Abra: C:\Windows\System32\drivers\etc\hosts
    echo    3. Adicione: 127.0.0.1   robux.test
)
echo.
echo ________________________________________________________________________________
echo.

echo [3] Testando acesso via localhost/robux...
echo.
curl -s -o nul -w "%%{http_code}" http://localhost/robux/teste.php >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Acesso via localhost/robux FUNCIONANDO
    echo    URL: http://localhost/robux/teste.php
) else (
    echo ⚠️  Não conseguiu acessar via localhost/robux
)
echo.
echo ________________________________________________________________________________
echo.

echo [4] Testando resolução DNS de robux.test...
echo.
ping -n 1 robux.test >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ robux.test está RESOLVENDO para IP
    ping -n 1 robux.test | findstr /C:"Resposta de" /C:"Reply from"
) else (
    echo ❌ robux.test NÃO está resolvendo
    echo    Solução: Configure o arquivo hosts (veja passo 2)
)
echo.
echo ________________________________________________________________________________
echo.

echo [5] Verificando porta 80...
echo.
netstat -ano | findstr ":80 " >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Porta 80 está em uso (WAMP pode estar rodando)
) else (
    echo ❌ Porta 80 NÃO está em uso
    echo    Solução: Inicie o WAMP
)
echo.
echo ________________________________________________________________________________
echo.

echo [6] Procurando versão do Apache...
echo.
if exist "C:\wamp64\bin\apache" (
    echo ✅ Pasta do Apache encontrada
    echo    Versões disponíveis:
    dir /B "C:\wamp64\bin\apache"
) else (
    echo ❌ Pasta do Apache não encontrada
)
echo.
echo ________________________________________________________________________________
echo.

echo [7] Testando acesso via robux.test...
echo.
curl -s -o nul -w "%%{http_code}" http://robux.test/teste.php 2>nul
if %errorlevel% equ 0 (
    echo ✅ robux.test está FUNCIONANDO!
    echo    Acesse: http://robux.test
) else (
    echo ❌ robux.test NÃO está acessível
    echo    Solução: Configure o Virtual Host
    echo    Leia: CONFIGURAR-VIRTUALHOST.txt
)
echo.
echo ================================================================================
echo.
echo RESUMO DOS TESTES:
echo ------------------
echo.
echo 1. Primeiro, teste via localhost:
echo    👉 http://localhost/robux/teste.php
echo.
echo 2. Se funcionar, configure o Virtual Host seguindo:
echo    👉 CONFIGURAR-VIRTUALHOST.txt
echo.
echo 3. Depois, acesse:
echo    👉 http://robux.test
echo.
echo ================================================================================
echo.
pause
