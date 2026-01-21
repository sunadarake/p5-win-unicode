## Win32::Unicode

PerlでWindowsのUnicode APIを利用するためのモジュール。

## install

ビルドをする前に`gcc`などがStrawberry Perlのものかをチェックしておくこと。

そして、このプロジェクトをダウンロードしてインストールすること。

```bash
git clone git@github.com:sunadarake/p5-win-unicode.git
cd p5-win-unicode
perl Makefile.PL
gmake
gmake test
gmake install
```
