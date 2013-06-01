all: html

html: pascal.html

text: pascal.text

pdf: pascal.pdf

pascal.pdf: pascal.txt
	a2x -f pdf pascal.txt

#fop
#a2x --fop -f pdf pascal.txt

pascal.text: pascal.txt
	a2x -f text pascal.txt

pascal.html: pascal.txt
	asciidoc -b html pascal.txt

clean:
	rm -f *~ *.text *.html *.pdf *.css
