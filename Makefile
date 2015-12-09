TEXLIVE_HOME=$(HOME)/opt/texlive
TEXLIVE_BIN=$(TEXLIVE_HOME)/bin/x86_64-linux
PDFLATEX=$(TEXLIVE_BIN)/pdflatex
MAKEGLOSSARIES=$(TEXLIVE_BIN)/makeglossaries
BIBTEX=$(TEXLIVE_BIN)/bibtex
DOCNAME=Book

LOCALTEXINPUTS=$(PWD)/tex

all:
	mkdir -p build
	cd build && env TEXINPUTS=$(TEXINPUTS):$(LOCALTEXINPUTS) $(PDFLATEX) ../$(DOCNAME).tex
	#cd build && $(MAKEGLOSSARIES) $(DOCNAME)
	#cd build && $(BIBTEX) $(DOCNAME)
	#cd build && $(PDFLATEX) ../$(DOCNAME).tex
	#cd build && $(PDFLATEX) ../$(DOCNAME).tex

show: all
	zathura build/$(DOCNAME).pdf

clean:
	rm -rf build

full: clean all show
