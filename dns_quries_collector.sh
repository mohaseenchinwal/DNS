# named.stats
# make a backup
STATS=/var/named/chroot/var/named/data/named_stats.txt
qpms=/root/elk/test-111.ksh
qpmf=/root/elk/dns1sec.txt
OUTPUT=/root/elk/out1.txt
OUTPUT2=/root/elk/out2.txt

/bin/cp -f $STATS $STATS.0
# nuke the original
/bin/cp -f /dev/null $STATS
/bin/cp -f /dev/null $OUTPUT
/bin/cp -f /dev/null $OUTPUT2

# generate bind overall stats
/usr/sbin/rndc stats

# awk recipe looks between "Incoming Queries" and "Outgoing Queries"

out=$(awk '
    BEGIN       {a=0;aaaa=0;any=0;cname=0;mx=0;ns=0;ptr=0;soa=0;srv=0;}
    /Incoming Queries/,/Outgoing Queries/ {
        if($2 == "A")     {a = $1}
        if($2 == "AAAA")  {aaaa = $1}
        if($2 == "ANY")   {any = $1}
        if($2 == "CNAME") {cname = $1}
        if($2 == "MX")    {mx = $1}
        if($2 == "NS")    {ns = $1}
        if($2 == "PTR")   {ptr = $1}
        if($2 == "SOA")   {soa = $1}
        if($2 == "SRV")   {srv = $1}
    }
    END         {print "a=" a " aaaa=" aaaa " any=" any " cname=" cname " mx=" mx " ns=" ns " ptr=" ptr " soa=" soa " srv=" srv}
' $STATS)

#for i in `echo $out | awk '{print $0}'`

#do
#echo $i >> $OUTPUT
#done


OUT=$(awk '
        BEGIN {total=0;success=0;referral=0;nxrrset=0;nxdomain=0;recursion=0;failure=0;servfail=0;formerr=0;dropped=0;}
        /Name Server Statistics/,/Zone Maintenance Statistics/ {
            if($0 ~ "IPv4 requests received")                   {total = $1}
            if($0 ~ "queries resulted in successful answer")    {success = $1}
            if($0 ~ "queries resulted in referral answer")      {referral = $1}
            if($0 ~ "queries resulted in nxrrset")              {nxrrset = $1}
            if($0 ~ "queries resulted in NXDOMAIN")             {nxdomain = $1}
            if($0 ~ "queries caused recursion")                 {recursion = $1}
            if($0 ~ "queries resulted in SERVFAIL")             {servfail = $1}
            if($0 ~ "queries resulted in FORMERR")              {formerr = $1}
            if($0 ~ "queries dropped")                          {dropped = $1}
            if($0 ~ "other query failures")                     {failure = $1}
        }
        END {print  " " total " "  success " " referral " " nxrrset " " nxdomain " " recursion " " failure " " servfail " " formerr " " dropped}
        ' $STATS)

for i in `echo $OUT | awk '{print $0}'`
do
echo $i >> $OUTPUT
done

/bin/cp -f /dev/null $STATS

#write delay program here

sleep 60

/usr/sbin/rndc stats

OUT2=$(awk '
        BEGIN {total=0;success=0;referral=0;nxrrset=0;nxdomain=0;recursion=0;failure=0;servfail=0;formerr=0;dropped=0;}
        /Name Server Statistics/,/Zone Maintenance Statistics/ {
            if($0 ~ "IPv4 requests received")                   {total = $1}
            if($0 ~ "queries resulted in successful answer")    {success = $1}
            if($0 ~ "queries resulted in referral answer")      {referral = $1}
            if($0 ~ "queries resulted in nxrrset")              {nxrrset = $1}
            if($0 ~ "queries resulted in NXDOMAIN")             {nxdomain = $1}
            if($0 ~ "queries caused recursion")                 {recursion = $1}
            if($0 ~ "queries resulted in SERVFAIL")             {servfail = $1}
            if($0 ~ "queries resulted in FORMERR")              {formerr = $1}
            if($0 ~ "queries dropped")                          {dropped = $1}
            if($0 ~ "other query failures")                     {failure = $1}
        }
        END {print " " total " " success " " referral " " nxrrset " " nxdomain " " recursion " " failure " " servfail " " formerr " " dropped}
        ' $STATS)



for i in `echo $OUT2 | awk '{print $0}'`
do
echo $i >> $OUTPUT2
done


FS=$'\r\n' GLOBIGNORE='*' command eval  'f1=($OUT)'
FS=$'\r\n' GLOBIGNORE='*' command eval  'f2=($OUT2)'

#for i in ${f1[@]}; do echo $i; done
#for i in ${f2[@]}; do echo $i; done

paste <(printf "%s\n" "${f2[@]}") <(printf "%s\n" "${f1[@]}") |

awk '{ print $1 - $2 }' > $qpmf

#`/usr/bin/bash $qpms >> $qpmf`

