all: CRing.tex chapters/*.tex other/macros.tex other/titlepage.tex other/intro.tex other/theoremdef.tex other/packages.tex other/biblio.tex other/lastupdated.tex 
	pdflatex CRing.tex
	bibtex CRing
	pdflatex CRing.tex
	pdflatex CRing.tex
	pdflatex CRing.tex

dvi:
	latex -src CRing.tex	
	bibtex CRing
	latex -src CRing.tex
	latex -src CRing.tex	

preview:
	pdflatex CRing.tex
	open CRing.pdf

new_date:
	date +"%B %e, %Y." > other/lastupdated.tex	

update_tmp:
	perl -w scripts/makenamelist.perl
	perl -w scripts/script.perl

expand_abbrevs:
	sed -i 's/f\.g\./finitely generated/' chapters/*.tex
	sed -i 's/f\.p\./finitely presented/' chapters/*.tex
	sed -i 's/f\.f\./faithfully flat/' chapters/*.tex

tarball: CRing.tex chapters/*.tex other/* standalone/*.tex scripts/*  tmp/* makefile
	tar --transform='s,^,cring/,' -cvjf CRing.tar.bz2 CRing.tex chapters/*.tex other/* standalone/*.tex scripts/*  tmp/* makefile
	   cd ..;  zip -r cring/CRing.zip cring/CRing.tex cring/chapters/*.tex cring/other/* cring/standalone/*.tex cring/scripts/*  cring/tmp/* cring/makefile; cd cring

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


chcategories.pdf: standalone/chcategories.tex CRing.aux chapters/categories.tex
	pdflatex -src standalone/chcategories.tex
	bibtex chcategories
	pdflatex -src standalone/chcategories.tex

schcategories.pdf: standalone/chcategories.tex chapters/categories.tex
	pdflatex -src standalone/chcategories.tex


chfoundations.pdf: standalone/chfoundations.tex CRing.aux chapters/foundations.tex
	pdflatex -src standalone/chfoundations.tex
	bibtex chfoundations
	pdflatex -src standalone/chfoundations.tex

schfoundations.pdf: standalone/chfoundations.tex chapters/foundations.tex
	pdflatex -src standalone/chfoundations.tex


chfields.pdf: standalone/chfields.tex CRing.aux chapters/fields.tex
	pdflatex -src standalone/chfields.tex
	bibtex chfields
	pdflatex -src standalone/chfields.tex

schfields.pdf: standalone/chfields.tex chapters/fields.tex
	pdflatex -src standalone/chfields.tex


chthreeimportantfunctors.pdf: standalone/chthreeimportantfunctors.tex CRing.aux chapters/threeimportantfunctors.tex
	pdflatex -src standalone/chthreeimportantfunctors.tex
	bibtex chthreeimportantfunctors
	pdflatex -src standalone/chthreeimportantfunctors.tex

schthreeimportantfunctors.pdf: standalone/chthreeimportantfunctors.tex chapters/threeimportantfunctors.tex
	pdflatex -src standalone/chthreeimportantfunctors.tex


chspec.pdf: standalone/chspec.tex CRing.aux chapters/spec.tex
	pdflatex -src standalone/chspec.tex
	bibtex chspec
	pdflatex -src standalone/chspec.tex

schspec.pdf: standalone/chspec.tex chapters/spec.tex
	pdflatex -src standalone/chspec.tex


chnoetherian.pdf: standalone/chnoetherian.tex CRing.aux chapters/noetherian.tex
	pdflatex -src standalone/chnoetherian.tex
	bibtex chnoetherian
	pdflatex -src standalone/chnoetherian.tex

schnoetherian.pdf: standalone/chnoetherian.tex chapters/noetherian.tex
	pdflatex -src standalone/chnoetherian.tex


chgraded.pdf: standalone/chgraded.tex CRing.aux chapters/graded.tex
	pdflatex -src standalone/chgraded.tex
	bibtex chgraded
	pdflatex -src standalone/chgraded.tex

schgraded.pdf: standalone/chgraded.tex chapters/graded.tex
	pdflatex -src standalone/chgraded.tex


chintegrality.pdf: standalone/chintegrality.tex CRing.aux chapters/integrality.tex
	pdflatex -src standalone/chintegrality.tex
	bibtex chintegrality
	pdflatex -src standalone/chintegrality.tex

schintegrality.pdf: standalone/chintegrality.tex chapters/integrality.tex
	pdflatex -src standalone/chintegrality.tex


chfactorization.pdf: standalone/chfactorization.tex CRing.aux chapters/factorization.tex
	pdflatex -src standalone/chfactorization.tex
	bibtex chfactorization
	pdflatex -src standalone/chfactorization.tex

schfactorization.pdf: standalone/chfactorization.tex chapters/factorization.tex
	pdflatex -src standalone/chfactorization.tex


chdedekind.pdf: standalone/chdedekind.tex CRing.aux chapters/dedekind.tex
	pdflatex -src standalone/chdedekind.tex
	bibtex chdedekind
	pdflatex -src standalone/chdedekind.tex

schdedekind.pdf: standalone/chdedekind.tex chapters/dedekind.tex
	pdflatex -src standalone/chdedekind.tex


chdimension.pdf: standalone/chdimension.tex CRing.aux chapters/dimension.tex
	pdflatex -src standalone/chdimension.tex
	bibtex chdimension
	pdflatex -src standalone/chdimension.tex

schdimension.pdf: standalone/chdimension.tex chapters/dimension.tex
	pdflatex -src standalone/chdimension.tex


chcompletion.pdf: standalone/chcompletion.tex CRing.aux chapters/completion.tex
	pdflatex -src standalone/chcompletion.tex
	bibtex chcompletion
	pdflatex -src standalone/chcompletion.tex

schcompletion.pdf: standalone/chcompletion.tex chapters/completion.tex
	pdflatex -src standalone/chcompletion.tex


chsmoothness.pdf: standalone/chsmoothness.tex CRing.aux chapters/smoothness.tex
	pdflatex -src standalone/chsmoothness.tex
	bibtex chsmoothness
	pdflatex -src standalone/chsmoothness.tex

schsmoothness.pdf: standalone/chsmoothness.tex chapters/smoothness.tex
	pdflatex -src standalone/chsmoothness.tex


chvarious.pdf: standalone/chvarious.tex CRing.aux chapters/various.tex
	pdflatex -src standalone/chvarious.tex
	bibtex chvarious
	pdflatex -src standalone/chvarious.tex

schvarious.pdf: standalone/chvarious.tex chapters/various.tex
	pdflatex -src standalone/chvarious.tex


chhomological.pdf: standalone/chhomological.tex CRing.aux chapters/homological.tex
	pdflatex -src standalone/chhomological.tex
	bibtex chhomological
	pdflatex -src standalone/chhomological.tex

schhomological.pdf: standalone/chhomological.tex chapters/homological.tex
	pdflatex -src standalone/chhomological.tex


chflat.pdf: standalone/chflat.tex CRing.aux chapters/flat.tex
	pdflatex -src standalone/chflat.tex
	bibtex chflat
	pdflatex -src standalone/chflat.tex

schflat.pdf: standalone/chflat.tex chapters/flat.tex
	pdflatex -src standalone/chflat.tex


chhomologicallocal.pdf: standalone/chhomologicallocal.tex CRing.aux chapters/homologicallocal.tex
	pdflatex -src standalone/chhomologicallocal.tex
	bibtex chhomologicallocal
	pdflatex -src standalone/chhomologicallocal.tex

schhomologicallocal.pdf: standalone/chhomologicallocal.tex chapters/homologicallocal.tex
	pdflatex -src standalone/chhomologicallocal.tex


chetale.pdf: standalone/chetale.tex CRing.aux chapters/etale.tex
	pdflatex -src standalone/chetale.tex
	bibtex chetale
	pdflatex -src standalone/chetale.tex

schetale.pdf: standalone/chetale.tex chapters/etale.tex
	pdflatex -src standalone/chetale.tex


chhomotopical.pdf: standalone/chhomotopical.tex CRing.aux chapters/homotopical.tex
	pdflatex -src standalone/chhomotopical.tex
	bibtex chhomotopical
	pdflatex -src standalone/chhomotopical.tex

schhomotopical.pdf: standalone/chhomotopical.tex chapters/homotopical.tex
	pdflatex -src standalone/chhomotopical.tex


chlicense.pdf: standalone/chlicense.tex CRing.aux chapters/license.tex
	pdflatex -src standalone/chlicense.tex
	bibtex chlicense
	pdflatex -src standalone/chlicense.tex

schlicense.pdf: standalone/chlicense.tex chapters/license.tex
	pdflatex -src standalone/chlicense.tex


chapters:  chcategories.pdf chfoundations.pdf chfields.pdf chthreeimportantfunctors.pdf chspec.pdf chnoetherian.pdf chgraded.pdf chintegrality.pdf chfactorization.pdf chdedekind.pdf chdimension.pdf chcompletion.pdf chsmoothness.pdf chvarious.pdf chhomological.pdf chflat.pdf chhomologicallocal.pdf chetale.pdf chhomotopical.pdf chlicense.pdf

