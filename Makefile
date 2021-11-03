all: html txt pdf epub

html: pascal_tutorial.html

txt: pascal_tutorial.txt

pdf: pascal_tutorial.pdf

epub: pascal_tutorial.epub

pascal_tutorial.pdf: pascal_tutorial.md
	pandoc -o pascal_tutorial.pdf pascal_tutorial.md

pascal_tutorial.txt: pascal_tutorial.md
	pandoc -t plain -o pascal_tutorial.txt pascal_tutorial.md

pascal_tutorial.html: pascal_tutorial.md
	pandoc --standalone --number-section --toc --from markdown --to html5 -o pascal_tutorial2.html --css pandoc.css pascal_tutorial.md

pascal_tutorial.epub: pascal_tutorial.md
	pandoc -o pascal_tutorial.epub pascal_tutorial.md

clean:
	rm -f *~ *.txt *.html *.pdf *.css *.xml *.epub

.PHONY: all html clean pdf epub txt
