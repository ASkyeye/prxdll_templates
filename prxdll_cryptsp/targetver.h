#pragma once

#include <winsdkver.h>

#ifdef  _WIN32_WINNT
#undef  _WIN32_WINNT
#endif

#define _WIN32_WINNT 0x0501

#include <sdkddkver.h>
