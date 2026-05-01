# Pascal tutorial

This repository contains a bilingual Pascal tutorial in Markdown plus the associated Pascal examples. The English tutorial is the main version, while the Italian tutorial is maintained alongside it.

Source files:

- `pascal_tutorial.md` - English main tutorial
- `pascal_tutorial.it.md` - Italian tutorial

## Local build

To generate every artifact for both languages:

```sh
make all
```

To generate only the GitHub Pages site:

```sh
make pages
```

The `pages` target creates `_site/` with:

- `index.html`
- `pascal_tutorial.txt`
- `pascal_tutorial.pdf`
- `pascal_tutorial.epub`
- `it/index.html`
- `it/pascal_tutorial.it.txt`
- `it/pascal_tutorial.it.pdf`
- `it/pascal_tutorial.it.epub`
- `pandoc.css`

If you do not have `pandoc` and the PDF toolchain installed locally, use the repository container:

```sh
make docker-build
```

For Pages packaging only:

```sh
make docker-pages
```

## GitHub Pages publishing

Publishing is handled by `.github/workflows/pages.yml`.

1. In **Settings > Pages**, set **Build and deployment** to **GitHub Actions**.
2. Push to `main`, or run the workflow manually.
3. The site will be published at:

```text
https://<owner>.github.io/pascal_tutorial/
```

The English homepage is published as `index.html`; the Italian homepage is published under `it/index.html`. TXT, PDF, and EPUB downloads are available for both languages.

## License

This repository is licensed under the **MIT License**. See [`LICENSE`](LICENSE).
