"C:\Strawberry\perl\bin\perl.exe" "-Iinc" -MExtUtils::Command::MM -e cp_nonempty -- Unicode.bs blib\arch\auto\Win32\Unicode\Unicode.bs 644
"C:\Strawberry\perl\bin\perl.exe" "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness(0, 'inc', 'blib\lib', 'blib\arch')" t/*.t xt/*.t
t/00_compile.t ........... 
Dubious, test returned 1 (wstat 256, 0x100)
Failed 1/1 subtests 
t/01_load.t .............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/02_export.t ............ 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/03_encode.t ............ 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/04_print.t ............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/05_write.t ............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/06_dir_functions.t ..... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/06_dir_methods.t ....... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/06_dir_tree.t .......... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/07_file.t .............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/08_error.t ............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/09_normalize.t ......... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/10_read.t .............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/10_read_with_offset.t .. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/11_write.t ............. 
Dubious, test returned 2 (wstat 512, 0x200)
No subtests run 
t/12_syswrite.t .......... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/13_system.t ............ 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/15_flock.t ............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/15_flock_win32.t ....... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/16_io_handle_like.t .... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/17_slurp.t ............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/30_native.t ............ 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/31_native_import.t ..... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/32_native_file.t ....... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/33_native_dir.t ........ 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
t/34_args.t .............. 
Dubious, test returned 2 (wstat 512, 0x200)
Failed 1/1 subtests 
t/50_util.t .............. 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
xt/01_podspell.t ......... skipped: Test requires module 'Test::Spelling' but it's not found
xt/02_perlcritic.t ....... skipped: Test::Perl::Critic is not installed.
xt/03_pod.t .............. ok
xt/04_threads.t .......... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 
xt/10_text_csv.t ......... 
Dubious, test returned 1 (wstat 256, 0x100)
No subtests run 

Test Summary Report
-------------------
t/00_compile.t         (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: Bad plan.  You planned 1 tests but ran 0.
t/01_load.t            (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/02_export.t          (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/03_encode.t          (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/04_print.t           (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/05_write.t           (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/06_dir_functions.t   (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/06_dir_methods.t     (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/06_dir_tree.t        (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/07_file.t            (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/08_error.t           (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/09_normalize.t       (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/10_read.t            (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/10_read_with_offset.t (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/11_write.t           (Wstat: 512 (exited 2) Tests: 0 Failed: 0)
  Non-zero exit status: 2
  Parse errors: No plan found in TAP output
t/12_syswrite.t        (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/13_system.t          (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/15_flock.t           (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/15_flock_win32.t     (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/16_io_handle_like.t  (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/17_slurp.t           (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/30_native.t          (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/31_native_import.t   (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/32_native_file.t     (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/33_native_dir.t      (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
t/34_args.t            (Wstat: 512 (exited 2) Tests: 1 Failed: 1)
  Failed test:  1
  Non-zero exit status: 2
  Parse errors: No plan found in TAP output
t/50_util.t            (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
xt/04_threads.t        (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
xt/10_text_csv.t       (Wstat: 256 (exited 1) Tests: 0 Failed: 0)
  Non-zero exit status: 1
  Parse errors: No plan found in TAP output
Files=32, Tests=11,  7 wallclock secs ( 0.11 usr +  0.08 sys =  0.19 CPU)
Result: FAIL
