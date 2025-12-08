以下のエラーが発生したので、原因と解決策を考えてほしい。

PS C:\Users\toumasu\Documents\p5-win32-unicode> mingw32-make test
"C:\Strawberry\perl\bin\perl.exe" "-Iinc" -MExtUtils::Command::MM -e cp_nonempty -- Unicode.bs blib\arch\auto\Win32\Unicode\Unicode.bs 644
gcc -c  "-I." "-I." -std=c99 -DWIN32 -DWIN64 -DPERL_TEXTMODE_SCRIPTS -DMULTIPLICITY -DPERL_IMPLICIT_SYS -DUSE_PERLIO -D__USE_MINGW_ANSI_STDIO -fwrapv -fno-strict-aliasing -mms-bitfields -Wall -W -Wno-comment -O2   -DVERSION=\"0.38\" -DXS_VERSION=\"0.38\" -o xs/Dir.o  "-IC:\STRAWB~1\perl\lib\CORE"  -DUSE_PPPORT xs/Dir.c
In file included from C:\STRAWB~1\perl\lib\CORE/perl.h:6222,
                 from xs/Dir.xs:3:
                 xs/Dir.xs: In function 'XS_Win32__Unicode__Dir_find_first_file':
                 xs/Dir.xs:52:41: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
                    52 |         hv_stores(hv, "handle", newSVuv((DWORD)handle));
                          |                                         ^
                          C:\STRAWB~1\perl\lib\CORE/embed.h:293:86: note: in definition of macro 'hv_common_key_len'
                            293 | # define hv_common_key_len(a,b,c,d,e,f)         Perl_hv_common_key_len(aTHX_ a,b,c,d,e,f)
                                  |                                                                                      ^
                                  C:\STRAWB~1\perl\lib\CORE/hv.h:565:5: note: in expansion of macro 'hv_store'
                                    565 |     hv_store((hv), ASSERT_IS_LITERAL(key), (sizeof(key)-1), (val), 0)
                                          |     ^~~~~~~~
                                          xs/Dir.xs:52:9: note: in expansion of macro 'hv_stores'
                                             52 |         hv_stores(hv, "handle", newSVuv((DWORD)handle));
                                                   |         ^~~~~~~~~
                                                   xs/Dir.xs:52:33: note: in expansion of macro 'newSVuv'
                                                      52 |         hv_stores(hv, "handle", newSVuv((DWORD)handle));
                                                            |                                 ^~~~~~~
                                                            xs/Dir.xs:53:45: error: passing argument 2 of 'Perl_newSVpvn' from incompatible pointer type [-Wincompatible-pointer-types]
                                                               53 |         hv_stores(hv, "first", newSVpvn(info.cFileName, wcslen(info.cFileName) * sizeof(WCHAR)));
                                                                     |                                         ~~~~^~~~~~~~~~
                                                                           |                                             |
                                                                                 |                                             WCHAR * {aka short unsigned int *}
                                                                                 C:\STRAWB~1\perl\lib\CORE/embed.h:293:86: note: in definition of macro 'hv_common_key_len'
                                                                                   293 | # define hv_common_key_len(a,b,c,d,e,f)         Perl_hv_common_key_len(aTHX_ a,b,c,d,e,f)
                                                                                         |                                                                                      ^
                                                                                         C:\STRAWB~1\perl\lib\CORE/hv.h:565:5: note: in expansion of macro 'hv_store'
                                                                                           565 |     hv_store((hv), ASSERT_IS_LITERAL(key), (sizeof(key)-1), (val), 0)
                                                                                                 |     ^~~~~~~~
                                                                                                 xs/Dir.xs:53:9: note: in expansion of macro 'hv_stores'
                                                                                                    53 |         hv_stores(hv, "first", newSVpvn(info.cFileName, wcslen(info.cFileName) * sizeof(WCHAR)));
                                                                                                          |         ^~~~~~~~~
                                                                                                          xs/Dir.xs:53:32: note: in expansion of macro 'newSVpvn'
                                                                                                             53 |         hv_stores(hv, "first", newSVpvn(info.cFileName, wcslen(info.cFileName) * sizeof(WCHAR)));
                                                                                                                   |                                ^~~~~~~~
                                                                                                                   In file included from C:\STRAWB~1\perl\lib\CORE/perl.h:6183:
                                                                                                                   C:\STRAWB~1\perl\lib\CORE/proto.h:3048:40: note: expected 'const char * const' but argument is of type 'WCHAR *' {aka 'short unsigned int *'}
                                                                                                                    3048 | Perl_newSVpvn(pTHX_ const char * const buffer, const STRLEN len)
                                                                                                                          |                     ~~~~~~~~~~~~~~~~~~~^~~~~~
                                                                                                                          mingw32-make: *** [Makefile:382: xs/Dir.o] Error 1])''}'''')))"")'')))"")''))))))''))''})))"")]''))"")''))"")''))))))''))''))"")]''""""""""""""""
