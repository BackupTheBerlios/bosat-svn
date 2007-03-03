#!/usr/bin/perl
use DBI;
my $dbh = DBI->connect('DBI:mysql:radius', 'root', 'zoolkhan')
                or die "Couldn't connect to database: " . DBI->errstr;
my $sth = $dbh->prepare('delete from radcheck where active <= current_date()-100 and active not like "0000-00-00"')
	 or die "Couldn't prepare statement: " . $dbh->errstr;
$sth->execute();
$dbh->disconnect;


