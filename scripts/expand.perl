##instructions: run this on f1 f2 to open the tex file f1, and expand out all \input commands to create a stand-alone tex file in f2. (Does not do nested \inputs across files...maybe it should someday). This is if people don't like huge nested directories but just want one .tex file. 

$fname = $ARGV[0];

$ofname = $ARGV[1];

open FL , "<", $fname or die "failed";
open FLO , ">", $ofname or die "failed";
@lines = <FL>;



for $ln (@lines)
{
    

    if ( $ln =~ m/\\input{/)
    {
	

	$ln =~ /\\input{(([a-z]|[A-Z]|.|\\)*)}/; 

	push(@filelist, $1);

	$aux = $1;

	open FLA, "<", $aux or die "failed";

	@auxlines = <FLA>;
	print FLO @auxlines;
	close FLA;
    
    }
    else
    {
	print FLO $ln;
    }





}



close FL;


close FLO;
