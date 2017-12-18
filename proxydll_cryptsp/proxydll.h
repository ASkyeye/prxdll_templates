#pragma once

#define DLL_FNAME "\\cryptsp.dll"
#define EXPORT_NAMES \
        "CheckSignatureInFile", \
        "CryptAcquireContextA", \
        "CryptAcquireContextW", \
        "CryptContextAddRef", \
        "CryptCreateHash", \
        "CryptDecrypt", \
        "CryptDeriveKey", \
        "CryptDestroyHash", \
        "CryptDestroyKey", \
        "CryptDuplicateHash", \
        "CryptDuplicateKey", \
        "CryptEncrypt", \
        "CryptEnumProviderTypesA", \
        "CryptEnumProviderTypesW", \
        "CryptEnumProvidersA", \
        "CryptEnumProvidersW", \
        "CryptExportKey", \
        "CryptGenKey", \
        "CryptGenRandom", \
        "CryptGetDefaultProviderA", \
        "CryptGetDefaultProviderW", \
        "CryptGetHashParam", \
        "CryptGetKeyParam", \
        "CryptGetProvParam", \
        "CryptGetUserKey", \
        "CryptHashData", \
        "CryptHashSessionKey", \
        "CryptImportKey", \
        "CryptReleaseContext", \
        "CryptSetHashParam", \
        "CryptSetKeyParam", \
        "CryptSetProvParam", \
        "CryptSetProviderA", \
        "CryptSetProviderExA", \
        "CryptSetProviderExW", \
        "CryptSetProviderW", \
        "CryptSignHashA", \
        "CryptSignHashW", \
        "CryptVerifySignatureA", \
        "CryptVerifySignatureW", \
        "SystemFunction035"

bool real_dll_init(void);
bool real_dll_free(void);
FARPROC resolve_export_proc(size_t index);
