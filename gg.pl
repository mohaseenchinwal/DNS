use strict;
use warnings;

my $file = '/root/scripts/qpmfn.txt';
open my $info, $file or die "Could not open $file: $!";

while( my $line = <$info>)  {   
    
 if ($line < 0)
      {
          chomp $line;
          #print "\n$line\n";
          $line = '0';
          print "$line";
      }

}

close $info;
