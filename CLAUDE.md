# Perl のライブラリ Win32::Unicode の修正

Perl5.40 で動く Win32::Unicode の修正をしてほしい。
コードや仕様を理解した上で問題を解決していきましょう。

このライブラリは WIndows Vista自体に作られたライブラリであり、今回は
Windows11 で動かすことも目的としている。

## Bashについて

bashではなく、 代わりに`busybox64u`を使うようにしてください。

## Win32::Unicodeについて

Windows専用のライブラリで、Perlのファイル、ディレクトリ操作や標準入出力などの内部処理を
Unicode に変換するライブラリ。

コードはutf8で動かしており、Windows APIとのやりとりを Unicode のAPIで動くようにするためのもの。

Windows11 で動くことを想定している。

XSで実装されている。

## ディレクトリ構造

- lib/ Perlのモジュールコード
- xs/ XSコード
- t/ テストコード
- xt/ xs のテストコード


