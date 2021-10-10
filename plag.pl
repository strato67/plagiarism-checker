#Saaransh Sharma

use strict;

#Getting file location from user
print "Enter first file name\n";
my $file = <STDIN>;
print "Enter file name to compare with $file\n";
my $file2 = <STDIN>;

#Trims whitespace from input
chomp($file);
chomp($file2);

#Getting the total number of lines in first file
my $linecount = `wc -l < $file`;
chomp($linecount);

#Getting total number of lines in second file
my $linecount2 = `wc -l < $file2`;
chomp($linecount2);

#Counts the number of matches between files (Compares each line)
my $count=`grep -f $file -c $file2`;
chomp($count);

#Array will store each match found
my @lines = `grep -f $file $file2`;

#	Calculating similarity percent of both files,
#	need to double count to account for both files
my $similarity = (($count*2)/($linecount+$linecount2))*100;
$similarity = sprintf("%.2f",$similarity);
chomp($similarity);

#Final output
print "Calculated similarity of: $similarity% \n";
print "Found the following similar matches between $file and $file2:\n\n";
print @lines;

