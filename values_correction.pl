#!/usr/bin/perl
use strict;
use warnings;


use DBI;
use DBD::mysql;


##################################################################################################################################

my $dbh = DBI->connect("DBI:mysql:DNSSTATS", "root", "as12AS\!\@")or die "Unable to connect: $DBI::errstr\n";








my @sql = (

q{DELETE FROM dns1pri_stats where TOTAL < 0;},
q{DELETE FROM dns1sec_stats where TOTAL < 0;},
q{DELETE FROM dns2pri_stats where TOTAL < 0;},
q{DELETE FROM dns2sec_stats where TOTAL < 0;},
q{DELETE FROM dns_stat where TOTAL < 0;},

q{DELETE FROM dns1pri_stats where SUCCESS < 0;},
q{DELETE FROM dns1sec_stats where SUCCESS < 0;},
q{DELETE FROM dns2pri_stats where SUCCESS < 0;},
q{DELETE FROM dns2sec_stats where SUCCESS < 0;},
q{DELETE FROM dns_stat where SUCCESS < 0;},


q{DELETE FROM dns1pri_stats where TOTAL < 0;},
q{DELETE FROM dns1sec_stats where TOTAL < 0;},
q{DELETE FROM dns2pri_stats where TOTAL < 0;},
q{DELETE FROM dns2sec_stats where TOTAL < 0;},
q{DELETE FROM dns_stat where TOTAL < 0;},


q{DELETE FROM dns1pri_stats where REFERRAL < 0;},
q{DELETE FROM dns1sec_stats where REFERRAL < 0;},
q{DELETE FROM dns2pri_stats where REFERRAL < 0;},
q{DELETE FROM dns2sec_stats where REFERRAL < 0;},
q{DELETE FROM dns_stat where REFERRAL < 0;},

q{DELETE FROM dns1pri_stats where NXRRSET < 0;},
q{DELETE FROM dns1sec_stats where NXRRSET < 0;},
q{DELETE FROM dns2pri_stats where NXRRSET < 0;},
q{DELETE FROM dns2sec_stats where NXRRSET < 0;},
q{DELETE FROM dns_stat where NXRRSET < 0;},

q{DELETE FROM dns1pri_stats where NXDOMAIN < 0;},
q{DELETE FROM dns1sec_stats where NXDOMAIN < 0;},
q{DELETE FROM dns2pri_stats where NXDOMAIN < 0;},
q{DELETE FROM dns2sec_stats where NXDOMAIN < 0;},
q{DELETE FROM dns_stat where NXDOMAIN < 0;},

q{DELETE FROM dns1pri_stats where RECURSION < 0;},
q{DELETE FROM dns1sec_stats where RECURSION < 0;},
q{DELETE FROM dns2pri_stats where RECURSION < 0;},
q{DELETE FROM dns2sec_stats where RECURSION < 0;},
q{DELETE FROM dns_stat where RECURSION < 0;},

q{DELETE FROM dns1pri_stats where FAILURE < 0;},
q{DELETE FROM dns1sec_stats where FAILURE < 0;},
q{DELETE FROM dns2pri_stats where FAILURE < 0;},
q{DELETE FROM dns2sec_stats where FAILURE < 0;},
q{DELETE FROM dns_stat where FAILURE < 0;},

q{DELETE FROM dns1pri_stats where SERVERFAIL < 0;},
q{DELETE FROM dns1sec_stats where SERVERFAIL < 0;},
q{DELETE FROM dns2pri_stats where SERVERFAIL < 0;},
q{DELETE FROM dns2sec_stats where SERVERFAIL < 0;},
q{DELETE FROM dns_stat where SERVERFAIL < 0;},

q{DELETE FROM dns1pri_stats where FORMERR < 0;},
q{DELETE FROM dns1sec_stats where FORMERR < 0;},
q{DELETE FROM dns2pri_stats where FORMERR < 0;},
q{DELETE FROM dns2sec_stats where FORMERR < 0;},
q{DELETE FROM dns_stat where FORMERR < 0;},

q{DELETE FROM dns1pri_stats where DROPPED < 0;},
q{DELETE FROM dns1sec_stats where DROPPED < 0;},
q{DELETE FROM dns2pri_stats where DROPPED < 0;},
q{DELETE FROM dns2sec_stats where DROPPED < 0;},
q{DELETE FROM dns_stat where DROPPED < 0;},



);

for (@sql) {
    my $sth = $dbh->prepare($_);
    $sth->execute or die $dbh->errstr;
    $sth->finish;
}
#my $sth = $dbh->prepare($q1)  or die "Prepare failed: " . $dbh->errstr();
#$sth->execute();
