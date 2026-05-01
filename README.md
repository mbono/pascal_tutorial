# Pascal tutorial

This repository contains a Pascal tutorial that I originally wrote in Italian
in the late 1990s and early 2000s while I was in college. At the time I
created a few websites about Pascal programming, mainly because it was my
first programming language. Years later those websites were lost, and I
recovered some of the content using the [Wayback
Machine](https://web.archive.org/web/20070108032941/http://marianobono.altervista.org/pascal/index.html).
I then decided that I wanted to translate it into English and publish it.

Now, in the agentic AI era, I am taking advantage of these tools to finally
accomplish that goal.

Source files:

- `pascal_tutorial.md` - English tutorial
- `pascal_tutorial.it.md` - Italian tutorial (the original one)

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

## GitHub Pages

This is available on [Github Pages](https://mbono.github.io/pascal_tutorial)

## License

This repository is licensed under the **MIT License**. See [`LICENSE`](LICENSE).
