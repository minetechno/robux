@echo off
chcp 65001 >nul
color 0E
cls

echo ╔════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                            ║
echo ║             CONFIGURAÇÃO AUTOMÁTICA DO VIRTUAL HOST                        ║
echo ║                        robux.test                                          ║
echo ║                                                                            ║
echo ╚════════════════════════════════════════════════════════════════════════════╝
echo.

REM Verificar se está rodando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo ❌ ERRO: Este script precisa ser executado como ADMINISTRADOR!
    echo.
    echo Como fazer:
    echo 1. Clique com botão direito neste arquivo
    echo 2. Escolha "Executar como administrador"
    echo.
    pause
    exit /b 1
)

echo ✅ Executando como Administrador...
echo.

REM ============================================================================
REM PASSO 1: Configurar arquivo hosts
REM ============================================================================
echo [1/5] Configurando arquivo hosts...
echo.

findstr /C:"127.0.0.1   robux.test" C:\Windows\System32\drivers\etc\hosts >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✓ robux.test já está configurado no hosts
) else (
    echo 127.0.0.1   robux.test>> C:\Windows\System32\drivers\etc\hosts
    if %errorlevel% equ 0 (
        echo    ✓ robux.test adicionado ao arquivo hosts
    ) else (
        echo    ✗ Erro ao adicionar no arquivo hosts
    )
)
echo.

REM ============================================================================
REM PASSO 2: Detectar versão do Apache
REM ============================================================================
echo [2/5] Detectando versão do Apache...
echo.

set "APACHE_DIR="
for /d %%i in (C:\wamp64\bin\apache\apache*) do (
    set "APACHE_DIR=%%i"
)

if "%APACHE_DIR%"=="" (
    color 0C
    echo ❌ ERRO: Pasta do Apache não encontrada em C:\wamp64\bin\apache\
    echo.
    pause
    exit /b 1
)

echo    ✓ Apache encontrado: %APACHE_DIR%
echo.

REM ============================================================================
REM PASSO 3: Criar backup do httpd-vhosts.conf
REM ============================================================================
echo [3/5] Criando backup da configuração atual...
echo.

set "VHOSTS_FILE=%APACHE_DIR%\conf\extra\httpd-vhosts.conf"

if exist "%VHOSTS_FILE%" (
    copy "%VHOSTS_FILE%" "%VHOSTS_FILE%.backup.%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%" >nul 2>&1
    echo    ✓ Backup criado
) else (
    echo    ! Arquivo httpd-vhosts.conf não existe, será criado
)
echo.

REM ============================================================================
REM PASSO 4: Adicionar configuração do Virtual Host
REM ============================================================================
echo [4/5] Configurando Virtual Host...
echo.

REM Verificar se já existe configuração para robux.test
findstr /C:"ServerName robux.test" "%VHOSTS_FILE%" >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✓ Virtual Host robux.test já está configurado
) else (
    REM Adicionar configuração do localhost (se não existir)
    findstr /C:"ServerName localhost" "%VHOSTS_FILE%" >nul 2>&1
    if %errorlevel% neq 0 (
        echo. >> "%VHOSTS_FILE%"
        echo # Virtual Host para localhost >> "%VHOSTS_FILE%"
        echo ^<VirtualHost *:80^> >> "%VHOSTS_FILE%"
        echo     ServerName localhost >> "%VHOSTS_FILE%"
        echo     ServerAlias localhost >> "%VHOSTS_FILE%"
        echo     DocumentRoot "C:/wamp64/www" >> "%VHOSTS_FILE%"
        echo     ^<Directory "C:/wamp64/www"^> >> "%VHOSTS_FILE%"
        echo         Options +Indexes +Includes +FollowSymLinks +MultiViews >> "%VHOSTS_FILE%"
        echo         AllowOverride All >> "%VHOSTS_FILE%"
        echo         Require all granted >> "%VHOSTS_FILE%"
        echo     ^</Directory^> >> "%VHOSTS_FILE%"
        echo ^</VirtualHost^> >> "%VHOSTS_FILE%"
        echo    ✓ Virtual Host localhost configurado
    )

    REM Adicionar configuração do robux.test
    echo. >> "%VHOSTS_FILE%"
    echo # Virtual Host para robux.test >> "%VHOSTS_FILE%"
    echo ^<VirtualHost *:80^> >> "%VHOSTS_FILE%"
    echo     ServerName robux.test >> "%VHOSTS_FILE%"
    echo     ServerAlias www.robux.test >> "%VHOSTS_FILE%"
    echo     DocumentRoot "C:/wamp64/www/robux" >> "%VHOSTS_FILE%"
    echo     ^<Directory "C:/wamp64/www/robux"^> >> "%VHOSTS_FILE%"
    echo         Options +Indexes +Includes +FollowSymLinks +MultiViews >> "%VHOSTS_FILE%"
    echo         AllowOverride All >> "%VHOSTS_FILE%"
    echo         Require all granted >> "%VHOSTS_FILE%"
    echo     ^</Directory^> >> "%VHOSTS_FILE%"
    echo     ErrorLog "logs/robux-error.log" >> "%VHOSTS_FILE%"
    echo     CustomLog "logs/robux-access.log" common >> "%VHOSTS_FILE%"
    echo ^</VirtualHost^> >> "%VHOSTS_FILE%"
    echo    ✓ Virtual Host robux.test configurado
)
echo.

REM ============================================================================
REM PASSO 5: Verificar e habilitar httpd-vhosts.conf no httpd.conf
REM ============================================================================
echo [5/5] Verificando httpd.conf...
echo.

set "HTTPD_CONF=%APACHE_DIR%\conf\httpd.conf"

findstr /C:"Include conf/extra/httpd-vhosts.conf" "%HTTPD_CONF%" | findstr /V "^#" >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✓ httpd-vhosts.conf já está habilitado
) else (
    REM Tentar descomentar se estiver comentado
    powershell -Command "(Get-Content '%HTTPD_CONF%') -replace '^#(Include conf/extra/httpd-vhosts.conf)', '$1' | Set-Content '%HTTPD_CONF%'" >nul 2>&1
    if %errorlevel% equ 0 (
        echo    ✓ httpd-vhosts.conf descomentado com sucesso
    ) else (
        echo    ! Não foi possível habilitar automaticamente
        echo    ! Edite manualmente: %HTTPD_CONF%
        echo    ! Remova o # da linha: Include conf/extra/httpd-vhosts.conf
    )
)
echo.

REM ============================================================================
REM Limpar cache DNS
REM ============================================================================
echo [EXTRA] Limpando cache DNS...
echo.
ipconfig /flushdns >nul 2>&1
echo    ✓ Cache DNS limpo
echo.

REM ============================================================================
REM Resultados
REM ============================================================================
color 0A
echo ╔════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                            ║
echo ║                    ✅ CONFIGURAÇÃO CONCLUÍDA!                              ║
echo ║                                                                            ║
echo ╚════════════════════════════════════════════════════════════════════════════╝
echo.
echo Próximos passos:
echo.
echo 1. Reinicie os serviços do WAMP:
echo    - Clique no ícone do WAMP (barra de tarefas)
echo    - Selecione "Restart All Services"
echo    - Aguarde o ícone ficar VERDE
echo.
echo 2. Acesse no navegador:
echo    👉 http://robux.test
echo.
echo 3. Se não funcionar imediatamente:
echo    - Aguarde 10 segundos
echo    - Pressione Ctrl+F5 no navegador
echo    - Tente: http://robux.test/teste.php
echo.
echo ════════════════════════════════════════════════════════════════════════════
echo.
echo Arquivos modificados:
echo  • C:\Windows\System32\drivers\etc\hosts
echo  • %VHOSTS_FILE%
echo.
echo Backup salvo em:
echo  • %VHOSTS_FILE%.backup.*
echo.
echo ════════════════════════════════════════════════════════════════════════════
echo.

pause

REM Tentar abrir o navegador
echo Abrindo robux.test no navegador...
start http://robux.test
