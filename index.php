<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Robux — Gift Cards de Robux, simples e rápido</title>
  <meta name="description" content="Landing page estática para seleção de Gift Cards de Robux. Somente design, sem back-end.">
  <link rel="icon" href="assets/favicon.ico">
  <meta property="og:title" content="Robux — Gift Cards de Robux" />
  <meta property="og:description" content="Escolha valores de Gift Card de Robux. Entrega digital (placeholder)." />
  <meta property="og:image" content="assets/giftcards/robux-800.png" />
  <meta name="theme-color" content="#0F0F0F" />
  <!--
    FUTURO BACK-END: PHP 8+ + MariaDB (exclusivamente).
    Este arquivo está como .php apenas para deixar o projeto pronto para integrar back-end depois.
    Não adicionar código PHP nesta fase (somente HTML/CSS/JS).
  -->
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
  <a class="skip-link" href="#conteudo">Pular para o conteúdo</a>

  <!-- Header fixo -->
  <header class="site-header" role="banner">
    <nav class="container nav" aria-label="Principal">
      <a class="brand" href="#" aria-label="Robux Home">
        <img src="assets/logo.svg" alt="Robux" width="32" height="32" />
        <span class="brand-text">robux</span>
      </a>
      <div class="nav-actions">
        <ul class="menu">
          <li><a href="#como-funciona">Como Funciona</a></li>
          <li><a href="#faq">FAQ</a></li>
          <li><a href="#suporte">Suporte</a></li>
        </ul>
        <a href="#giftcards" class="btn btn-primary btn-nav">Gift Cards</a>
      </div>
    </nav>
  </header>

  <main id="conteudo" class="main" role="main">
    <!-- Hero -->
    <section class="hero container" aria-labelledby="hero-title">
      <div class="hero-content">
        <div class="hero-text">
          <div class="hero-badge">Entrega Instantânea</div>
          <h1 id="hero-title">Gift Cards de Robux<br><span class="highlight">Simples e Rápido</span></h1>
          <p class="hero-subtitle">Escolha o valor, finalize quando quiser. Entrega digital imediata após a compra.</p>
          <div class="hero-ctas">
            <a class="btn btn-primary btn-large" href="#giftcards">
              <span>Ver Gift Cards</span>
              <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.5 15L12.5 10L7.5 5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </a>
            <a class="btn btn-outline" href="#como-funciona">Como Funciona</a>
          </div>
          <div class="hero-features">
            <div class="feature-item">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M9 12L11 14L15 10M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="#22C55E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <span>100% Seguro</span>
            </div>
            <div class="feature-item">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M13 10V3L4 14H11V21L20 10H13Z" stroke="#22C55E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <span>Entrega Rápida</span>
            </div>
            <div class="feature-item">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 8V12L15 15M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="#22C55E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <span>Suporte 24/7</span>
            </div>
          </div>
        </div>
        <div class="hero-art" aria-hidden="true">
          <div class="hero-card-mockup">
            <div class="mockup-glow"></div>
            <img src="assets/giftcards/robux-800.png" alt="" />
          </div>
          <div class="shape s1"></div>
          <div class="shape s2"></div>
          <div class="shape s3"></div>
          <div class="shape s4"></div>
        </div>
      </div>
    </section>

    <!-- Grade de Gift Cards -->
    <section id="giftcards" class="container section" aria-labelledby="gc-title">
      <div class="section-header">
        <div>
          <h2 id="gc-title">Escolha seu Gift Card</h2>
          <p class="muted">Selecione o valor ideal para você</p>
        </div>
      </div>

      <!-- Filtros por Preço -->
      <div class="filters" role="group" aria-label="Filtrar por preço">
        <button class="filter-btn active" data-filter="all">Todos</button>
        <button class="filter-btn" data-filter="0-50">Até R$ 50</button>
        <button class="filter-btn" data-filter="50-100">R$ 50 - R$ 100</button>
        <button class="filter-btn" data-filter="100+">Acima de R$ 100</button>
      </div>

      <div class="grid-cards">
        <!-- Card 400 -->
        <article class="card" data-price-value="25" aria-labelledby="gc-400-title">
          <div class="card-badges">
            <span class="badge badge-digital">Digital</span>
          </div>
          <img class="card-img" src="assets/giftcards/robux-400.png" alt="Gift Card de 400 Robux" loading="lazy" />
          <div class="card-body">
            <h3 id="gc-400-title">400 Robux</h3>
            <p class="card-desc">Gift Card Digital</p>
            <div class="card-footer">
              <p class="price" data-price="25">R$ 25,00</p>
              <a href="#" class="btn btn-primary" aria-disabled="true">Comprar Agora</a>
            </div>
          </div>
        </article>

        <!-- Card 800 -->
        <article class="card" data-price-value="50" aria-labelledby="gc-800-title">
          <div class="card-badges">
            <span class="badge badge-digital">Digital</span>
            <span class="badge badge-popular">Mais Vendido</span>
          </div>
          <img class="card-img" src="assets/giftcards/robux-800.png" alt="Gift Card de 800 Robux" loading="lazy" />
          <div class="card-body">
            <h3 id="gc-800-title">800 Robux</h3>
            <p class="card-desc">Gift Card Digital</p>
            <div class="card-footer">
              <p class="price" data-price="50">R$ 50,00</p>
              <a href="#" class="btn btn-primary" aria-disabled="true">Comprar Agora</a>
            </div>
          </div>
        </article>

        <!-- Card 1700 -->
        <article class="card" data-price-value="100" aria-labelledby="gc-1700-title">
          <div class="card-badges">
            <span class="badge badge-digital">Digital</span>
            <span class="badge badge-value">Melhor Valor</span>
          </div>
          <img class="card-img" src="assets/giftcards/robux-1700.png" alt="Gift Card de 1.700 Robux" loading="lazy" />
          <div class="card-body">
            <h3 id="gc-1700-title">1.700 Robux</h3>
            <p class="card-desc">Gift Card Digital</p>
            <div class="card-footer">
              <p class="price" data-price="100">R$ 100,00</p>
              <a href="#" class="btn btn-primary" aria-disabled="true">Comprar Agora</a>
            </div>
          </div>
        </article>

        <!-- Card 4500 -->
        <article class="card" data-price-value="200" aria-labelledby="gc-4500-title">
          <div class="card-badges">
            <span class="badge badge-digital">Digital</span>
          </div>
          <img class="card-img" src="assets/giftcards/robux-4500.png" alt="Gift Card de 4.500 Robux" loading="lazy" />
          <div class="card-body">
            <h3 id="gc-4500-title">4.500 Robux</h3>
            <p class="card-desc">Gift Card Digital</p>
            <div class="card-footer">
              <p class="price" data-price="200">R$ 200,00</p>
              <a href="#" class="btn btn-primary" aria-disabled="true">Comprar Agora</a>
            </div>
          </div>
        </article>
      </div>

      <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "ItemList",
        "itemListElement": [
          {"@type": "Product", "name": "Gift Card 400 Robux", "image": "assets/giftcards/robux-400.png", "offers": {"@type": "Offer", "price": "0.00", "priceCurrency": "BRL", "availability": "https://schema.org/PreOrder"}},
          {"@type": "Product", "name": "Gift Card 800 Robux", "image": "assets/giftcards/robux-800.png", "offers": {"@type": "Offer", "price": "0.00", "priceCurrency": "BRL", "availability": "https://schema.org/PreOrder"}},
          {"@type": "Product", "name": "Gift Card 1700 Robux", "image": "assets/giftcards/robux-1700.png", "offers": {"@type": "Offer", "price": "0.00", "priceCurrency": "BRL", "availability": "https://schema.org/PreOrder"}},
          {"@type": "Product", "name": "Gift Card 4500 Robux", "image": "assets/giftcards/robux-4500.png", "offers": {"@type": "Offer", "price": "0.00", "priceCurrency": "BRL", "availability": "https://schema.org/PreOrder"}}
        ]
      }
      </script>
    </section>

    <!-- Como Funciona -->
    <section id="como-funciona" class="container section" aria-labelledby="cf-title">
      <h2 id="cf-title">Como Funciona</h2>
      <div class="steps">
        <div class="step">
          <div class="step-icon" aria-hidden="true">①</div>
          <h3>Escolha o Gift Card</h3>
          <p class="muted">Selecione o valor desejado na grade acima.</p>
        </div>
        <div class="step">
          <div class="step-icon" aria-hidden="true">②</div>
          <h3>Pague (placeholder)</h3>
          <p class="muted">Nesta fase o pagamento ainda não está implementado.</p>
        </div>
        <div class="step">
          <div class="step-icon" aria-hidden="true">③</div>
          <h3>Receba por e‑mail</h3>
          <p class="muted">Você receberá o código digital (mock).</p>
        </div>
      </div>
    </section>

    <!-- FAQ -->
    <section id="faq" class="container section" aria-labelledby="faq-title">
      <h2 id="faq-title">FAQ</h2>

      <div class="faq">
        <div class="faq-item">
          <button class="faq-q" aria-expanded="false" aria-controls="faq1">Quando recebo meu código?</button>
          <div id="faq1" class="faq-a" hidden>Envio digital simulado após confirmação (projeto ainda sem pagamento).</div>
        </div>
        <div class="faq-item">
          <button class="faq-q" aria-expanded="false" aria-controls="faq2">O Gift Card funciona no Brasil?</button>
          <div id="faq2" class="faq-a" hidden>Sim, os cartões exibidos são placeholders pensados para a região BR.</div>
        </div>
        <div class="faq-item">
          <button class="faq-q" aria-expanded="false" aria-controls="faq3">Posso reembolsar?</button>
          <div id="faq3" class="faq-a" hidden>Sem política definida — apenas design. Defina regras quando implementar.</div>
        </div>
        <div class="faq-item">
          <button class="faq-q" aria-expanded="false" aria-controls="faq4">Isso é oficial da Roblox?</button>
          <div id="faq4" class="faq-a" hidden>Não. Veja o aviso legal abaixo.</div>
        </div>
      </div>
    </section>

    <!-- Aviso legal -->
    <section class="container section legal" aria-labelledby="legal-title">
      <h2 id="legal-title">Aviso legal</h2>
      <p>Este site <strong>não é afiliado, associado, autorizado, endossado</strong> nem de qualquer forma oficialmente conectado à Roblox Corporation. "Roblox" e marcas relacionadas são marcas registradas de seus respectivos proprietários.</p>
    </section>
  </main>

  <!-- Footer -->
  <footer class="site-footer" role="contentinfo">
    <div class="container footer-grid">
      <nav aria-label="Rodapé">
        <ul class="footer-links">
          <li><a href="#">Termos</a></li>
          <li><a href="#">Privacidade</a></li>
          <li><a href="#suporte">Suporte</a></li>
        </ul>
      </nav>
      <p class="muted">&copy; <span id="ano"></span> robux. Todos os direitos reservados.</p>
    </div>
  </footer>

  <script src="js/app.js" defer></script>
</body>
</html>
