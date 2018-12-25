IFNDEF x64
        .MODEL FLAT, STDCALL
        .SAFESEH SEH_handler
ENDIF

.CODE

IFNDEF x64
        find_real_function PROTO STDCALL, arg1:WORD
ELSE
        EXTERN find_real_function:PROC
ENDIF

export MACRO name, x, y
IFNDEF x64 AND x NE 0
    name PROC
            INVOKE find_real_function, x
            test eax, eax
            jz bye
            jmp dword ptr eax
    bye:
            ret
    name ENDP
ELSEIFDEF x64 AND y NE 0
    name PROC
            push rcx
            push rdx
            push r8
            push r9
            sub rsp, 28h
            mov rcx, y
            call find_real_function
            add rsp, 28h
            pop r9
            pop r8
            pop rdx
            pop rcx
            test rax, rax
            jz bye
            jmp qword ptr rax
    bye:    
            ret
    name ENDP
ENDIF
ENDM

export CheckSignatureInFile, 1, 1
export CryptAcquireContextA, 2, 2
export CryptAcquireContextW, 3, 3
export CryptContextAddRef, 4, 4
export CryptCreateHash, 5, 5
export CryptDecrypt, 6, 6
export CryptDeriveKey, 7, 7
export CryptDestroyHash, 8, 8
export CryptDestroyKey, 9, 9
export CryptDuplicateHash, 10, 10
export CryptDuplicateKey, 11, 11
export CryptEncrypt, 12, 12
export CryptEnumProviderTypesA, 13, 13
export CryptEnumProviderTypesW, 14, 14
export CryptEnumProvidersA, 15, 15
export CryptEnumProvidersW, 16, 16
export CryptExportKey, 17, 17
export CryptGenKey, 18, 18
export CryptGenRandom, 19, 19
export CryptGetDefaultProviderA, 20, 20
export CryptGetDefaultProviderW, 21, 21
export CryptGetHashParam, 22, 22
export CryptGetKeyParam, 23, 23
export CryptGetProvParam, 24, 24
export CryptGetUserKey, 25, 25
export CryptHashData, 26, 26
export CryptHashSessionKey, 27, 27
export CryptImportKey, 28, 28
export CryptReleaseContext, 29, 29
export CryptSetHashParam, 30, 30
export CryptSetKeyParam, 31, 31
export CryptSetProvParam, 32, 32
export CryptSetProviderA, 33, 33
export CryptSetProviderExA, 34, 34
export CryptSetProviderExW, 35, 35
export CryptSetProviderW, 36, 36
export CryptSignHashA, 37, 37
export CryptSignHashW, 38, 38
export CryptVerifySignatureA, 39, 39
export CryptVerifySignatureW, 40, 40
export SystemFunction035, 41, 41

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
