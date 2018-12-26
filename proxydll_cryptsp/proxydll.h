#pragma once

PVOID __stdcall proxydll_find_function(WORD wOrdinal);
bool __stdcall proxydll_attach(HMODULE hModule);
void __stdcall proxydll_detach(void);
