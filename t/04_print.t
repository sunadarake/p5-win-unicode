use strict;
use warnings;
use utf8;
use Test::More;
use Test::Exception;
use Encode qw(decode_utf8);
use Win32::Unicode;
use File::Spec;

# Helper to capture STDOUT with proper UTF-8 handling
sub capture_stdout(&) {
    my $code = shift;
    open my $old_stdout, '>&', STDOUT or die "Cannot dup STDOUT: $!";
    my $output = '';
    close STDOUT;
    open STDOUT, '>', \$output or die "Cannot redirect STDOUT: $!";
    eval { $code->() };
    my $error = $@;
    close STDOUT;
    open STDOUT, '>&', $old_stdout or die "Cannot restore STDOUT: $!";
    close $old_stdout;
    die $error if $error;
    return decode_utf8($output);
}

# Helper to capture STDERR with proper UTF-8 handling
sub capture_stderr(&) {
    my $code = shift;
    open my $old_stderr, '>&', STDERR or die "Cannot dup STDERR: $!";
    my $output = '';
    close STDERR;
    open STDERR, '>', \$output or die "Cannot redirect STDERR: $!";
    eval { $code->() };
    my $error = $@;
    close STDERR;
    open STDERR, '>&', $old_stderr or die "Cannot restore STDERR: $!";
    close $old_stderr;
    return decode_utf8($output);
}

my $str = "I 💛 Perl";

is capture_stdout { printW($str) }, $str, 'printW outputs correctly';
is capture_stdout { printfW( "[%s]", $str ) }, "[$str]",
  'printfW outputs correctly';
is capture_stdout { sayW($str) }, "$str\n", 'sayW outputs correctly';

like capture_stderr { printW undef }, qr/uninitialized/,
  'printW warns on undef';
like capture_stderr { printfW undef }, qr/uninitialized/,
  'printfW warns on undef';
like capture_stderr { warnW undef }, qr/uninitialized/, 'warnW warns on undef';

{
    open my $old_stderr, '>&', STDERR              or die $!;
    open STDERR,         '>',  File::Spec->devnull or die $!;
    ok warnW($str), "warnW";
    open STDERR, '>&', $old_stderr or die $!;
    close $old_stderr;
}
dies_ok { dieW($str) } "dieW";

is capture_stdout { printW STDOUT $str }, $str, 'printW with STDOUT handle';
is capture_stdout { printfW STDOUT "[%s]", $str }, "[$str]",
  'printfW with STDOUT handle';
is capture_stdout { sayW STDOUT $str }, "$str\n", 'sayW with STDOUT handle';

throws_ok { printW STDOUT,  $str } qr/No comma allowed after filehandle/;
throws_ok { printfW STDOUT, $str } qr/No comma allowed after filehandle/;

done_testing;
