all: html

html: pascal.html

text: pascal.text

pdf: pascal.pdf

pascal.pdf: pascal.asciidoc
	a2x -f pdf pascal.asciidoc

#fop
#a2x --fop -f pdf pascal.asciidoc

pascal.text: pascal.asciidoc
	a2x -f text pascal.asciidoc

pascal.html: pascal.asciidoc
	asciidoc -b html pascal.asciidoc

clean:
	rm -f *~ *.text *.html *.pdf *.css
