#include "pch.h"
#include "proxydll.h"

static HMODULE g_hModule;

FARPROC __stdcall find_real_function(WORD wOrdinal)
{
        TCHAR Path[MAX_PATH];
        HMODULE hModule;
        PIMAGE_DOS_HEADER pDosHeader;
        PIMAGE_NT_HEADERS pNtHeader;
        PIMAGE_EXPORT_DIRECTORY pExportDirectory;
        DWORD Count;
        HMODULE temp;
        LPCSTR ModuleName;
        DWORD *Names;
        WORD *NameOrdinals;
        LPCSTR ProcName;

        if ( !wOrdinal )
                return NULL;

        pDosHeader = (PIMAGE_DOS_HEADER)&__ImageBase;
        if ( pDosHeader->e_magic != IMAGE_DOS_SIGNATURE )
                return NULL;

        pNtHeader = OffsetToPointer(pDosHeader, pDosHeader->e_lfanew);
        pExportDirectory = OffsetToPointer(pDosHeader,
                pNtHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

        if ( wOrdinal - pExportDirectory->Base >= pExportDirectory->NumberOfFunctions )
                return NULL;

        if ( !(hModule = InterlockedCompareExchangePointer(&(PVOID)g_hModule, NULL, NULL)) ) {
                ModuleName = OffsetToPointer(pDosHeader, pExportDirectory->Name);
                Count = GetSystemDirectory(Path, _countof(Path));
                if ( _stprintf_s(Path + Count, _countof(Path) - Count, _T("\\%hs"), ModuleName) == -1
                        || !(hModule = LoadLibraryEx(Path, NULL, 0)) ) {

                        return NULL;
                }

                if ( temp = InterlockedCompareExchangePointer(&(PVOID)g_hModule, hModule, NULL) ) {
                        FreeLibrary(hModule);
                        hModule = temp;
                }
        }

        NameOrdinals = OffsetToPointer(pDosHeader,
                pExportDirectory->AddressOfNameOrdinals);
        Names = OffsetToPointer(pDosHeader,
                pExportDirectory->AddressOfNames);
        ProcName = MAKEINTRESOURCEA(wOrdinal);

        for ( DWORD i = 0; i < pExportDirectory->NumberOfNames; ++i ) {
                if ( wOrdinal != pExportDirectory->Base + NameOrdinals[i] )
                        continue;

                return GetProcAddress(hModule,
                        OffsetToPointer(pDosHeader, Names[i]));
        }
        return GetProcAddress(hModule, MAKEINTRESOURCEA(wOrdinal));
}

void __stdcall free_real_dll(void)
{
        HMODULE hModule;

        if ( hModule = InterlockedExchangePointer(&(PVOID)g_hModule, NULL) )
                FreeLibrary(hModule);
}
