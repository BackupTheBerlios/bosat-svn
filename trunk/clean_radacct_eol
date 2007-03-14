#!/usr/bin/perl

# this script does clear readacct out of used accounts .
# this is just available over Freeradius on Mysql .


use strict;
use warnings;
use Mysql;

# add Mysql username,password,target host here
our $dbh = Mysql->connect('localhost', 'radius','root','');


my $sql_statement="select Username from radcheck;";
my $sth = $dbh->query($sql_statement)||die("db query: $sql_statement");
my @users = $sth->fetchcol;





foreach my $username (@users) {

$sql_statement="select Value from radcheck where  Username like '$username' and Attribute like 'Max-All-Session';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");
my $limit = $sth->fetchrow;

$sql_statement="select sum(AcctSessionTime) from radacct where  Username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");
my $used = $sth->fetchrow;

next unless $limit;
next unless $used;

if ($used >= $limit) {
    print "$username is overlimited (limit $limit) (used $used)\n";

$sql_statement="delete from radcheck where Username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");

$sql_statement="delete from usergroup where username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");

$sql_statement="delete from userinfo where username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");

$sql_statement="delete from radacct where username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");

$sql_statement="delete from radreply where username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");

$sql_statement="delete from totacct where username like '$username';";
$sth = $dbh->query($sql_statement)||die("db query: $sql_statement");


}};
