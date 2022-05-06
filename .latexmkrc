$theos = $ENV{'OS'};
print "Operating System : ";
print $theos; print "\nPreviwer         : ";

if ($theos =~ /darwin/) {
     print "Skim\n";
     $pdf_previewer = 'open -a Skim';
} 
elsif ($theos =~ /wsl/){

     print "Sumatra\n";
     $pdf_previewer = 'SumatraPDF.exe %O %S';

}
else
{
     print "Zathura\n";
     $pdf_previewer = "zathura";

};

print "Command          : ";
print $pdf_previewer; print "\n\n";



$pdflatex = 'pdflatex -pv -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
$xelatex = 'xelatex -no-pdf -synctex=1 -interaction=nonstopmode --shell-escape %O %S'; 

$xdvipdfmx = "xdvipdfmx -z 0 -o %D %O %S";
$dvi_mode = 0;
$pdf_mode = 1;
$postscript_mode = 0;
# $preview_mode = 1;
