# Script PowerShell para configurar Virtual Host do robux.test
# Execute como Administrador

# Verificar se está rodando como Admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host ""
    Write-Host "❌ ERRO: Este script precisa ser executado como ADMINISTRADOR!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Como fazer:" -ForegroundColor Yellow
    Write-Host "1. Clique com botão direito no Windows PowerShell" -ForegroundColor Yellow
    Write-Host "2. Escolha 'Executar como administrador'" -ForegroundColor Yellow
    Write-Host "3. Execute: cd C:\wamp64\www\robux" -ForegroundColor Yellow
    Write-Host "4. Execute: .\configurar-virtualhost.ps1" -ForegroundColor Yellow
    Write-Host ""
    pause
    exit 1
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "║          CONFIGURAÇÃO DO VIRTUAL HOST - robux.test             ║" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# PASSO 1: Configurar hosts
Write-Host "[1/5] Configurando arquivo hosts..." -ForegroundColor Yellow
$hostsPath = "C:\Windows\System32\drivers\etc\hosts"
$hostsContent = Get-Content $hostsPath -Raw

if ($hostsContent -match "robux\.test") {
    Write-Host "   ✓ robux.test já está no arquivo hosts" -ForegroundColor Green
} else {
    Add-Content -Path $hostsPath -Value "`r`n127.0.0.1   robux.test"
    Write-Host "   ✓ robux.test adicionado ao arquivo hosts" -ForegroundColor Green
}
Write-Host ""

# PASSO 2: Detectar versão do Apache
Write-Host "[2/5] Detectando versão do Apache..." -ForegroundColor Yellow
$apacheDir = Get-ChildItem "C:\wamp64\bin\apache" -Directory | Select-Object -First 1

if (-not $apacheDir) {
    Write-Host "   ❌ Apache não encontrado!" -ForegroundColor Red
    pause
    exit 1
}

Write-Host "   ✓ Apache encontrado: $($apacheDir.Name)" -ForegroundColor Green
Write-Host ""

# PASSO 3: Backup
Write-Host "[3/5] Criando backup..." -ForegroundColor Yellow
$vhostsPath = "$($apacheDir.FullName)\conf\extra\httpd-vhosts.conf"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

if (Test-Path $vhostsPath) {
    Copy-Item $vhostsPath "$vhostsPath.backup.$timestamp"
    Write-Host "   ✓ Backup criado" -ForegroundColor Green
} else {
    Write-Host "   ! Arquivo não existe, será criado" -ForegroundColor Yellow
}
Write-Host ""

# PASSO 4: Configurar Virtual Hosts
Write-Host "[4/5] Configurando Virtual Hosts..." -ForegroundColor Yellow

$vhostsContent = ""
if (Test-Path $vhostsPath) {
    $vhostsContent = Get-Content $vhostsPath -Raw
}

if ($vhostsContent -match "ServerName robux\.test") {
    Write-Host "   ✓ robux.test já está configurado" -ForegroundColor Green
} else {
    $localhostVhost = @"

# Virtual Host para localhost
<VirtualHost *:80>
    ServerName localhost
    ServerAlias localhost
    DocumentRoot "C:/wamp64/www"
    <Directory "C:/wamp64/www">
        Options +Indexes +Includes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
"@

    $robuxVhost = @"

# Virtual Host para robux.test
<VirtualHost *:80>
    ServerName robux.test
    ServerAlias www.robux.test
    DocumentRoot "C:/wamp64/www/robux"
    <Directory "C:/wamp64/www/robux">
        Options +Indexes +Includes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog "logs/robux-error.log"
    CustomLog "logs/robux-access.log" common
</VirtualHost>
"@

    if ($vhostsContent -notmatch "ServerName localhost") {
        Add-Content -Path $vhostsPath -Value $localhostVhost
        Write-Host "   ✓ localhost Virtual Host criado" -ForegroundColor Green
    }

    Add-Content -Path $vhostsPath -Value $robuxVhost
    Write-Host "   ✓ robux.test Virtual Host criado" -ForegroundColor Green
}
Write-Host ""

# PASSO 5: Habilitar httpd-vhosts.conf
Write-Host "[5/5] Verificando httpd.conf..." -ForegroundColor Yellow
$httpdConfPath = "$($apacheDir.FullName)\conf\httpd.conf"
$httpdContent = Get-Content $httpdConfPath -Raw

if ($httpdContent -match "^Include conf/extra/httpd-vhosts\.conf" -and $httpdContent -notmatch "^#Include conf/extra/httpd-vhosts\.conf") {
    Write-Host "   ✓ httpd-vhosts.conf já está habilitado" -ForegroundColor Green
} else {
    $httpdContent = $httpdContent -replace "^#(Include conf/extra/httpd-vhosts\.conf)", '$1'
    Set-Content -Path $httpdConfPath -Value $httpdContent
    Write-Host "   ✓ httpd-vhosts.conf habilitado" -ForegroundColor Green
}
Write-Host ""

# Limpar cache DNS
Write-Host "[EXTRA] Limpando cache DNS..." -ForegroundColor Yellow
ipconfig /flushdns | Out-Null
Write-Host "   ✓ Cache DNS limpo" -ForegroundColor Green
Write-Host ""

# Resultado final
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                                                                ║" -ForegroundColor Green
Write-Host "║                  ✅ CONFIGURAÇÃO CONCLUÍDA!                     ║" -ForegroundColor Green
Write-Host "║                                                                ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "PRÓXIMOS PASSOS:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1️⃣  REINICIE O WAMP:" -ForegroundColor Yellow
Write-Host "   • Clique no ícone do WAMP (bandeja do sistema)" -ForegroundColor White
Write-Host "   • Escolha 'Restart All Services'" -ForegroundColor White
Write-Host "   • Aguarde o ícone ficar VERDE" -ForegroundColor White
Write-Host ""
Write-Host "2️⃣  ACESSE NO NAVEGADOR:" -ForegroundColor Yellow
Write-Host "   👉 http://robux.test" -ForegroundColor Cyan
Write-Host ""
Write-Host "3️⃣  SE NÃO FUNCIONAR:" -ForegroundColor Yellow
Write-Host "   • Aguarde 10 segundos após reiniciar o WAMP" -ForegroundColor White
Write-Host "   • Pressione Ctrl+F5 no navegador" -ForegroundColor White
Write-Host "   • Teste: http://robux.test/teste.php" -ForegroundColor White
Write-Host ""
Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Gray
Write-Host ""

pause

# Abrir navegador
Write-Host "Abrindo robux.test no navegador..." -ForegroundColor Cyan
Start-Process "http://robux.test"
