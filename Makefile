all: html

html: pascal_tutorial.html pascal_tutorial2.html

txt: pascal_tutorial.txt

pdf: pascal_tutorial.pdf

epub: pascal_tutorial.epub

pascal_tutorial.pdf: pascal_tutorial.asciidoc
	a2x -f pdf pascal_tutorial.asciidoc

#fop pdf generation
#a2x --fop -f pdf pascal_tutorial.asciidoc

pascal_tutorial.txt: pascal_tutorial.asciidoc
	a2x -f text pascal_tutorial.asciidoc
	mv pascal_tutorial.text pascal_tutorial.txt

pascal_tutorial.html: pascal_tutorial.asciidoc
	asciidoc -b html5 -a max-width=55em pascal_tutorial.asciidoc

pascal_tutorial2.html: pascal_tutorial.md
	pandoc --standalone --from markdown --to html5 -o pascal_tutorial2.html pascal_tutorial.md

pascal_tutorial.epub: pascal_tutorial.asciidoc
	a2x -f epub pascal_tutorial.asciidoc

clean:
	rm -f *~ *.txt *.html *.pdf *.css *.xml *.epub

.PHONY: all html clean pdf epub txt
