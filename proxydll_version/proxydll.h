#pragma once


#define DLL_FNAME "\\version.dll"
#define EXPORT_NAMES \
        "GetFileVersionInfoA", \
        "GetFileVersionInfoByHandle", \
        "GetFileVersionInfoExW", \
        "GetFileVersionInfoSizeA", \
        "GetFileVersionInfoSizeExW", \
        "GetFileVersionInfoSizeW", \
        "GetFileVersionInfoW", \
        "VerFindFileA", \
        "VerFindFileW", \
        "VerInstallFileA", \
        "VerInstallFileW", \
        "VerLanguageNameA", \
        "VerLanguageNameW", \
        "VerQueryValueA", \
        "VerQueryValueW"

bool real_dll_init(void);
bool real_dll_free(void);
FARPROC resolve_export_proc(size_t index);
