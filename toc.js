// Scroll-spy for case study table of contents
(function () {
  const tocItems = document.querySelectorAll('.cs-toc-item');
  if (!tocItems.length) return;

  const sections = [];
  tocItems.forEach(item => {
    const link = item.querySelector('a');
    const id = link.getAttribute('href').replace('#', '');
    const el = document.getElementById(id);
    if (el) sections.push({ id, el, item });
  });

  function updateActive() {
    const scrollY = window.scrollY + 160;

    let current = sections[0];
    for (const section of sections) {
      if (section.el.offsetTop <= scrollY) {
        current = section;
      }
    }

    tocItems.forEach(item => item.classList.remove('active'));
    if (current) current.item.classList.add('active');
  }

  // Smooth scroll on click
  tocItems.forEach(item => {
    const link = item.querySelector('a');
    link.addEventListener('click', function (e) {
      e.preventDefault();
      const id = this.getAttribute('href').replace('#', '');
      const target = document.getElementById(id);
      if (target) {
        window.scrollTo({
          top: target.offsetTop - 100,
          behavior: 'smooth'
        });
      }
    });
  });

  window.addEventListener('scroll', updateActive, { passive: true });
  updateActive();
})();
