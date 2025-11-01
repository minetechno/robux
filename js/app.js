// Robux — app.js
// - Acordeão acessível para FAQ
// - Scroll suave para âncoras
// - Micro "ripple" em botões (opcional), respeitando prefers-reduced-motion

(function(){
  const prefersReduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  // Ano no rodapé
  const elAno = document.getElementById('ano');
  if(elAno){ elAno.textContent = new Date().getFullYear(); }

  // Scroll suave para âncoras internas
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener('click', (e) => {
      const targetId = a.getAttribute('href').slice(1);
      if(!targetId) return;
      const el = document.getElementById(targetId);
      if(el){
        e.preventDefault();
        el.scrollIntoView({ behavior: prefersReduced ? 'auto' : 'smooth', block: 'start' });
      }
    });
  });

  // Acordeão FAQ
  document.querySelectorAll('.faq-q').forEach(btn => {
    btn.addEventListener('click', () => {
      const expanded = btn.getAttribute('aria-expanded') === 'true';
      const panelId = btn.getAttribute('aria-controls');
      const panel = document.getElementById(panelId);
      btn.setAttribute('aria-expanded', String(!expanded));
      if(panel){ panel.hidden = expanded; }
    });
  });

  // Ripple nos botões
  document.querySelectorAll('.btn').forEach(btn => {
    btn.addEventListener('click', (ev) => {
      if(prefersReduced) return;
      const circle = document.createElement('span');
      const rect = btn.getBoundingClientRect();
      const size = Math.max(rect.width, rect.height);
      const x = ev.clientX - rect.left - size/2;
      const y = ev.clientY - rect.top - size/2;
      circle.style.position = 'absolute';
      circle.style.width = circle.style.height = size + 'px';
      circle.style.left = x + 'px';
      circle.style.top = y + 'px';
      circle.style.borderRadius = '50%';
      circle.style.background = 'rgba(255,255,255,.15)';
      circle.style.pointerEvents = 'none';
      circle.style.transform = 'scale(0)';
      circle.style.opacity = '1';
      circle.style.transition = 'transform 400ms ease, opacity 500ms ease';
      btn.appendChild(circle);
      requestAnimationFrame(() => { circle.style.transform = 'scale(2)'; circle.style.opacity = '0'; });
      setTimeout(() => circle.remove(), 600);
    });
  });
})();
