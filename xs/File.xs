#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <sys/stat.h>
#include <sys/types.h>
#include <windows.h>

#ifdef __CYGWIN__
    #define _STAT(file, st) stat(file, st)
    #define _UTIME(file, st) utime(file, st)
#else
    #define _STAT(file, st) _wstat(file, st)
    #define _UTIME(file, st) _wutime(file, st)
#endif

WINBASEAPI BOOL WINAPI GetFileSizeEx(HANDLE,PLARGE_INTEGER);


MODULE = Win32::Unicode::File   PACKAGE = Win32::Unicode::File

PROTOTYPES: DISABLE

HANDLE
create_file(WCHAR *filename, long amode, long smode, long opt, long attr)
    CODE:
        RETVAL = CreateFileW(
            filename,
            amode,
            smode,
            NULL,
            opt,
            attr,
            NULL
        );
    OUTPUT:
        RETVAL

void
win32_read_file(HANDLE handle, DWORD count)
    CODE:
        char  *ptr, *buff;
        bool  has_error = 0;
        DWORD len       = 0;

        Newxz(ptr, count + 1, char);
        buff = ptr;
        if (!ReadFile(handle, buff, count, &len, NULL)) {
            if (GetLastError() != NO_ERROR) {
                has_error = 1;
            }
            else {
                len = 0;
            }
        }
        buff[len] = '\0';

        ST(0) = has_error ? sv_2mortal(newSViv(-1)) : sv_2mortal(newSVuv(len));
        ST(1) = sv_2mortal(newSVpvn(buff, len));

        Safefree(ptr);
        XSRETURN(2);

SV *
win32_write_file(HANDLE handle, char *buff, DWORD size)
    CODE:
        bool has_error = 0;
        DWORD len;
        if (!WriteFile(handle, buff, size, &len, NULL)) {
            if (GetLastError() != NO_ERROR) {
                has_error = 1;
            }
            else {
                len = 0;
            }
        }

        RETVAL = has_error ? newSViv(-1) : newSVuv(len);
    OUTPUT:
        RETVAL

bool
win32_flush_file_buffers(HANDLE handle)
    CODE:
        RETVAL = FlushFileBuffers(handle);
    OUTPUT:
        RETVAL

bool
delete_file(WCHAR *filename)
    CODE:
        RETVAL = DeleteFileW(filename);
    OUTPUT:
        RETVAL

long
get_file_attributes(WCHAR *filename)
    CODE:
        RETVAL = GetFileAttributesW(filename);
    OUTPUT:
        RETVAL

void
get_file_size(HANDLE handle)
    CODE:
        LARGE_INTEGER st;
        HV* hv    = newHV();
        SV* hvref = sv_2mortal(newRV_noinc((SV *)hv));

        if (GetFileSizeEx(handle, &st) == 0) {
            XSRETURN_EMPTY;
        }

        hv_stores(hv, "high", newSVnv(st.HighPart));
        hv_stores(hv, "low", newSVnv(st.LowPart));

        ST(0) = hvref;
        XSRETURN(1);

bool
copy_file(WCHAR *from, WCHAR *to, bool over)
    CODE:
        RETVAL = CopyFileW(from, to, over);
    OUTPUT:
        RETVAL

bool
move_file(WCHAR *from, WCHAR *to)
    CODE:
        RETVAL = MoveFileW(from, to);
    OUTPUT:
        RETVAL

void
set_file_pointer(HANDLE handle, long lpos, long hpos, int whence)
    CODE:
        LARGE_INTEGER mv;
        LARGE_INTEGER st;
        HV* hv    = newHV();
        SV* hvref = sv_2mortal(newRV_noinc((SV *)hv));

        mv.LowPart  = lpos;
        mv.HighPart = hpos;

        if (SetFilePointerEx(handle, mv, &st, whence) == 0) {
            XSRETURN_EMPTY;
        }

        hv_stores(hv, "high", newSVnv(st.HighPart));
        hv_stores(hv, "low", newSVnv(st.LowPart));

        ST(0) = hvref;
        XSRETURN(1);

void
get_stat_data(WCHAR *filename, HANDLE handle, bool is_dir)
    CODE:
        struct _stat st;
        BY_HANDLE_FILE_INFORMATION fi;
        HV* hv    = newHV();
        SV* hvref = sv_2mortal(newRV_noinc((SV *)hv));
        HANDLE file_handle = handle;
        bool should_close = false;

        if (_STAT(filename, &st) != 0) {
            XSRETURN_EMPTY;
        }

        /* For directories, we need to open a proper file handle
         * because FindFirstFileW returns a search handle, not a file handle.
         * Windows Vista and later require FILE_FLAG_BACKUP_SEMANTICS to open directories.
         */
        if (is_dir) {
            file_handle = CreateFileW(
                filename,
                GENERIC_READ,
                FILE_SHARE_READ | FILE_SHARE_WRITE,
                NULL,
                OPEN_EXISTING,
                FILE_FLAG_BACKUP_SEMANTICS,
                NULL
            );
            if (file_handle == INVALID_HANDLE_VALUE) {
                XSRETURN_EMPTY;
            }
            should_close = true;
        }

        /* Get file information by handle for both files and directories */
        if (GetFileInformationByHandle(file_handle, &fi) == 0) {
            if (should_close) {
                CloseHandle(file_handle);
            }
            XSRETURN_EMPTY;
        }

        if (should_close) {
            CloseHandle(file_handle);
        }

        /* Use Windows API values for dev/ino instead of unreliable _stat values */
        hv_stores(hv, "dev", newSVuv(fi.dwVolumeSerialNumber));
        /* Combine high and low parts to create 64-bit inode number */
        hv_stores(hv, "ino", newSVuv(((UV)fi.nFileIndexHigh << 32) | fi.nFileIndexLow));
        hv_stores(hv, "mode", newSViv(st.st_mode));
        hv_stores(hv, "nlink", newSViv(st.st_nlink));
        hv_stores(hv, "uid", newSViv(st.st_uid));
        hv_stores(hv, "gid", newSViv(st.st_gid));
        /* rdev is not meaningful on Windows for regular files/directories */
        hv_stores(hv, "rdev", newSVuv(0));
        hv_stores(hv, "atime", newSViv(st.st_atime));
        hv_stores(hv, "mtime", newSViv(st.st_mtime));
        hv_stores(hv, "ctime", newSViv(st.st_ctime));
#ifdef __CYGWIN__
        hv_stores(hv, "blksize", newSViv(st.st_blksize));
        hv_stores(hv, "blocks", newSViv(st.st_blocks));
#endif
        hv_stores(hv, "size_high", newSVuv(fi.nFileSizeHigh));
        hv_stores(hv, "size_low", newSVuv(fi.nFileSizeLow));

        ST(0) = hvref;
        XSRETURN(1);

bool
lock_file(HANDLE handle, int ope)
    CODE:
        long option = 0;
        OVERLAPPED ol;
        ol.Offset = 0;
        ol.OffsetHigh = 0;

        switch(ope) {
            case 1:
                break;
            case 2:
                option = LOCKFILE_EXCLUSIVE_LOCK;
                break;
            case 5:
                option = LOCKFILE_FAIL_IMMEDIATELY;
                break;
            case 6:
                option = LOCKFILE_FAIL_IMMEDIATELY | LOCKFILE_EXCLUSIVE_LOCK;
                break;
            default:
                XSRETURN_EMPTY;
                break;
        }

        RETVAL = LockFileEx(handle, option, 0, 0xFFFFFFFF, 0xFFFFFFFF, &ol);
    OUTPUT:
        RETVAL

bool
unlock_file(HANDLE handle)
    CODE:
        OVERLAPPED ol;
        ol.Offset = 0;
        ol.OffsetHigh = 0;

        RETVAL = UnlockFileEx(handle, 0, 0xFFFFFFFF, 0xFFFFFFFF, &ol);
    OUTPUT:
        RETVAL

bool
update_time(long atime, long mtime, WCHAR *filename)
    CODE:
        struct _utimbuf ut;
        ut.actime  = atime;
        ut.modtime = mtime;

        if (_UTIME(filename, &ut) == -1) {
            XSRETURN_EMPTY;
        }

        RETVAL = 1;
    OUTPUT:
        RETVAL
