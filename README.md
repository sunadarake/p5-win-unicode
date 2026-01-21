## Win32::Unicode

PerlでWindowsのUnicode APIを利用するためのモジュール。

## install

`perl Makefile.PL`の前に必要なモジュールをインストールする必要がある。
そのモジュールが何かは忘れたが、おそらく以下のものだろう。

```bash
cpanm Module::Install Module::Install::XSUtil Module::Install::AuthorTests Module::Install::Repository
```

そして、このプロジェクトをダウンロードする。

```bash
git clone git@github.com:sunadarake/p5-win-unicode.git
cd p5-win-unicode
perl Makefile.PL
gmake
gmake test
gmake install
```

## 現状の課題

print関係のtestが通らない。

## Original README.md

This is Perl module Win32::Unicode.

INSTALLATION

Win32::Unicode installation is straightforward. If your CPAN shell is set up,
you should just be able to do

    % cpan Win32::Unicode

Download it, unpack it, then build it as per the usual:

    % perl Makefile.PL
    % make && make test (or nmake && nmake test)

Then install it:

    % make install (or nmake install)

DOCUMENTATION

Win32::Unicode documentation is available as in POD. So you can do:

    % perldoc Win32::Unicode

to read the documentation online with your favorite pager.

xaicron
