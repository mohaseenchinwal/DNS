#!/usr/bin/perl
use strict;
use warnings;


use DBI;
use DBD::mysql;


##################################################################################################################################

my $dbh = DBI->connect("DBI:mysql:DNSSTATS", "root", "as12AS\!\@")or die "Unable to connect: $DBI::errstr\n";



system("/usr/bin/awk '\$1<0 {\$1=0} 1' /root/scripts/qpmf11.txt > /root/scripts/qpmf11.txt");
`/usr/bin/cat /root/scripts/qpmf11.txt | tr '\n' ',' > /root/scripts/test111.csv`;



my $q2 =  q{LOAD DATA  LOCAL INFILE '/root/scripts/test1.csv' INTO TABLE dns_stat
             FIELDS TERMINATED BY ',' ENCLOSED BY '"' TERMINATED BY ','
             LINES TERMINATED BY '\n'
             (TOTAL,SUCCESS,REFERRAL,NXRRSET,NXDOMAIN,RECURSION,FAILURE,SERVERFAIL,FORMERR,DROPPED);};

my $sth = $dbh->prepare($q2)  or die "Prepare failed: " . $dbh->errstr();
$sth->execute();

