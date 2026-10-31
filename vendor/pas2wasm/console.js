/*
 * Copyright (c) 2026 Mariano Bono
 * SPDX-License-Identifier: MIT
 */

/* Read-only output and one native editing root share a scrolling pre. Output BS
 * moves a scalar cursor; raw program/file bytes and input editing stay independent. */
function createPas2WasmTerminal(view, history, editor, submit, autoFocus = true) {
    const listeners = new AbortController();
    /* Every listener belongs to this renderer and is removed together on disposal. */
    function listen(node, type, handler) {
        node.addEventListener(type, handler, {signal:listeners.signal});
    }
    // Two output fragments straddle the logical cursor. Only the current line may
    // occupy the suffix; LF commits it. Both fragments remain read-only text.
    const committed = document.createTextNode(''), suffix = document.createTextNode('');
    history.replaceChildren(committed, suffix);
    let active = false, composing = false, compositionEnter = false;
    let inputKind = 'line', prefilled = false, compositionCommit = null;
    /* A selection is editable only when both endpoints belong to the tail. */
    function inside(selection) {
        return selection && selection.rangeCount && editor.contains(selection.anchorNode) &&
            editor.contains(selection.focusNode);
    }
    /* Focus without moving a valid editing selection or scrolling the whole page. */
    function focus() {
        if (!active) return;
        editor.focus({preventScroll:true});
        const selection = window.getSelection();
        if (!inside(selection)) selection.collapse(editor, editor.childNodes.length);
    }
    /* Return a safe insertion range, never a range spanning transcript history. */
    function range() {
        focus();
        return window.getSelection().getRangeAt(0);
    }
    /* Change only the affected text range, retaining earlier history selections. */
    function patch(node, text) {
        const old = node.data;
        if (old === text) return;
        let start = 0, end = 0;
        while (start < old.length && start < text.length && old[start] === text[start]) start++;
        while (end < old.length - start && end < text.length - start &&
               old[old.length - end - 1] === text[text.length - end - 1]) end++;
        node.replaceData(start, old.length - start - end, text.slice(start, text.length - end));
    }
    /* Keep the native caret between output fragments only when behind line end.
     * Reparenting must retain draft nodes, native selection and keyboard focus. */
    function placeEditor() {
        const parent = active && suffix.length ? history : view;
        if (editor.parentNode === parent) return;
        const selected = window.getSelection(), editing = inside(selected);
        const saved = editing ? [selected.anchorNode, selected.anchorOffset,
                                 selected.focusNode, selected.focusOffset] : null;
        const focused = document.activeElement === editor;
        if (parent === history) history.insertBefore(editor, suffix);
        else history.after(editor);
        if (focused) editor.focus({preventScroll:true});
        if (saved && focused) selected.setBaseAndExtent(...saved);
    }
    /* Retain copy selections when moving unchanged output between fragments. */
    function outputSelection() {
        const selected = window.getSelection();
        if (!selected?.rangeCount || inside(selected)) return null;
        function position(node, offset) {
            if (node === committed) return offset;
            if (node === suffix) return committed.length + offset;
            if (node !== history) return null;
            let size = 0;
            for (let i = 0; i < offset; i++) {
                const child = history.childNodes[i];
                if (child === committed || child === suffix) size += child.length;
            }
            return size;
        }
        const anchor = position(selected.anchorNode, selected.anchorOffset);
        const focus = position(selected.focusNode, selected.focusOffset);
        return anchor === null || focus === null ? null : [anchor, focus];
    }
    /* Apply cursor controls in memory once per chunk, rather than rewriting the DOM
     * for every scalar. Ordinary append-only output retains its single-append path. */
    function display(text, backspace) {
        if (!suffix.length && (!backspace || !text.includes('\b'))) {
            committed.appendData(text); return;
        }
        const old = committed.data + suffix.data, start = old.lastIndexOf('\n') + 1;
        let line = Array.from(old.slice(start));
        let cursor = Array.from(committed.data.slice(start)).length;
        const completed = [];
        for (const scalar of text) {
            if (backspace && scalar === '\b') cursor = Math.max(0, cursor - 1);
            else if (scalar === '\n') {
                completed.push(line.join(''), '\n'); line = []; cursor = 0;
            } else line[cursor++] = scalar;
        }
        patch(committed, old.slice(0, start) + completed.join('') + line.slice(0, cursor).join(''));
        patch(suffix, line.slice(cursor).join(''));
    }
    /* Program output interprets BS; submitted-line echo stays literal. Both use the
     * same overwrite position and preserve a draft/copy selection while scrolling. */
    function append(text, force = false, backspace = true) {
        const follow = view.scrollHeight - view.clientHeight - view.scrollTop <= 4;
        const saved = outputSelection();
        display(text, backspace); placeEditor();
        if (saved) {
            const point = offset => offset <= committed.length ? [committed, offset] :
                [suffix, Math.min(offset - committed.length, suffix.length)];
            window.getSelection().setBaseAndExtent(...point(saved[0]), ...point(saved[1]));
        }
        if (follow || force) view.scrollTop = view.scrollHeight;
    }
    /* Toggle only the editing root; a disabled tail has no active caret/tab stop. */
    function waiting(value, kind = 'line', prefix) {
        if (!value && inputKind === 'key') editor.replaceChildren();
        if (value) {
            inputKind = kind;
            prefilled = kind === 'line' && typeof prefix === 'string' && prefix.length > 0;
            if (prefilled) editor.textContent = prefix;
        }
        // A new worker request can arrive before an IME's final Enter event.
        // Keep that guard until keyup/new keydown, including across suspension.
        active = value; composing = false;
        placeEditor();
        editor.contentEditable = value ? 'plaintext-only' : 'false';
        editor.setAttribute('aria-disabled', String(!value));
        editor.setAttribute('aria-label',inputKind === 'key' ? 'Console key input' : 'Console input line');
        editor.tabIndex = value ? 0 : -1;
        view.tabIndex = value ? -1 : 0;
        if (value) {
            if (autoFocus) focus();
            if (prefilled && document.activeElement === editor)
                window.getSelection().collapse(editor,editor.childNodes.length);
            view.scrollTop = view.scrollHeight;
        }
        else if (document.activeElement === editor) editor.blur();
    }
    /* Raw chunks never enter transcript history. The runtime owns typeahead and
     * returns buffered keys before it sends another human-input request. */
    function keys(text) {
        if (!active || composing || !text) return;
        editor.replaceChildren();
        submit(text);
    }
    /* Freeze once after the session accepts the line; output arrives in later tasks. */
    function enter() {
        if (!active || composing) return;
        const text = editor.textContent;
        if (submit(text)) { append(text + '\n', true, false); editor.replaceChildren(); }
    }
    /* Detect an editing boundary without splitting Unicode characters inside it. */
    function edge(end) {
        const selection = window.getSelection();
        if (!inside(selection) || !selection.isCollapsed) return false;
        const before = document.createRange();
        before.selectNodeContents(editor);
        before.setEnd(selection.anchorNode, selection.anchorOffset);
        return before.toString().length === (end ? editor.textContent.length : 0);
    }
    /* Native empty editors may retain a BR placeholder; it must not move the
     * next input onto a line that the program did not print. */
    function normalizeEmpty() {
        if (!active || composing || editor.textContent !== '' || !editor.childNodes.length) return;
        editor.replaceChildren();
        if (document.activeElement === editor) window.getSelection().collapse(editor, 0);
    }
    listen(editor, 'keydown', event => {
        if (!active) return;
        if (composing || event.isComposing || event.keyCode === 229) {
            if (event.key === 'Enter' || event.keyCode === 229) compositionEnter = true;
            return;
        }
        compositionEnter = false; compositionCommit = null;
        if (inputKind === 'key') {
            const controls = {Enter:'\r',Escape:'\u001b',Backspace:'\b',Tab:'\t',Delete:'\u007f'};
            if (event.key === 'Tab' && event.shiftKey) return; // Keep a way to leave the console by keyboard.
            if (controls[event.key]) {
                event.preventDefault();
                if (!event.ctrlKey && !event.metaKey && !event.altKey) keys(controls[event.key]);
            } else if (['Home','End','ArrowLeft','ArrowRight','ArrowUp','ArrowDown'].includes(event.key)) {
                event.preventDefault();
            }
            return;
        }
        if (event.key === 'Enter') { event.preventDefault(); enter(); }
        else if (event.key === 'Home' || event.key === 'End') {
            event.preventDefault(); focus();
            const selection = window.getSelection(), offset = event.key === 'Home' ? 0 : editor.childNodes.length;
            if (event.shiftKey) selection.extend(editor, offset);
            else selection.collapse(editor, offset);
        } else if ((event.ctrlKey || event.metaKey) && event.key.toLowerCase() === 'a') {
            event.preventDefault();
            const selected = document.createRange(); selected.selectNodeContents(editor);
            const selection = window.getSelection(); selection.removeAllRanges(); selection.addRange(selected);
        } else if (((event.key === 'Backspace' || event.key === 'ArrowLeft') && edge(false)) ||
                   ((event.key === 'Delete' || event.key === 'ArrowRight') && edge(true))) event.preventDefault();
    });
    listen(editor, 'beforeinput', event => {
        // Some engines deliver the final committed insertion after compositionend.
        if (compositionCommit !== null && !event.isComposing && event.data === compositionCommit &&
            ['insertText','insertFromComposition'].includes(event.inputType)) {
            event.preventDefault(); compositionCommit = null; return;
        }
        if (!active) { event.preventDefault(); return; }
        if (inputKind === 'key') {
            if (composing || event.isComposing) return; // Native preedit owns its preview.
            event.preventDefault();
            if (event.inputType === 'insertParagraph' || event.inputType === 'insertLineBreak') {
                if (!compositionEnter) keys('\r');
            } else if (typeof event.data === 'string' && event.data.length) keys(event.data);
            return;
        }
        if (event.inputType === 'insertParagraph' || event.inputType === 'insertLineBreak') {
            event.preventDefault();
            if (!composing && !event.isComposing && !compositionEnter) enter();
        } else if (!inside(window.getSelection())) {
            event.preventDefault(); focus();
        }
    });
    listen(editor, 'compositionstart', () => {
        composing = true; compositionEnter = false; compositionCommit = null;
    });
    listen(editor, 'compositionend', event => {
        composing = false;
        if (inputKind === 'key') {
            const text = typeof event.data === 'string' ? event.data : editor.textContent;
            compositionCommit = text || null;
            editor.replaceChildren();
            keys(text);
        } else normalizeEmpty();
    });
    /* Some IMEs end composition before delivering the same Enter's beforeinput. */
    listen(editor, 'keyup', event => {
        if (event.key === 'Enter' || event.keyCode === 229) compositionEnter = false;
    });
    listen(editor, 'input', normalizeEmpty);
    listen(editor, 'paste', event => {
        event.preventDefault();
        if (!active) return;
        compositionCommit = null;
        const plain = event.clipboardData.getData('text/plain');
        if (inputKind === 'key') {keys(plain.replace(/\r\n|\n/g,'\r'));return;}
        const text = plain.replace(/\r\n|[\r\n]/g, ' ');
        const selected = range(), node = document.createTextNode(text);
        selected.deleteContents(); selected.insertNode(node); selected.setStartAfter(node); selected.collapse(true);
        const selection = window.getSelection(); selection.removeAllRanges(); selection.addRange(selected);
        normalizeEmpty();
    });
    listen(editor, 'cut', event => {
        if (!inside(window.getSelection())) event.preventDefault();
    });
    listen(view, 'click', event => {
        const selection = window.getSelection();
        if (!editor.contains(event.target) && selection.isCollapsed) focus();
    });
    listen(view, 'focus', () => { if (active) focus(); });
    waiting(false);
    return {
        append, waiting, focus,
        /* Erase only output; editor nodes, selection and provider state survive. */
        clearOutput() {
            committed.data = suffix.data = ''; placeEditor(); view.scrollTop = 0;
        },
        /* Releasing a renderer never submits input or controls its program. */
        dispose() { waiting(false); listeners.abort(); },
        clear() {
            committed.data = suffix.data = ''; editor.replaceChildren();
            compositionEnter = false; compositionCommit = null; prefilled = false;
            waiting(false); view.scrollTop = 0;
        }
    };
}
/*
 * Copyright (c) 2026 Mariano Bono
 * SPDX-License-Identifier: MIT
 */

/* Mount a terminal without owning an engine or execution session.
 * Kept self-contained except for the renderer so offline exports embed this factory. */
function createPas2WasmConsoleWidget(container, {autoFocus = true} = {}) {
    if (!container || container.nodeType !== 1 || container.ownerDocument !== document)
        throw new TypeError('Expected a container element in this document.');
    if (typeof autoFocus !== 'boolean') throw new TypeError('autoFocus must be Boolean.');
    const root = document.createElement('div'); root.className = 'p2w-console';
    const style = document.createElement('style');
    style.textContent = `
.p2w-console .p2w-console-terminal{display:block;white-space:pre-wrap;overflow-wrap:anywhere;overflow:auto;
 box-sizing:border-box;min-height:var(--p2w-console-min-height,160px);max-height:var(--p2w-console-max-height,360px);
 padding:15px;margin:0;border:0;border-radius:6px;background:var(--p2w-console-background,#18362f);
 color:var(--p2w-console-color,#f4f2e8);font:var(--p2w-console-font,.9rem/1.65 ui-monospace,monospace);cursor:text}
.p2w-console .p2w-console-terminal:focus-visible{outline:3px solid #d28542;outline-offset:3px}
.p2w-console .p2w-console-input{display:inline;white-space:pre-wrap;font:inherit;color:inherit;
 background:transparent;border:0;padding:0;margin:0;outline:none;caret-color:var(--p2w-console-caret-color,#ffd58a)}
.p2w-console .p2w-console-input[contenteditable="plaintext-only"]:empty{display:inline-block;min-width:1px}
.p2w-console .p2w-console-input[contenteditable="plaintext-only"]:empty::before{content:"\\200b"}
.p2w-console .p2w-console-input[contenteditable="false"]{caret-color:transparent}
`;
    const view = document.createElement('pre'); view.className = 'p2w-console-terminal';
    view.setAttribute('aria-label', 'Program console');
    const history = document.createElement('span'); history.className = 'p2w-console-output';
    history.setAttribute('role', 'log'); history.setAttribute('aria-live', 'polite');
    const editor = document.createElement('span'); editor.className = 'p2w-console-input';
    editor.setAttribute('role', 'textbox'); editor.setAttribute('aria-multiline', 'false');
    editor.spellcheck = false; editor.setAttribute('autocapitalize', 'off');
    view.append(history, editor); root.append(style, view);
    container.appendChild(root);
    let disposed = false, generation = 0, pending = null;
    const terminal = createPas2WasmTerminal(view, history, editor, submit, autoFocus);
    /* A pending request is borrowed from one connection; always use its bound
     * submit rather than whichever request an application session currently has. */
    function submit(value) {
        if (!pending || disposed) return false;
        const request = pending, at = generation;
        const accepted = request.submit(value);
        if (accepted && at === generation && !disposed) {
            pending = null;
            terminal.waiting(false, request.kind);
        }
        return accepted;
    }
    /* Public operations fail consistently after disposal; stale event callbacks
     * instead become inert so removing a widget never crashes an application run. */
    function assertLive() {
        if (disposed) throw new DOMException('Console has been disposed.', 'InvalidStateError');
    }
    /* Each run gets its own callbacks. Replacing/ending connections invalidates
     * late output/input and retains no request-ID collection across long runs. */
    function createHandlers() {
        assertLive();
        const at = ++generation;
        let lastRequest = 0;
        pending = null; terminal.clear();
        return Object.freeze({
            onOutput(text) { if (!disposed && at === generation) terminal.append(text); },
            onInputRequest(request) {
                if (disposed || at !== generation || request.requestId <= lastRequest) return;
                if (!Number.isSafeInteger(request.requestId) || request.requestId < 1 || typeof request.submit !== 'function')
                    throw new TypeError('Expected an engine input request with a bound submit function.');
                lastRequest = request.requestId; pending = request;
                terminal.waiting(true, request.kind || 'line', request.prefix);
            },
            onStateChange(state) {
                if (disposed || at !== generation) return;
                if (state === 'running') {
                    pending = null; terminal.waiting(false);
                } else if (['completed', 'failed', 'stopped'].includes(state)) {
                    generation++; pending = null;
                    editor.replaceChildren(); terminal.waiting(false);
                }
            }
        });
    }
    return Object.freeze({createHandlers,
        clear() { assertLive(); terminal.clearOutput(); },
        focus() { assertLive(); terminal.focus(); },
        dispose() {
            if (disposed) return;
            disposed = true; generation++; pending = null;
            terminal.dispose(); root.remove();
        }
    });
}

/* Classic-script public name, separate from the compiler and headless engine. */
var Pas2WasmConsole = Object.freeze({create:createPas2WasmConsoleWidget});
