(() => {
  const toggle = document.getElementById('toc-toggle');
  const toc = document.getElementById('TOC');
  if (!toggle || !toc) return;
  document.documentElement.classList.add('js');
  const close = () => {
    toc.classList.remove('is-open');
    toggle.setAttribute('aria-expanded', 'false');
  };
  toggle.addEventListener('click', () => {
    const open = toc.classList.toggle('is-open');
    toggle.setAttribute('aria-expanded', String(open));
  });
  toc.addEventListener('click', event => { if (event.target.closest('a')) close(); });
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && toc.classList.contains('is-open')) {
      close(); toggle.focus();
    }
  });
  matchMedia('(min-width: 901px)').addEventListener('change', close);
})();
