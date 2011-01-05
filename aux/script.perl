
## read list of chapters


open (CR, "<", "../CRing.tex") or die "damn";

@lines = <CR>;

#get chapter names

for $line (@lines)
{
    if ( $line =~ m/chapters\//)
    {
	
	$line =~ /chapters\/([a-z]*).tex/; 
	push(@files, $1);
    }

}



#create placeholder files for each chapter



$i = -1;

for $name (@files)
{

    $tmpname = "ch" .  $name . ".tex";

    open (FILE, ">", $tmpname) or die "error opening";

##add stuff
    print FILE "\\documentclass{book}\n\n\\input{other/packages.tex}
\n\\input{other/macros.tex}\n\\input{other/theoremdef.tex}\n\\input{other/formatting.tex}\n\n";
    print FILE "\\usepackage{xr}\n\n";

    print FILE "\\externaldocument[MAIN-]{CRing}\n\n";


    print FILE "\\newcommand{\\rref}[1]{\\cref{MAIN-#1}}\n\n";

    print FILE "\\begin{document}\n\n";
    print FILE "\\tableofcontents\n\n";
    print FILE "\\setcounter{chapter}{$i}\n\n";
    print FILE "\\input{chapters/$name.tex}\n\n";
    print FILE "\\end{document}";


    
    close FILE or die "error closing";

    $i = $i + 1;
}



#edit makefile

open(MK, "<", "../makefile");
@mk = <MK>;

close MK;

open(MK2, ">", "../makefile");



$j = 0;
for $line (@mk)
{
    $j++;
    print MK2 $line;
    if ($line =~ m/chapters start/)
    {
	last;
    }
    
}

print MK2 "\n\n";
print $j;

for $fl (@files)
{
    $str = "ch". $fl . ".pdf: " . "aux/ch" . $fl . ".tex" . " CRing.aux chapters/" . $fl . ".tex\n\tpdflatex -src aux/ch" . $fl . ".tex\n". "\tpdflatex -src aux/ch" . $fl . ".tex";

    print MK2  $str . "\n\n";
}


$str2 = "chapters: ";
for $fles (@files)
{
    $str2 = $str2 . " ch" . $fles . ".pdf";


}

print MK2  $str2 . "\n\n";

close(MK2);


