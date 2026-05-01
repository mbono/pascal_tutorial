EN_SOURCE := pascal_tutorial.md
IT_SOURCE := pascal_tutorial.it.md

EN_HTML_OUTPUT := pascal_tutorial.html
EN_TEXT_OUTPUT := pascal_tutorial.txt
EN_PDF_OUTPUT := pascal_tutorial.pdf
EN_EPUB_OUTPUT := pascal_tutorial.epub

IT_HTML_OUTPUT := pascal_tutorial.it.html
IT_TEXT_OUTPUT := pascal_tutorial.it.txt
IT_PDF_OUTPUT := pascal_tutorial.it.pdf
IT_EPUB_OUTPUT := pascal_tutorial.it.epub

PAGES_DIR := _site
IT_PAGES_DIR := $(PAGES_DIR)/it

all: html txt pdf epub

html: $(EN_HTML_OUTPUT) $(IT_HTML_OUTPUT)

txt: $(EN_TEXT_OUTPUT) $(IT_TEXT_OUTPUT)

pdf: $(EN_PDF_OUTPUT) $(IT_PDF_OUTPUT)

# Optional Docker-based build for all tutorial artifacts.
docker-build:
	LOCAL_UID=$$(id -u) LOCAL_GID=$$(id -g) docker compose run --rm tutorial-build

docker-pages:
	LOCAL_UID=$$(id -u) LOCAL_GID=$$(id -g) docker compose run --rm tutorial-build pages

epub: $(EN_EPUB_OUTPUT) $(IT_EPUB_OUTPUT)

pages: \
	$(PAGES_DIR)/index.html \
	$(PAGES_DIR)/$(EN_TEXT_OUTPUT) \
	$(PAGES_DIR)/$(EN_PDF_OUTPUT) \
	$(PAGES_DIR)/$(EN_EPUB_OUTPUT) \
	$(PAGES_DIR)/pandoc.css \
	$(IT_PAGES_DIR)/index.html \
	$(IT_PAGES_DIR)/$(IT_TEXT_OUTPUT) \
	$(IT_PAGES_DIR)/$(IT_PDF_OUTPUT) \
	$(IT_PAGES_DIR)/$(IT_EPUB_OUTPUT) \
	$(IT_PAGES_DIR)/pandoc.css

$(EN_PDF_OUTPUT): $(EN_SOURCE)
	pandoc -o $(EN_PDF_OUTPUT) $(EN_SOURCE)

$(IT_PDF_OUTPUT): $(IT_SOURCE)
	pandoc -o $(IT_PDF_OUTPUT) $(IT_SOURCE)

$(EN_TEXT_OUTPUT): $(EN_SOURCE)
	pandoc -t plain -o $(EN_TEXT_OUTPUT) $(EN_SOURCE)

$(IT_TEXT_OUTPUT): $(IT_SOURCE)
	pandoc -t plain -o $(IT_TEXT_OUTPUT) $(IT_SOURCE)

$(EN_HTML_OUTPUT): $(EN_SOURCE) pandoc.css
	pandoc --standalone --number-section --toc --from markdown --to html5 -o $(EN_HTML_OUTPUT) --css pandoc.css $(EN_SOURCE)

$(IT_HTML_OUTPUT): $(IT_SOURCE) pandoc.css
	pandoc --standalone --number-section --toc --from markdown --to html5 -o $(IT_HTML_OUTPUT) --css pandoc.css $(IT_SOURCE)

$(EN_EPUB_OUTPUT): $(EN_SOURCE)
	pandoc -o $(EN_EPUB_OUTPUT) $(EN_SOURCE)

$(IT_EPUB_OUTPUT): $(IT_SOURCE)
	pandoc -o $(IT_EPUB_OUTPUT) $(IT_SOURCE)

$(PAGES_DIR):
	mkdir -p $(PAGES_DIR)

$(IT_PAGES_DIR):
	mkdir -p $(IT_PAGES_DIR)

$(PAGES_DIR)/index.html: $(EN_HTML_OUTPUT) | $(PAGES_DIR)
	cp $(EN_HTML_OUTPUT) $(PAGES_DIR)/index.html

$(PAGES_DIR)/$(EN_TEXT_OUTPUT): $(EN_TEXT_OUTPUT) | $(PAGES_DIR)
	cp $(EN_TEXT_OUTPUT) $(PAGES_DIR)/$(EN_TEXT_OUTPUT)

$(PAGES_DIR)/$(EN_PDF_OUTPUT): $(EN_PDF_OUTPUT) | $(PAGES_DIR)
	cp $(EN_PDF_OUTPUT) $(PAGES_DIR)/$(EN_PDF_OUTPUT)

$(PAGES_DIR)/$(EN_EPUB_OUTPUT): $(EN_EPUB_OUTPUT) | $(PAGES_DIR)
	cp $(EN_EPUB_OUTPUT) $(PAGES_DIR)/$(EN_EPUB_OUTPUT)

$(PAGES_DIR)/pandoc.css: pandoc.css | $(PAGES_DIR)
	cp pandoc.css $(PAGES_DIR)/pandoc.css

$(IT_PAGES_DIR)/index.html: $(IT_HTML_OUTPUT) | $(IT_PAGES_DIR)
	cp $(IT_HTML_OUTPUT) $(IT_PAGES_DIR)/index.html

$(IT_PAGES_DIR)/$(IT_TEXT_OUTPUT): $(IT_TEXT_OUTPUT) | $(IT_PAGES_DIR)
	cp $(IT_TEXT_OUTPUT) $(IT_PAGES_DIR)/$(IT_TEXT_OUTPUT)

$(IT_PAGES_DIR)/$(IT_PDF_OUTPUT): $(IT_PDF_OUTPUT) | $(IT_PAGES_DIR)
	cp $(IT_PDF_OUTPUT) $(IT_PAGES_DIR)/$(IT_PDF_OUTPUT)

$(IT_PAGES_DIR)/$(IT_EPUB_OUTPUT): $(IT_EPUB_OUTPUT) | $(IT_PAGES_DIR)
	cp $(IT_EPUB_OUTPUT) $(IT_PAGES_DIR)/$(IT_EPUB_OUTPUT)

$(IT_PAGES_DIR)/pandoc.css: pandoc.css | $(IT_PAGES_DIR)
	cp pandoc.css $(IT_PAGES_DIR)/pandoc.css

clean:
	rm -rf *~ \
		$(EN_TEXT_OUTPUT) $(EN_HTML_OUTPUT) $(EN_PDF_OUTPUT) $(EN_EPUB_OUTPUT) \
		$(IT_TEXT_OUTPUT) $(IT_HTML_OUTPUT) $(IT_PDF_OUTPUT) $(IT_EPUB_OUTPUT) \
		*.xml $(PAGES_DIR)

.PHONY: all html clean pdf epub txt docker-build docker-pages pages
