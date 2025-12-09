
use v5.40;
use utf8;
use File::Find;
use Win32::Unicode '-native';


my $rootdir = q{C:\Users\toumasu\Documents\p5-win32-unicode\テスト};

find(sub {
    say $_;
}, $rootdir);