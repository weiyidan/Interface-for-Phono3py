#!/usr/bin/perl
use File::Copy;
use Cwd;

#################################################################
#								#
#								#
#	Written by Yidan Wei Ques. 2729185553@qq.com		#
#								#
#								#
#################################################################


#for ( 1..100 ) {$num=(sprintf "%05d", $_);print "$num\n";}


$line = <STDIN>;
chomp($line);
print "The number is $line.\n";

for($number=1;$number<$line+1;$number++)
{
	$name = (sprintf "%05d", $number);
	mkdir $name;
		print "dir = $name\n";
	$file = "POSCAR-$name";
		print "file = $file\n";
	move ($file,$name);
	copy (INCAR,$name);
	copy (KPOINTS,$name);
	copy (POTCAR,$name);
#	copy ('hello.sh',$name);
	copy ('job-vasp-hemera.sh',$name);
	my $dir = getcwd;
		print "Parent path = $dir\n";
	chdir ($name);
	my $dir = getcwd;
		print "Subdirectory path = $dir\n";
	move $file,POSCAR;
	#sbatch job-vasp-hemera.sh
	system("sbatch job-vasp-hemera.sh");
#	system("./hello");
	chdir('./../');
	my $dir = getcwd;
		print "Parent path = $dir\n";
}


