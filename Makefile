SHELL := /bin/bash
BIB_PROG := bibtex

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile flex-ddG.tex references.bib
CVTEXNAME = flex-ddG

all: $(CVTEXNAME).pdf
$(CVTEXNAME).pdf: $(CVTEXNAME).tex $(SOURCES)
	pdflatex $(CVTEXNAME)
	$(BIB_PROG) $(CVTEXNAME)
	pdflatex $(CVTEXNAME)
	pdflatex $(CVTEXNAME)
clean:
	grep -vE '^(#|$$)' .gitignore | xargs rm -f
