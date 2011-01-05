##this is a script to make a list of chapters (chapterlist.txt) and a list of ti#tles (titlelist.txt). May be useful for whatever reason, but for now planning to use it to keep the webpage up to date.

## read list of chapters from CRing.tex


$foo = $ARGV[0];

open (CR, "<", $foo) or die "failed";

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

open F, ">", "chapterlist.txt";
open F2, ">", "titlelist.txt";


for $f (@files)
{
    print F $f . "\n";
    
    open G, "<", "../chapters/$f.tex" or die "failed";
    @str = <G>;

    for $s (@str)
    {
	if ($s =~ m/\\chapter{/)
	{
	    $s =~ /\\chapter{(([a-z]|[A-Z]|\s|\$|\\)*)}/;
	    print F2 $1 . "\n";
	    last;

	}

    }
    close G;
}
close F;
