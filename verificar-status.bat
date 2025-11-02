@echo off
chcp 65001 >nul
color 0B
cls

echo ╔════════════════════════════════════════════════════════════════╗
echo ║                                                                ║
echo ║              VERIFICAÇÃO DE STATUS - robux.test                ║
echo ║                                                                ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

echo [STATUS ATUAL]
echo.

REM Verificar arquivo hosts
echo 1. Arquivo hosts:
findstr /C:"robux.test" C:\Windows\System32\drivers\etc\hosts >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ robux.test está configurado
    findstr /C:"robux.test" C:\Windows\System32\drivers\etc\hosts
) else (
    echo    ❌ robux.test NÃO está configurado
    echo    ^👉 Execute: configurar-virtualhost.bat como Admin
)
echo.

REM Verificar WAMP
echo 2. WAMP Server:
curl -s -o nul -w "%%{http_code}" http://localhost 2>nul | findstr "200" >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ WAMP está RODANDO
) else (
    echo    ❌ WAMP NÃO está respondendo
    echo    ^👉 Inicie o WAMP e aguarde ficar verde
)
echo.

REM Verificar localhost/robux
echo 3. Acesso via localhost/robux:
curl -s -o nul -w "%%{http_code}" http://localhost/robux/index.php 2>nul | findstr "200" >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ Site acessível via localhost
    echo    ^👉 http://localhost/robux
) else (
    echo    ⚠️  Site não acessível via localhost
)
echo.

REM Verificar robux.test
echo 4. Acesso via robux.test:
ping -n 1 robux.test >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ DNS resolvendo para robux.test
    curl -s -o nul -w "%%{http_code}" http://robux.test 2>nul | findstr "200" >nul 2>&1
    if %errorlevel% equ 0 (
        echo    ✅ robux.test FUNCIONANDO!
        echo    ^👉 http://robux.test
    ) else (
        echo    ⚠️  robux.test não acessível
        echo    ^👉 Reinicie o WAMP
    )
) else (
    echo    ❌ robux.test não está resolvendo
    echo    ^👉 Execute: configurar-virtualhost.bat como Admin
)
echo.

REM Verificar versão Apache
echo 5. Apache:
for /d %%i in (C:\wamp64\bin\apache\apache*) do (
    echo    ✅ Versão: %%~nxi
)
echo.

echo ════════════════════════════════════════════════════════════════
echo.
echo RESUMO:
echo.
echo Para configurar robux.test:
echo   1. Execute configurar-virtualhost.bat como Admin
echo   2. Reinicie o WAMP
echo   3. Acesse: http://robux.test
echo.
echo Teste alternativo (sempre funciona):
echo   👉 http://localhost/robux
echo.
echo ════════════════════════════════════════════════════════════════
echo.
pause
