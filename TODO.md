perl Makefile.PL をやって make testを実行したところ、以下のようなエラーが発生した。

このモジュールを使えば、utf8で受け取った文字列は、　内部でWindowsAPIのUnicodeバージョンを使うことを期待できる。
しかし、テストは上手くいっていない。
試しに、普通のコードで使うと、期待通りUnicodeで文字が表示される。
テストコードを修正する方向で解決したい。

```
t/04_print.t ............. 1/?
#   Failed test at t/04_print.t line 14.
# STDOUT is:
#  I ﾃ｢ﾂ卍･ Perl
# not:
#  I 笙･ Perl
# as expected

#   Failed test at t/04_print.t line 15.
# STDOUT is:
# [ I ﾃ｢ﾂ卍･ Perl]
# not:
# [ I 笙･ Perl]
# as expected

#   Failed test at t/04_print.t line 16.
# STDOUT is:
#  I ﾃ｢ﾂ卍･ Perl
#
# not:
#  I 笙･ Perl
#
# as expected
# Looks like you failed 3 tests of 13.
```
