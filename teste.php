<?php
// Arquivo de teste para verificar se o WAMP está funcionando
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teste - WAMP Funcionando</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0F0F0F;
            color: #fff;
            padding: 40px;
            text-align: center;
        }
        .success {
            background: #22C55E;
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            margin: 20px 0;
        }
        .info {
            background: #1F1F1F;
            padding: 20px;
            border-radius: 10px;
            margin: 20px auto;
            max-width: 600px;
            text-align: left;
        }
        a {
            color: #E2231A;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>✅ WAMP está FUNCIONANDO!</h1>

    <div class="success">
        <h2>PHP está rodando corretamente</h2>
        <p>Versão do PHP: <?php echo phpversion(); ?></p>
    </div>

    <div class="info">
        <h3>📋 Informações do Servidor:</h3>
        <p><strong>Servidor:</strong> <?php echo $_SERVER['SERVER_SOFTWARE']; ?></p>
        <p><strong>Porta:</strong> <?php echo $_SERVER['SERVER_PORT']; ?></p>
        <p><strong>Host:</strong> <?php echo $_SERVER['HTTP_HOST']; ?></p>
        <p><strong>Caminho do arquivo:</strong> <?php echo __FILE__; ?></p>
    </div>

    <div class="info">
        <h3>🔗 Links para Testar:</h3>
        <p>✅ <a href="http://localhost/robux/teste.php">http://localhost/robux/teste.php</a> (este arquivo)</p>
        <p>🎯 <a href="http://localhost/robux/index.php">http://localhost/robux/index.php</a> (site principal)</p>
        <p>🌐 <a href="http://robux.test/teste.php">http://robux.test/teste.php</a> (depois de configurar virtual host)</p>
        <p>🎯 <a href="http://robux.test">http://robux.test</a> (site no virtual host)</p>
    </div>

    <div class="info">
        <h3>📝 Próximos Passos:</h3>
        <ol style="text-align: left;">
            <li>Se você está vendo esta página por <strong>localhost/robux</strong> - ótimo! O WAMP funciona.</li>
            <li>Agora configure o virtual host seguindo o arquivo: <strong>CONFIGURAR-VIRTUALHOST.txt</strong></li>
            <li>Após configurar, acesse <a href="http://robux.test">http://robux.test</a></li>
        </ol>
    </div>

    <p style="margin-top: 40px; color: #9CA3AF;">
        Se você consegue ver esta página, o servidor está funcionando! 🚀
    </p>
</body>
</html>
