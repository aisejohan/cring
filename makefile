all: CRing.tex chapters/*.tex other/macros.tex other/intro.tex other/theoremdef.tex other/packages.tex other/biblio.tex other/contrib.tex other/lastupdated.tex other/references.bib 
	pdflatex CRing.tex
	pdflatex CRing.tex
	bibtex CRing
	pdflatex CRing.tex

clean:
	rm CRing.toc CRing.aux CRing.bbl CRing.log CRing.blg CRing.out CRing.fdb_latexmk