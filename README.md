# Tutorial sul Pascal

Questo repository contiene il sorgente del tutorial in Markdown (`pascal_tutorial.md`) e gli esempi Pascal associati. Il build produce artefatti statici adatti sia al download sia alla pubblicazione su GitHub Pages.

## Build locale

Per generare tutti gli artefatti:

```sh
make all
```

Per generare solo il sito destinato a GitHub Pages:

```sh
make pages
```

Il target `pages` crea la cartella `_site/` con:

- `index.html`
- `pascal_tutorial.txt`
- `pascal_tutorial.pdf`
- `pascal_tutorial.epub`
- `pandoc.css`

Se non hai `pandoc` e il supporto PDF installati in locale, puoi usare il container del repository:

```sh
make docker-build
```

Per il solo packaging Pages dal container:

```sh
make docker-pages
```

## Pubblicazione su GitHub Pages

La pubblicazione e' gestita dal workflow `.github/workflows/pages.yml`.

1. In **Settings > Pages**, imposta **Build and deployment** su **GitHub Actions**.
2. Esegui un push su `main` oppure lancia manualmente il workflow.
3. Il sito verra' pubblicato all'URL:

```text
https://<owner>.github.io/pascal_tutorial/
```

La homepage pubblicata e' `index.html`; i formati TXT, PDF ed EPUB restano disponibili come file statici scaricabili.
