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
- `pascal_tutorial.md` is the active source used by the root `Makefile` and GitHub Actions workflow. Pandoc converts it into the published HTML, text, PDF, and EPUB artifacts, and the HTML output depends on `pandoc.css`.
- `examples/` contains standalone Free Pascal programs that mirror tutorial sections and code listings. Each `.pas` file builds to an executable with the same basename through `examples/Makefile`.
- `pascal_tutorial.asciidoc` is a legacy parallel version of the tutorial content. The current build and CI do not consume it.

## Key conventions

- Keep tutorial prose, inline comments, and sample program output in Italian to match the existing content.
- When editing a featured example, update both the standalone file in `examples/` and the corresponding code block or explanation in `pascal_tutorial.md`. Many tutorial sections label snippets with the example filename, which is the link between the prose and the runnable sample.
- Treat `pascal_tutorial.md` as the canonical source unless the task explicitly requires syncing the legacy AsciiDoc copy.
- Add new runnable examples as separate `.pas` files in `examples/` named after the program target so they build without changing `examples/Makefile`.
