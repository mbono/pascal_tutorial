all: html

html: pascal.html

txt: pascal.txt

pdf: pascal.pdf

epub: pascal.epub

pascal.pdf: pascal.asciidoc
	a2x -f pdf pascal.asciidoc

#fop pdf generation
#a2x --fop -f pdf pascal.asciidoc

pascal.txt: pascal.asciidoc
	a2x -f text pascal.asciidoc
	mv pascal.text pascal.txt

pascal.html: pascal.asciidoc
	asciidoc -b html5 -a max-width=55em pascal.asciidoc

pascal.epub: pascal.asciidoc
	a2x -f epub pascal.asciidoc

clean:
	rm -f *~ *.txt *.html *.pdf *.css *.xml *.epub

.PHONY: all html clean pdf epub txt
