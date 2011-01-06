all: CRing.tex chapters/*.tex other/macros.tex other/titlepage.tex other/intro.tex other/theoremdef.tex other/packages.tex other/biblio.tex other/lastupdated.tex 
	pdflatex CRing.tex
	pdflatex CRing.tex
	bibtex CRing
	pdflatex CRing.tex

dvi:
	latex -src CRing.tex	
	latex -src CRing.tex
	bibtex CRing
	latex -src CRing.tex	

preview:
	pdflatex CRing.tex
	open CRing.pdf

new_date:
	date +"%B %e, %Y." > other/lastupdated.tex	

update_tmp:
	perl scripts/makenamelist.perl
	perl scripts/script.perl


tarball: CRing.tex chapters/*.tex other/* aux/*.tex scripts/*  tmp/* makefile
	tar cvjf CRing.tar.bz2 CRing.tex chapters/*.tex other/* aux/*.tex scripts/*  tmp/* makefile	zip -r CRing.zip CRing.tex chapters/*.tex other/* aux/*.tex scripts/*  tmp/* makefile

clean:
	rm -f *.log *.pdf *.dvi *.out *.log *.toc *.aux *.fdb_latexmk *.blg *.bbl *.thm

cleanup:
	rm -f *.log *.out *.log *.toc *.aux *.fdb_latexmk *.blg *.bbl *.thm

CRing.aux: chapters/*.tex CRing.tex other/*.tex
	pdflatex CRing
	pdflatex CRing
	bibtex CRing
	pdflatex CRing

#chapters start  (please do not delete this comment!)


chcategories.pdf: aux/chcategories.tex CRing.aux chapters/categories.tex
	pdflatex -src aux/chcategories.tex
	pdflatex -src aux/chcategories.tex

chfoundations.pdf: aux/chfoundations.tex CRing.aux chapters/foundations.tex
	pdflatex -src aux/chfoundations.tex
	pdflatex -src aux/chfoundations.tex

chfields.pdf: aux/chfields.tex CRing.aux chapters/fields.tex
	pdflatex -src aux/chfields.tex
	pdflatex -src aux/chfields.tex

chthreeimportantfunctors.pdf: aux/chthreeimportantfunctors.tex CRing.aux chapters/threeimportantfunctors.tex
	pdflatex -src aux/chthreeimportantfunctors.tex
	pdflatex -src aux/chthreeimportantfunctors.tex

chspec.pdf: aux/chspec.tex CRing.aux chapters/spec.tex
	pdflatex -src aux/chspec.tex
	pdflatex -src aux/chspec.tex

chgraded.pdf: aux/chgraded.tex CRing.aux chapters/graded.tex
	pdflatex -src aux/chgraded.tex
	pdflatex -src aux/chgraded.tex

chnoetherian.pdf: aux/chnoetherian.tex CRing.aux chapters/noetherian.tex
	pdflatex -src aux/chnoetherian.tex
	pdflatex -src aux/chnoetherian.tex

chintegrality.pdf: aux/chintegrality.tex CRing.aux chapters/integrality.tex
	pdflatex -src aux/chintegrality.tex
	pdflatex -src aux/chintegrality.tex

chfactorization.pdf: aux/chfactorization.tex CRing.aux chapters/factorization.tex
	pdflatex -src aux/chfactorization.tex
	pdflatex -src aux/chfactorization.tex

chdedekind.pdf: aux/chdedekind.tex CRing.aux chapters/dedekind.tex
	pdflatex -src aux/chdedekind.tex
	pdflatex -src aux/chdedekind.tex

chdimension.pdf: aux/chdimension.tex CRing.aux chapters/dimension.tex
	pdflatex -src aux/chdimension.tex
	pdflatex -src aux/chdimension.tex

chcompletion.pdf: aux/chcompletion.tex CRing.aux chapters/completion.tex
	pdflatex -src aux/chcompletion.tex
	pdflatex -src aux/chcompletion.tex

chsmoothness.pdf: aux/chsmoothness.tex CRing.aux chapters/smoothness.tex
	pdflatex -src aux/chsmoothness.tex
	pdflatex -src aux/chsmoothness.tex

chhomological.pdf: aux/chhomological.tex CRing.aux chapters/homological.tex
	pdflatex -src aux/chhomological.tex
	pdflatex -src aux/chhomological.tex

chflat.pdf: aux/chflat.tex CRing.aux chapters/flat.tex
	pdflatex -src aux/chflat.tex
	pdflatex -src aux/chflat.tex

chetale.pdf: aux/chetale.tex CRing.aux chapters/etale.tex
	pdflatex -src aux/chetale.tex
	pdflatex -src aux/chetale.tex

chlicense.pdf: aux/chlicense.tex CRing.aux chapters/license.tex
	pdflatex -src aux/chlicense.tex
	pdflatex -src aux/chlicense.tex

chapters:  chcategories.pdf chfoundations.pdf chfields.pdf chthreeimportantfunctors.pdf chspec.pdf chgraded.pdf chnoetherian.pdf chintegrality.pdf chfactorization.pdf chdedekind.pdf chdimension.pdf chcompletion.pdf chsmoothness.pdf chhomological.pdf chflat.pdf chetale.pdf chlicense.pdf

