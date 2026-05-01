HTML_OUTPUT := pascal_tutorial.html
TEXT_OUTPUT := pascal_tutorial.txt
PDF_OUTPUT := pascal_tutorial.pdf
EPUB_OUTPUT := pascal_tutorial.epub
PAGES_DIR := _site

all: html txt pdf epub

html: $(HTML_OUTPUT)

txt: $(TEXT_OUTPUT)

pdf: $(PDF_OUTPUT)

# Optional Docker-based build for all tutorial artifacts.
docker-build:
	LOCAL_UID=$$(id -u) LOCAL_GID=$$(id -g) docker compose run --rm tutorial-build

docker-pages:
	LOCAL_UID=$$(id -u) LOCAL_GID=$$(id -g) docker compose run --rm tutorial-build pages

epub: $(EPUB_OUTPUT)

pages: $(PAGES_DIR)/index.html $(PAGES_DIR)/$(TEXT_OUTPUT) $(PAGES_DIR)/$(PDF_OUTPUT) $(PAGES_DIR)/$(EPUB_OUTPUT) $(PAGES_DIR)/pandoc.css

$(PDF_OUTPUT): pascal_tutorial.md
	pandoc -o $(PDF_OUTPUT) pascal_tutorial.md

$(TEXT_OUTPUT): pascal_tutorial.md
	pandoc -t plain -o $(TEXT_OUTPUT) pascal_tutorial.md

$(HTML_OUTPUT): pascal_tutorial.md pandoc.css
	pandoc --standalone --number-section --toc --from markdown --to html5 -o $(HTML_OUTPUT) --css pandoc.css pascal_tutorial.md

$(EPUB_OUTPUT): pascal_tutorial.md
	pandoc -o $(EPUB_OUTPUT) pascal_tutorial.md

$(PAGES_DIR):
	mkdir -p $(PAGES_DIR)

$(PAGES_DIR)/index.html: $(HTML_OUTPUT) | $(PAGES_DIR)
	cp $(HTML_OUTPUT) $(PAGES_DIR)/index.html

$(PAGES_DIR)/$(TEXT_OUTPUT): $(TEXT_OUTPUT) | $(PAGES_DIR)
	cp $(TEXT_OUTPUT) $(PAGES_DIR)/$(TEXT_OUTPUT)

$(PAGES_DIR)/$(PDF_OUTPUT): $(PDF_OUTPUT) | $(PAGES_DIR)
	cp $(PDF_OUTPUT) $(PAGES_DIR)/$(PDF_OUTPUT)

$(PAGES_DIR)/$(EPUB_OUTPUT): $(EPUB_OUTPUT) | $(PAGES_DIR)
	cp $(EPUB_OUTPUT) $(PAGES_DIR)/$(EPUB_OUTPUT)

$(PAGES_DIR)/pandoc.css: pandoc.css | $(PAGES_DIR)
	cp pandoc.css $(PAGES_DIR)/pandoc.css

clean:
	rm -rf *~ $(TEXT_OUTPUT) $(HTML_OUTPUT) $(PDF_OUTPUT) *.xml $(EPUB_OUTPUT) $(PAGES_DIR)

.PHONY: all html clean pdf epub txt docker-build docker-pages pages
