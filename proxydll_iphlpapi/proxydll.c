#include "pch.h"
#include "proxydll.h"

static PIMAGE_DOS_HEADER g_pImageBase;
static PIMAGE_EXPORT_DIRECTORY g_pExportDirectory;
static HMODULE g_hModule;
static PVOID *g_pPointers;

PVOID __stdcall proxydll_find_function(WORD wOrdinal)
{
        TCHAR Path[MAX_PATH];
        HMODULE hModule;
        DWORD Base;
        DWORD Index;
        DWORD Count;
        PVOID temp;
        LPCSTR ModuleName;
        PVOID Result;
        DWORD *Names;
        WORD *NameOrdinals;
        LPCSTR ProcName;
        WORD NameOrdinal;

        if ( !wOrdinal )
                return NULL;

        Base = g_pExportDirectory->Base;
        Index = wOrdinal - Base;
        if ( Index >= g_pExportDirectory->NumberOfFunctions )
                return NULL;

        if ( !(hModule = InterlockedCompareExchangePointer(&(PVOID)g_hModule, NULL, NULL)) ) {
                ModuleName = OffsetToPointer(g_pImageBase, g_pExportDirectory->Name);
                Count = GetSystemDirectory(Path, _countof(Path));

                if ( FAILED(StringCchPrintf(Path + Count, _countof(Path) - Count, _T("\\%hs"), ModuleName))
                        || !(hModule = LoadLibraryEx(Path, NULL, 0)) ) {

                        return NULL;
                }

                if ( temp = InterlockedCompareExchangePointer(&(PVOID)g_hModule, hModule, NULL) ) {
                        FreeLibrary(hModule);
                        hModule = temp;
                }
        }

        if ( !(Result = InterlockedCompareExchangePointer(&g_pPointers[Index], NULL, NULL)) ) {
                NameOrdinals = OffsetToPointer(g_pImageBase,
                        g_pExportDirectory->AddressOfNameOrdinals);
                Names = OffsetToPointer(g_pImageBase,
                        g_pExportDirectory->AddressOfNames);
                ProcName = MAKEINTRESOURCEA(wOrdinal);

                for ( DWORD i = 0; i < g_pExportDirectory->NumberOfNames; ++i ) {
                        NameOrdinal = Base + NameOrdinals[i];
                        if ( wOrdinal < NameOrdinal )
                                continue;
                        else if ( wOrdinal == NameOrdinal )
                                ProcName = OffsetToPointer(g_pImageBase, Names[i]);
                        break;
                }
                if ( (Result = GetProcAddress(hModule, ProcName))
                        && (temp = InterlockedCompareExchangePointer(&g_pPointers[Index], Result, NULL)) )
                        Result = temp;
        }
        return Result;
}

// call this exactly once in the DllMain DLL_PROCESS_ATTACH handler
bool __stdcall proxydll_attach(HMODULE hModule)
{
        PIMAGE_NT_HEADERS pNtHeader;

        g_pImageBase = (PIMAGE_DOS_HEADER)hModule;
        if ( g_pImageBase->e_magic != IMAGE_DOS_SIGNATURE )
                return false;

        pNtHeader = OffsetToPointer(g_pImageBase, g_pImageBase->e_lfanew);
        if ( pNtHeader->Signature != IMAGE_NT_SIGNATURE
                || pNtHeader->OptionalHeader.Magic != IMAGE_NT_OPTIONAL_HDR_MAGIC )
                return false;

        g_pExportDirectory = OffsetToPointer(g_pImageBase,
                pNtHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

        if ( !(g_pPointers = calloc(g_pExportDirectory->NumberOfFunctions, sizeof *g_pPointers)) )
                return false;

        return true;
}

// call this exactly once in the DllMain DLL_PROCESS_DETACH handler
void __stdcall proxydll_detach(void)
{
        FreeLibrary(g_hModule);
        free(g_pPointers);
}
