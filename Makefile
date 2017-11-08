SHELL := /bin/bash
BIB_PROG := bibtex

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile *.tex references.bib figs-and-tables/*
CVTEXNAME = flex-ddG

all: $(CVTEXNAME).pdf
$(CVTEXNAME).pdf: suppinfo.pdf $(CVTEXNAME).tex $(SOURCES)
	pdflatex --shell-escape $(CVTEXNAME)
	-$(BIB_PROG) $(CVTEXNAME)
	pdflatex --shell-escape $(CVTEXNAME)
	pdflatex --shell-escape $(CVTEXNAME)
	pdflatex --shell-escape suppinfo
	pdflatex --shell-escape suppinfo
	pdflatex --shell-escape suppinfo
suppinfo.pdf: figs-and-tables/* table-by-structure.tex suppinfo.tex
	pdflatex --shell-escape suppinfo
	pdflatex --shell-escape suppinfo
	pdflatex --shell-escape suppinfo
clean:
	grep -vE '^(#|$$)' .gitignore | xargs rm -rf
