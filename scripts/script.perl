## This does a bunch of useful things like fixing the makefile (to reflect the latest chapter list)
## it also generates mini-chapter files in the aux/ diretory

## THIS SHOULD BE RUN FROM THE MAIN DIRECTORY


## read list of chapters


open (CR, "<", "tmp/chapterlist.txt") or die;

@files = <CR>;


#create placeholder files for each chapter



$i = -1;

for $name (@files)
{
    chop($name);

    $tmpname = "aux/ch" .  $name . ".tex";

    open (FILE, ">", $tmpname) or die "error opening";

##add stuff
    print FILE "\\documentclass{book}\n\n\\input{other/packages.tex}
\n\\input{other/macros.tex}\n\\input{other/theoremdef.tex}\n\\input{other/formatting.tex}\n\n";
    print FILE "\\usepackage{xr}\n\n";

    print FILE "\\externaldocument[MAIN-]{CRing}\n\n";


    print FILE "\\newcommand{\\rref}[1]{\\cref{MAIN-#1}}\n\n\\usepackage[tight]{shorttoc}";

    print FILE "\n\n\\begin{document}\n\n";
    $j = $i+1;
#copyright
    print FILE "\\pagestyle{fancy}\n\\fancyhead{}\n\\fancyfoot{}\n\\fancyhead[C]{CRing Project, Chapter $j}\n \\fancyfoot[C]{\\thepage}\n\n";
    print FILE "\\tableofcontents\n\n";

    if ($name ne "license")
    {
	print FILE "\\textbf{Copyright 2011 the CRing Project. This file is part of the CRing Project, which is released under the GNU Free Documentation License, Version 1.2.}\n\n";
    }


    print FILE "\\setcounter{chapter}{$i}\n\n";
    print FILE "\\input{chapters/$name.tex}\n\n";
    print FILE "\\anothertoc{CRing}{CRing Project contents}{0}\n\n";
    print FILE "\\end{document}";


    
    close FILE or die "error closing";

    $i = $i + 1;
}



#edit makefile

open(MK, "<", "makefile");
@mk = <MK>;

close MK;

open(MK2, ">", "makefile");




for $line (@mk)
{
 
    print MK2 $line;
    if ($line =~ m/chapters start/)
    {
	last;
    }
    
}

print MK2 "\n\n";


for $fl (@files)
{
    
    $str = "ch". $fl . ".pdf: " . "aux/ch" . $fl . ".tex" . " CRing.aux chapters/" . $fl . ".tex\n\tpdflatex -src aux/ch" . $fl . ".tex\n". "\tpdflatex -src aux/ch" . $fl . ".tex";

    print MK2  $str . "\n\n";

    
    $str2 = "sch". $fl . ".pdf: " . "aux/ch" . $fl . ".tex" . " chapters/" . $fl . ".tex\n\tpdflatex -src aux/ch" . $fl . ".tex\n". "\tpdflatex -src aux/ch" . $fl . ".tex";
    print MK2 $str2 . "\n\n";

}


$str2 = "chapters: ";
for $fles (@files)
{
    $str2 = $str2 . " ch" . $fles . ".pdf";


}

print MK2  $str2 . "\n\n";

close(MK2);


