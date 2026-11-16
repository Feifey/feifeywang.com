/* feifeywang.com, shared behaviour for every page.
   Every feature checks that its elements exist, so one file serves all pages. */
(function () {
  var root = document.documentElement;
  var $ = function (s, c) { return (c || document).querySelector(s); };
  var $$ = function (s, c) { return Array.prototype.slice.call((c || document).querySelectorAll(s)); };
  var fine = window.matchMedia('(pointer:fine)').matches;
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---------- motion preference (the inline script in <head> already set the class) ---------- */
  var motion = !reduce;
  try { var saved = localStorage.getItem('fw-motion'); if (saved === 'on') motion = true; if (saved === 'off') motion = false; } catch (e) {}

  /* ---------- cursor label + pixel trail ---------- */
  var label = $('#cursor-label'), canvas = $('#trail'), ctx = canvas && canvas.getContext('2d');
  var particles = [], raf = 0, last = { x: -99, y: -99 }, dpr = 1;
  var colours = ['#1A1AB8', '#FFD23F', '#111118'];
  function sizeCanvas() { if (!canvas) return; dpr = Math.min(window.devicePixelRatio || 1, 2); canvas.width = innerWidth * dpr; canvas.height = innerHeight * dpr; }
  function clearTrail() { if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height); }
  function tick(now) {
    clearTrail(); ctx.save(); ctx.scale(dpr, dpr);
    particles = particles.filter(function (p) { return now - p.t < p.life; });
    particles.forEach(function (p) {
      var k = 1 - (now - p.t) / p.life, G = 8, s = k > .66 ? G : (k > .33 ? 6 : 4);
      ctx.globalAlpha = k > .4 ? 1 : .55; ctx.fillStyle = p.c;
      ctx.fillRect(Math.round(p.x / G) * G + (G - s) / 2, Math.round(p.y / G) * G + (G - s) / 2, s, s);
    });
    ctx.restore(); raf = particles.length ? requestAnimationFrame(tick) : 0; if (!raf) clearTrail();
  }
  sizeCanvas(); window.addEventListener('resize', sizeCanvas);

  /* ---------- home: name letters ---------- */
  var nameEl = $('#name');
  if (nameEl) $$('.line', nameEl).forEach(function (line) {
    line.dataset.text.split('').forEach(function (ch) {
      if (ch === ' ') { line.appendChild(document.createTextNode(' ')); return; }
      var s = document.createElement('span'); s.className = 'ltr'; s.textContent = ch;
      if (line.lastChild && line.lastChild.textContent === 'W') s.style.marginLeft = '-.07em';
      line.appendChild(s);
    });
  });

  /* ---------- home: fun facts typewriter ---------- */
  var facts = [
    'I shoot 35mm film on my days off.',
    'I run on boba and sweets.',
    'Taipei raised me, London trained me, New York keeps me busy.',
    'I started in graphic design, and I still check every pixel.',
    'I ask "why" a lot. Sorry in advance.',
    'Just follow the sound of my laugh, then you\'ll find me.'
  ];
  var fi = 0, typed = $('#fact-typed'), full = $('#fact-full'), paused = false, timer = null, pauseBtn = $('#fact-pause');
  function renderFact() {
    if (!typed) return;
    clearTimeout(timer); full.textContent = facts[fi];
    if (!motion || paused) { typed.textContent = facts[fi]; return; }
    typed.textContent = ''; typeChar(0);
  }
  function typeChar(n) {
    var t = facts[fi]; typed.textContent = t.slice(0, n);
    if (n < t.length) timer = setTimeout(function () { typeChar(n + 1); }, 42);
    else timer = setTimeout(function () { eraseChar(t.length); }, 2800);
  }
  function eraseChar(n) {
    typed.textContent = facts[fi].slice(0, n);
    if (n > 0) timer = setTimeout(function () { eraseChar(n - 1); }, 16);
    else { fi = (fi + 1) % facts.length; full.textContent = facts[fi]; timer = setTimeout(function () { typeChar(0); }, 300); }
  }
  if (typed) {
    pauseBtn.addEventListener('click', function () { paused = !paused; pauseBtn.setAttribute('aria-pressed', String(paused)); pauseBtn.textContent = paused ? 'Play typing' : 'Pause typing'; renderFact(); });
    $('#fact-next').addEventListener('click', function () { fi = (fi + 1) % facts.length; renderFact(); });
  }

  /* ---------- home: eyes follow the cursor ---------- */
  var face = $('#face'), pupils = face ? $$('.pupil', face) : [], eyes = face ? $$('.eye', face) : [];
  function look(pt) {
    pupils.forEach(function (p) {
      if (!pt) { p.removeAttribute('transform'); return; }
      var r = p.parentNode.getBoundingClientRect(); if (!r.width) return;
      var cx = r.left + r.width / 2, cy = r.top + r.height / 2, dx = pt.x - cx, dy = pt.y - cy, d = Math.hypot(dx, dy) || 1, k = Math.min(9.5, d / 14);
      p.setAttribute('transform', 'translate(' + (dx / d * k).toFixed(2) + ' ' + (dy / d * k).toFixed(2) + ')');
    });
  }
  if (face) {
    var blink = function () {
      if (motion && !document.hidden) { eyes.forEach(function (e) { e.classList.add('blink'); }); setTimeout(function () { eyes.forEach(function (e) { e.classList.remove('blink'); }); }, 130); }
      setTimeout(blink, 3200 + Math.random() * 3800);
    };
    setTimeout(blink, 2400);
    document.addEventListener('focusin', function (e) { if (!motion) return; var r = e.target.getBoundingClientRect && e.target.getBoundingClientRect(); if (r) look({ x: r.left + r.width / 2, y: r.top + r.height / 2 }); });
  }

  /* ---------- pointer: eyes, cursor label, trail ---------- */
  if (fine && canvas) {
    window.addEventListener('pointermove', function (e) {
      if (!motion) return;
      look({ x: e.clientX, y: e.clientY });
      label.style.transform = 'translate3d(' + (e.clientX + 16) + 'px,' + (e.clientY + 18) + 'px,0)';
      var cur = e.target.closest ? e.target.closest('[data-cursor]') : null;
      if (cur) { label.textContent = cur.dataset.cursor; label.classList.add('show'); } else label.classList.remove('show');
      if (Math.hypot(e.clientX - last.x, e.clientY - last.y) > 26) {
        last = { x: e.clientX, y: e.clientY };
        particles.push({ x: e.clientX + (Math.floor(Math.random() * 3) - 1) * 8, y: e.clientY + (Math.floor(Math.random() * 3) - 1) * 8, t: performance.now(), life: 560, c: colours[particles.length % 3] });
        if (particles.length > 40) particles.shift();
        if (!raf) raf = requestAnimationFrame(tick);
      }
    }, { passive: true });
    document.addEventListener('pointerleave', function () { label.classList.remove('show'); });
  }

  /* ---------- demo videos ---------- */
  function stopVideo(v) { v.pause(); var b = v.parentNode.querySelector('[data-play]'); if (b) { b.textContent = 'Play demo'; b.setAttribute('aria-pressed', 'false'); } }
  $$('[data-play]').forEach(function (b) {
    b.addEventListener('click', function () {
      var v = b.parentNode.querySelector('video');
      if (v.paused) { var pr = v.play(); if (pr && pr.catch) pr.catch(function () {}); b.textContent = 'Pause demo'; b.setAttribute('aria-pressed', 'true'); }
      else stopVideo(v);
    });
  });

  /* ---------- motion toggle ---------- */
  var motionBtn = $('#motion');
  function applyMotion() {
    root.classList.toggle('motion-on', motion); root.classList.toggle('motion-off', !motion);
    motionBtn.firstElementChild.textContent = 'Motion ' + (motion ? 'on' : 'off'); motionBtn.setAttribute('aria-pressed', String(motion));
    if (!motion) { particles.length = 0; clearTrail(); if (label) label.classList.remove('show'); look(null); $$('video').forEach(stopVideo); }
    renderFact();
  }
  motionBtn.addEventListener('click', function () { motion = !motion; try { localStorage.setItem('fw-motion', motion ? 'on' : 'off'); } catch (e) {} applyMotion(); });

  /* ---------- top bar border + back to top ---------- */
  var topbar = $('#topbar'), totop = $('#totop');
  function onScroll() {
    if (label) label.classList.remove('show');
    topbar.classList.toggle('scrolled', window.scrollY > 8);
    if (totop) totop.hidden = window.scrollY <= 500;
  }
  window.addEventListener('scroll', onScroll, { passive: true }); onScroll();
  if (totop) totop.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: motion ? 'smooth' : 'auto' });
    var h = $('main h1[tabindex]'); if (h) h.focus({ preventScroll: true });
  });

  /* ---------- Work dropdown ---------- */
  var ddBtn = $('#work-btn'), ddMenu = $('#work-menu'), ddBox = $('#work-dd');
  function closeDd(refocus) { if (ddMenu.hidden) return; ddMenu.hidden = true; ddBtn.setAttribute('aria-expanded', 'false'); if (refocus) ddBtn.focus(); }
  ddBtn.addEventListener('click', function () { var open = ddMenu.hidden; ddMenu.hidden = !open; ddBtn.setAttribute('aria-expanded', String(open)); });
  ddBox.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeDd(true); });
  ddBox.addEventListener('focusout', function (e) { if (e.relatedTarget && !ddBox.contains(e.relatedTarget)) closeDd(false); });
  document.addEventListener('click', function (e) { if (!ddBox.contains(e.target)) closeDd(false); });

  /* ---------- skip link ---------- */
  var main = $('#main');
  $('#skip').addEventListener('click', function (e) { e.preventDefault(); main.focus(); });

  /* ---------- image viewer (Creatives, Budgie logos, Taelor screens) ---------- */
  var lb = $('#lightbox');
  if (lb) {
    var pieces = [], lbi = 0, LB_PH = '[One or two lines on what this piece is about and why you made it.]';
    var showPiece = function (i) {
      lbi = (i + pieces.length) % pieces.length;
      var p = pieces[lbi], img = $('img', p), big = $('#lb-img');
      big.src = (motion && p.dataset.anim) || p.dataset.full || img.getAttribute('src');
      big.alt = img.alt; big.width = img.getAttribute('width'); big.height = img.getAttribute('height');
      $('#lb-title').textContent = p.dataset.title; $('#lb-kind').textContent = p.dataset.kind;
      $('#lb-desc').textContent = p.dataset.desc || LB_PH; $('#lb-count').textContent = (lbi + 1) + ' of ' + pieces.length;
    };
    var closeLb = function () { if (lb.close) lb.close(); else lb.removeAttribute('open'); };
    var wb = { t: $('#wb-title'), d: $('#wb-desc'), m: $('#wb-meta') }, wbText = wb.d ? wb.d.textContent : '';
    $$('[data-lb]').forEach(function (group) {
      var list = $$('.piece', group), wall = group.classList.contains('wall');
      list.forEach(function (p, i) {
        p.addEventListener('click', function () { pieces = list; showPiece(i); if (lb.showModal) lb.showModal(); else lb.setAttribute('open', ''); });
        if (!wall || !wb.t) return;
        var info = function () { wb.t.textContent = p.dataset.title; wb.d.textContent = p.dataset.kind; wb.m.textContent = (i + 1) + ' of ' + list.length; };
        var reset = function () { wb.t.textContent = 'Creatives'; wb.d.textContent = wbText; wb.m.textContent = ''; };
        p.addEventListener('mouseenter', info); p.addEventListener('focus', info); p.addEventListener('mouseleave', reset); p.addEventListener('blur', reset);
      });
    });
    $('#lb-close').addEventListener('click', closeLb);
    $('#lb-prev').addEventListener('click', function () { showPiece(lbi - 1); });
    $('#lb-next').addEventListener('click', function () { showPiece(lbi + 1); });
    lb.addEventListener('keydown', function (e) { if (e.key === 'ArrowLeft') showPiece(lbi - 1); else if (e.key === 'ArrowRight') showPiece(lbi + 1); });
  }

  /* ---------- copy email ---------- */
  var copy = $('#copy');
  if (copy) copy.addEventListener('click', function () {
    var addr = $('#addr'), out = $('#copied');
    function fallback() { var r = document.createRange(); r.selectNodeContents(addr); var s = getSelection(); s.removeAllRanges(); s.addRange(r); out.textContent = 'Selected. Press copy.'; }
    try { navigator.clipboard.writeText(addr.textContent).then(function () { out.textContent = 'Copied'; }, fallback); } catch (e) { fallback(); }
  });

  if ('IntersectionObserver' in window) {
    /* ---------- case study contents: highlight the current section ---------- */
    var toc = $('#toc');
    if (toc) {
      var io = new IntersectionObserver(function (es) {
        es.forEach(function (en) {
          if (!en.isIntersecting) return;
          $$('#toc a').forEach(function (a) {
            if (a.dataset.sec === en.target.id) { a.setAttribute('aria-current', 'true'); var l = a.parentNode; l.scrollTo({ left: a.offsetLeft - (l.clientWidth - a.offsetWidth) / 2, behavior: motion ? 'smooth' : 'auto' }); }
            else a.removeAttribute('aria-current');
          });
        });
      }, { rootMargin: '-35% 0px -60% 0px' });
      $$('.cs-sec').forEach(function (s) { io.observe(s); });
    }

    /* ---------- fade in on scroll (only with motion on; see style.css) ---------- */
    var rvo = new IntersectionObserver(function (es) { es.forEach(function (en) { if (en.isIntersecting) { en.target.classList.add('in'); rvo.unobserve(en.target); } }); }, { rootMargin: '0px 0px -8% 0px', threshold: .05 });
    $$('.page-head,.page>.wrap>.shot,.meta,.cs-head,.cs-body>*,.feature,.banner>.wrap,.tiles>li,.wall>li,.sec-head,.steps>li,.cv>li,.about-top>*,.sec.wrap>*,.next,.foot>.wrap>*').forEach(function (el) {
      if (el.closest('.rv') || el.matches('.tiles,.wall,.steps,.cv') || el.querySelector('.tiles>li,.wall>li,.feature,.steps>li,.cv>li')) return;
      el.classList.add('rv'); rvo.observe(el);
    });
  }

  applyMotion();
})();
