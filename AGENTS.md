# Repository instructions for `pascal_tutorial`

## Build and verification commands

- Root tutorial build:
  - `make all` builds `pascal_tutorial.html`, `pascal_tutorial.txt`, `pascal_tutorial.pdf`, and `pascal_tutorial.epub`
  - `make html`
  - `make txt`
  - `make pdf`
  - `make epub`
  - `make clean`
- Example program build:
  - `make -C examples` compiles every `examples/*.pas` file with `fpc -O2`
  - `make -C examples hello` compiles a single example target
  - `cd examples && ./hello` runs the compiled example
- There is no dedicated lint target or automated test suite. Current CI validation is `make all` from the repository root.

## High-level architecture

- This repository is documentation-first, not an application or library. The main deliverable is the tutorial itself.
- `pascal_tutorial.md` is the English main source used by the root `Makefile` and GitHub Actions workflow. `pascal_tutorial.it.md` is the maintained Italian version. Pandoc converts both into published HTML, text, PDF, and EPUB artifacts, and the HTML outputs depend on `pandoc.css`.
- `examples/` contains standalone Free Pascal programs that mirror tutorial sections and code listings. Each `.pas` file builds to an executable with the same basename through `examples/Makefile`.
- `pascal_tutorial.asciidoc` is a legacy parallel version of the tutorial content. The current build and CI do not consume it.

## Key conventions

- Keep the English tutorial and repository-facing documentation in English; maintain the Italian tutorial as a parallel translation in `pascal_tutorial.it.md`.
- When editing a featured example, update both the standalone file in `examples/` and the corresponding code block or explanation in the affected tutorial language file (`pascal_tutorial.md` and/or `pascal_tutorial.it.md`). Many tutorial sections label snippets with the example filename, which is the link between the prose and the runnable sample.
- When changing tutorial content, keep `pascal_tutorial.md` and `pascal_tutorial.it.md` aligned unless the task explicitly scopes the change to one language only.
- Treat `pascal_tutorial.md` as the English primary source unless the task explicitly requires syncing the legacy AsciiDoc copy.
- Add new runnable examples as separate `.pas` files in `examples/` named after the program target so they build without changing `examples/Makefile`.
