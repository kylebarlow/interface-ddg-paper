SHELL := /bin/bash
BIB_PROG := bibtex

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile flex-ddG.tex references.bib
TEXNAME = flex-ddG

all: $(TEXNAME).rtf
$(TEXNAME).pdf: $(TEXNAME).tex $(SOURCES)
	xelatex $(TEXNAME)
	$(BIB_PROG) $(TEXNAME)
	xelatex $(TEXNAME)
	xelatex $(TEXNAME)
$(TEXNAME).rtf: $(TEXNAME).pdf
	latex2rtf $(TEXNAME)
clean:
	grep -vE '^(#|$$)' .gitignore | xargs rm -f
