/* Inline tutorial examples use the public Pas2Wasm API and one engine per page. */
(() => {
  const strings = {
    en: {try: 'Try this example', source: 'Pascal source', run: 'Run', stop: 'Stop',
      reset: 'Reset', output: 'Output', batchInput: 'Input for the next run',
      batchHint: 'This browser needs all input before Run. Enter each readln response on a separate line.',
      addEscape: 'Add Escape key',
      loading: 'Loading compiler…', ready: 'Ready', compiling: 'Compiling…',
      stopped: 'Stopped', failed: 'Failed', completed: 'Completed',
      unsupported: 'Live input is unavailable in this browser. Enter all input below, then press Run again.'},
    it: {try: 'Prova questo esempio', source: 'Codice Pascal', run: 'Esegui', stop: 'Ferma',
      reset: 'Ripristina', output: 'Output', batchInput: 'Input per la prossima esecuzione',
      batchHint: 'Questo browser richiede tutto l’input prima di Esegui. Inserisci ogni risposta a readln su una riga separata.',
      addEscape: 'Aggiungi tasto Esc',
      loading: 'Caricamento compilatore…', ready: 'Pronto', compiling: 'Compilazione…',
      stopped: 'Fermato', failed: 'Errore', completed: 'Completato',
      unsupported: 'Input interattivo non disponibile in questo browser. Inserisci tutto l’input qui sotto e premi di nuovo Esegui.'}
  };
  const t = strings[document.documentElement.lang === 'it' ? 'it' : 'en'];
  let enginePromise, active, generation = 0, jspiSupport = null;

  function diagnostic(value) {
    const place = value.line ? `${value.line}:${value.column || 1}: ` : '';
    return `${place}${value.code || value.name || 'Error'}: ${value.message}`;
  }
  function getEngine() {
    if (!enginePromise) enginePromise = Pas2WasmEngine.create({assetBaseUrl: '../pas2wasm/'});
    return enginePromise;
  }
  function stopActive() {
    if (!active) return;
    active.cleanup?.();
    active.abort?.abort();
    active.session?.stop();
    active = null;
    generation++;
  }

  document.querySelectorAll('[data-example]').forEach((code, index) => {
    const original = code.closest('pre') || code;
    const source = code.textContent.replace(/\n?$/, '\n');
    const id = `example-${index}`;
    const details = document.createElement('details');
    details.className = 'tutorial-example';
    details.innerHTML = `<summary>${t.try}</summary>
      <div class="example-workspace">
        <label for="${id}-source">${t.source}</label>
        <textarea id="${id}-source" class="example-source" spellcheck="false" autocapitalize="off"></textarea>
        <div class="example-controls">
          <button type="button" class="example-run">${t.run}</button>
          <button type="button" class="example-stop" disabled>${t.stop}</button>
          <button type="button" class="example-reset">${t.reset}</button>
        </div>
        <p class="example-status" role="status" aria-live="polite">${t.ready}</p>
        <div class="example-console" aria-label="${t.output}"></div>
        <div class="example-batch" hidden>
          <label for="${id}-input">${t.batchInput}</label>
          <p class="example-batch-hint">${t.batchHint}</p>
          <textarea id="${id}-input" class="example-input" rows="4"></textarea>
          <button type="button" class="example-escape">${t.addEscape}</button>
        </div>
        <pre class="example-diagnostic" aria-live="polite"></pre>
      </div>`;
    original.after(details);
    const $ = selector => details.querySelector(selector);
    const editor = $('.example-source');
    const run = $('.example-run'), stop = $('.example-stop');
    const status = $('.example-status');
    const error = $('.example-diagnostic');
    const batch = $('.example-batch'), input = $('.example-input');
    const terminal = Pas2WasmConsole.create($('.example-console'), {autoFocus: false});
    editor.value = source;
    editor.rows = Math.min(18, Math.max(8, source.split('\n').length));
    function busy(value) { run.disabled = value; stop.disabled = !value; }
    function showBatch() { batch.hidden = jspiSupport !== false; }
    details.addEventListener('toggle', () => {
      if (details.open) { original.hidden = true; showBatch(); run.click(); }
      else { original.hidden = false; if (active?.details === details) stopActive(); busy(false); }
    });
    $('.example-escape').addEventListener('click', () => {
      input.setRangeText('\x1b', input.selectionStart, input.selectionEnd, 'end');
      input.focus();
    });
    stop.addEventListener('click', () => { if (active?.details === details) stopActive(); busy(false); status.textContent = t.stopped; });
    $('.example-reset').addEventListener('click', () => {
      if (active?.details === details) stopActive();
      editor.value = source; input.value = ''; error.textContent = '';
      terminal.clear(); busy(false); status.textContent = t.ready;
    });
    run.addEventListener('click', async () => {
      stopActive();
      const token = ++generation;
      const abort = new AbortController();
      active = {details, abort, session: null, cleanup() { busy(false); status.textContent = t.stopped; }};
      busy(true); status.textContent = t.loading; error.textContent = '';
      terminal.clear();
      try {
        const engine = await getEngine();
        if (token !== generation) return;
        status.textContent = t.compiling;
        const compiled = await engine.compile(editor.value, {signal: abort.signal});
        if (token !== generation) return;
        if (compiled.diagnostic) { error.textContent = diagnostic(compiled.diagnostic); status.textContent = t.failed; return; }
        let mode = jspiSupport === false ? 'batch' : 'interactive';
        for (;;) {
          const handlers = terminal.createHandlers();
          const session = engine.run(compiled.binary, {
            mode, input: mode === 'batch' ? input.value : '',
            onOutput: handlers.onOutput,
            onInputRequest: handlers.onInputRequest,
            onStateChange(state) { handlers.onStateChange(state); status.textContent = state; },
            onCapabilities({jspi}) { jspiSupport = jspi; showBatch(); }
          });
          active.session = session;
          const outcome = await session.done;
          if (token !== generation) return;
          if (mode === 'interactive' && jspiSupport === false &&
              outcome.status === 'failed' && outcome.diagnostic?.code === 'E_JSPI') {
            mode = 'batch';
            terminal.clear();
            continue;
          }
          status.textContent = t[outcome.status] || outcome.status;
          if (outcome.diagnostic) error.textContent = `${jspiSupport === false && mode === 'batch' ? t.unsupported + '\n' : ''}${diagnostic(outcome.diagnostic)}`;
          break;
        }
      } catch (e) {
        if (token !== generation) return;
        if (e.name !== 'AbortError') { error.textContent = diagnostic(e); status.textContent = t.failed; }
      } finally {
        if (token === generation) { active = null; busy(false); }
      }
    });
  });
  window.addEventListener('pagehide', event => {
    if (!event.persisted) { stopActive(); enginePromise?.then(engine => engine.dispose()); }
  });
})();
