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
	perl -w scripts/makenamelist.perl
	perl -w scripts/script.perl


tarball: CRing.tex chapters/*.tex other/* aux/*.tex scripts/*  tmp/* makefile
	tar --transform='s,^,cring/,' -cvjf CRing.tar.bz2 CRing.tex chapters/*.tex other/* aux/*.tex scripts/*  tmp/* makefile
	   cd ..;  zip -r cring/CRing.zip cring/CRing.tex cring/chapters/*.tex cring/other/* cring/aux/*.tex cring/scripts/*  cring/tmp/* cring/makefile; cd cring

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
	bibtex chcategories
	pdflatex -src aux/chcategories.tex

schcategories.pdf: aux/chcategories.tex chapters/categories.tex
	pdflatex -src aux/chcategories.tex
	pdflatex -src aux/chcategories.tex

chfoundations.pdf: aux/chfoundations.tex CRing.aux chapters/foundations.tex
	pdflatex -src aux/chfoundations.tex
	bibtex chfoundations
	pdflatex -src aux/chfoundations.tex

schfoundations.pdf: aux/chfoundations.tex chapters/foundations.tex
	pdflatex -src aux/chfoundations.tex
	pdflatex -src aux/chfoundations.tex

chfields.pdf: aux/chfields.tex CRing.aux chapters/fields.tex
	pdflatex -src aux/chfields.tex
	bibtex chfields
	pdflatex -src aux/chfields.tex

schfields.pdf: aux/chfields.tex chapters/fields.tex
	pdflatex -src aux/chfields.tex
	pdflatex -src aux/chfields.tex

chthreeimportantfunctors.pdf: aux/chthreeimportantfunctors.tex CRing.aux chapters/threeimportantfunctors.tex
	pdflatex -src aux/chthreeimportantfunctors.tex
	bibtex chthreeimportantfunctors
	pdflatex -src aux/chthreeimportantfunctors.tex

schthreeimportantfunctors.pdf: aux/chthreeimportantfunctors.tex chapters/threeimportantfunctors.tex
	pdflatex -src aux/chthreeimportantfunctors.tex
	pdflatex -src aux/chthreeimportantfunctors.tex

chspec.pdf: aux/chspec.tex CRing.aux chapters/spec.tex
	pdflatex -src aux/chspec.tex
	bibtex chspec
	pdflatex -src aux/chspec.tex

schspec.pdf: aux/chspec.tex chapters/spec.tex
	pdflatex -src aux/chspec.tex
	pdflatex -src aux/chspec.tex

chgraded.pdf: aux/chgraded.tex CRing.aux chapters/graded.tex
	pdflatex -src aux/chgraded.tex
	bibtex chgraded
	pdflatex -src aux/chgraded.tex

schgraded.pdf: aux/chgraded.tex chapters/graded.tex
	pdflatex -src aux/chgraded.tex
	pdflatex -src aux/chgraded.tex

chnoetherian.pdf: aux/chnoetherian.tex CRing.aux chapters/noetherian.tex
	pdflatex -src aux/chnoetherian.tex
	bibtex chnoetherian
	pdflatex -src aux/chnoetherian.tex

schnoetherian.pdf: aux/chnoetherian.tex chapters/noetherian.tex
	pdflatex -src aux/chnoetherian.tex
	pdflatex -src aux/chnoetherian.tex

chintegrality.pdf: aux/chintegrality.tex CRing.aux chapters/integrality.tex
	pdflatex -src aux/chintegrality.tex
	bibtex chintegrality
	pdflatex -src aux/chintegrality.tex

schintegrality.pdf: aux/chintegrality.tex chapters/integrality.tex
	pdflatex -src aux/chintegrality.tex
	pdflatex -src aux/chintegrality.tex

chfactorization.pdf: aux/chfactorization.tex CRing.aux chapters/factorization.tex
	pdflatex -src aux/chfactorization.tex
	bibtex chfactorization
	pdflatex -src aux/chfactorization.tex

schfactorization.pdf: aux/chfactorization.tex chapters/factorization.tex
	pdflatex -src aux/chfactorization.tex
	pdflatex -src aux/chfactorization.tex

chdedekind.pdf: aux/chdedekind.tex CRing.aux chapters/dedekind.tex
	pdflatex -src aux/chdedekind.tex
	bibtex chdedekind
	pdflatex -src aux/chdedekind.tex

schdedekind.pdf: aux/chdedekind.tex chapters/dedekind.tex
	pdflatex -src aux/chdedekind.tex
	pdflatex -src aux/chdedekind.tex

chdimension.pdf: aux/chdimension.tex CRing.aux chapters/dimension.tex
	pdflatex -src aux/chdimension.tex
	bibtex chdimension
	pdflatex -src aux/chdimension.tex

schdimension.pdf: aux/chdimension.tex chapters/dimension.tex
	pdflatex -src aux/chdimension.tex
	pdflatex -src aux/chdimension.tex

chcompletion.pdf: aux/chcompletion.tex CRing.aux chapters/completion.tex
	pdflatex -src aux/chcompletion.tex
	bibtex chcompletion
	pdflatex -src aux/chcompletion.tex

schcompletion.pdf: aux/chcompletion.tex chapters/completion.tex
	pdflatex -src aux/chcompletion.tex
	pdflatex -src aux/chcompletion.tex

chsmoothness.pdf: aux/chsmoothness.tex CRing.aux chapters/smoothness.tex
	pdflatex -src aux/chsmoothness.tex
	bibtex chsmoothness
	pdflatex -src aux/chsmoothness.tex

schsmoothness.pdf: aux/chsmoothness.tex chapters/smoothness.tex
	pdflatex -src aux/chsmoothness.tex
	pdflatex -src aux/chsmoothness.tex

chhomological.pdf: aux/chhomological.tex CRing.aux chapters/homological.tex
	pdflatex -src aux/chhomological.tex
	bibtex chhomological
	pdflatex -src aux/chhomological.tex

schhomological.pdf: aux/chhomological.tex chapters/homological.tex
	pdflatex -src aux/chhomological.tex
	pdflatex -src aux/chhomological.tex

chflat.pdf: aux/chflat.tex CRing.aux chapters/flat.tex
	pdflatex -src aux/chflat.tex
	bibtex chflat
	pdflatex -src aux/chflat.tex

schflat.pdf: aux/chflat.tex chapters/flat.tex
	pdflatex -src aux/chflat.tex
	pdflatex -src aux/chflat.tex

chetale.pdf: aux/chetale.tex CRing.aux chapters/etale.tex
	pdflatex -src aux/chetale.tex
	bibtex chetale
	pdflatex -src aux/chetale.tex

schetale.pdf: aux/chetale.tex chapters/etale.tex
	pdflatex -src aux/chetale.tex
	pdflatex -src aux/chetale.tex

chlicense.pdf: aux/chlicense.tex CRing.aux chapters/license.tex
	pdflatex -src aux/chlicense.tex
	bibtex chlicense
	pdflatex -src aux/chlicense.tex

schlicense.pdf: aux/chlicense.tex chapters/license.tex
	pdflatex -src aux/chlicense.tex
	pdflatex -src aux/chlicense.tex

chapters:  chcategories.pdf chfoundations.pdf chfields.pdf chthreeimportantfunctors.pdf chspec.pdf chgraded.pdf chnoetherian.pdf chintegrality.pdf chfactorization.pdf chdedekind.pdf chdimension.pdf chcompletion.pdf chsmoothness.pdf chhomological.pdf chflat.pdf chetale.pdf chlicense.pdf

