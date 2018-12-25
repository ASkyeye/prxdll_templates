#include "targetver.h"

#define WIN32_LEAN_AND_MEAN
// Windows Header Files:
#include <windows.h>
#include <tchar.h>

// standard library headers
#include <stdlib.h>
#include <stdbool.h>

// reference additional headers your program requires here


extern IMAGE_DOS_HEADER __ImageBase;
#define OffsetToPointer(Base, Offset) ((PVOID)(((PBYTE)(Base)) + ((UINT_PTR)(Offset))))
#define PointerToOffset(Base, Pointer) ((INT_PTR)(((PBYTE)(Pointer)) - ((PBYTE)(Base))))
