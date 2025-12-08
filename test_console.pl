use strict;
use warnings;
use utf8;
use lib 'lib';
use Win32::Unicode::XS;
use Win32::Unicode::Constant;

my $handle = Win32::Unicode::Console::get_std_handle(STD_OUTPUT_HANDLE);
my $is_console = Win32::Unicode::Console::is_console($handle);

print "STDOUT handle: $handle\n";
print "Is console: $is_console\n";
print "Output is redirected: ", (-t STDOUT ? "NO" : "YES"), "\n";

# Test UTF-8 output
use Encode;
my $str = " I \x{2665} Perl";
print "UTF-8 string (raw): $str\n";
print "UTF-8 string bytes: ", unpack("H*", Encode::encode('UTF-8', $str)), "\n";
