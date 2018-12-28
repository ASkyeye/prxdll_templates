#include "pch.h"
#include "proxydll.h"

BOOL APIENTRY DllMain(HMODULE hModule,
        DWORD ul_reason_for_call,
        LPVOID lpReserved)
{
        switch ( ul_reason_for_call ) {
        case DLL_PROCESS_ATTACH:
                return proxydll_attach(hModule);
        case DLL_PROCESS_DETACH:
                if ( !lpReserved )
                        proxydll_detach();
                break;
        }
        return TRUE;
}
