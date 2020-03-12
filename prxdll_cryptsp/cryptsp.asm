ifndef _M_X64
    .model flat
else
    include ksamd64.inc
endif

ifndef _M_X64
    prx_find_function proto stdcall, arg1:word, arg2:dword
else
    extern prx_find_function:proc
endif

PRX_EXPORT32 macro langtype:req, procname:req, ordinal:req
    .erre ordinal

    ifndef _M_X64
        .data
        procname&_ptr dd 0

        .code
        procname proc langtype
            mov eax, procname&_ptr
            test eax, eax
            jnz skip_find
                invoke prx_find_function, ordinal, offset procname&_ptr

        skip_find:
            jmp eax
        procname endp
    endif
endm

PRX_EXPORT64 macro procname:req, ordinal:req
    .erre ordinal

    ifdef _M_X64
        .data
        procname&_ptr dq 0

        .code
        procname proc frame
            save_reg r9, 20h
            save_reg r8, 18h
            save_reg rdx, 10h
            save_reg rcx, 8
            alloc_stack 28h
            END_PROLOGUE
            
            mov rax, procname&_ptr
            test rax, rax
            jnz skip_find
                mov rcx, ordinal
                mov rdx, offset procname&_ptr
                call prx_find_function

        skip_find:
            add rsp, 28h
            mov rcx, [rsp + 8]
            mov rdx, [rsp + 10h]
            mov r8, [rsp + 18h]
            mov r9, [rsp + 20h]
            
            BEGIN_EPILOGUE
            rex_jmp_reg rax
        procname endp
    endif
endm

PRX_EXPORT macro langtype:req, procname:req, ordinal1:req, ordinal2
    PRX_EXPORT32 langtype, procname, ordinal1
    
    ifb <ordinal2>
        PRX_EXPORT64 procname, ordinal1
    else
        PRX_EXPORT64 procname, ordinal2
    endif
endm

PRX_EXPORT stdcall, CheckSignatureInFile, 1
PRX_EXPORT stdcall, CryptAcquireContextA, 2
PRX_EXPORT stdcall, CryptAcquireContextW, 3
PRX_EXPORT stdcall, CryptContextAddRef, 4
PRX_EXPORT stdcall, CryptCreateHash, 5
PRX_EXPORT stdcall, CryptDecrypt, 6
PRX_EXPORT stdcall, CryptDeriveKey, 7
PRX_EXPORT stdcall, CryptDestroyHash, 8
PRX_EXPORT stdcall, CryptDestroyKey, 9
PRX_EXPORT stdcall, CryptDuplicateHash, 10
PRX_EXPORT stdcall, CryptDuplicateKey, 11
PRX_EXPORT stdcall, CryptEncrypt, 12
PRX_EXPORT stdcall, CryptEnumProviderTypesA, 13
PRX_EXPORT stdcall, CryptEnumProviderTypesW, 14
PRX_EXPORT stdcall, CryptEnumProvidersA, 15
PRX_EXPORT stdcall, CryptEnumProvidersW, 16
PRX_EXPORT stdcall, CryptExportKey, 17
PRX_EXPORT stdcall, CryptGenKey, 18
PRX_EXPORT stdcall, CryptGenRandom, 19
PRX_EXPORT stdcall, CryptGetDefaultProviderA, 20
PRX_EXPORT stdcall, CryptGetDefaultProviderW, 21
PRX_EXPORT stdcall, CryptGetHashParam, 22
PRX_EXPORT stdcall, CryptGetKeyParam, 23
PRX_EXPORT stdcall, CryptGetProvParam, 24
PRX_EXPORT stdcall, CryptGetUserKey, 25
PRX_EXPORT stdcall, CryptHashData, 26
PRX_EXPORT stdcall, CryptHashSessionKey, 27
PRX_EXPORT stdcall, CryptImportKey, 28
PRX_EXPORT stdcall, CryptReleaseContext, 29
PRX_EXPORT stdcall, CryptSetHashParam, 30
PRX_EXPORT stdcall, CryptSetKeyParam, 31
PRX_EXPORT stdcall, CryptSetProvParam, 32
PRX_EXPORT stdcall, CryptSetProviderA, 33
PRX_EXPORT stdcall, CryptSetProviderExA, 34
PRX_EXPORT stdcall, CryptSetProviderExW, 35
PRX_EXPORT stdcall, CryptSetProviderW, 36
PRX_EXPORT stdcall, CryptSignHashA, 37
PRX_EXPORT stdcall, CryptSignHashW, 38
PRX_EXPORT stdcall, CryptVerifySignatureA, 39
PRX_EXPORT stdcall, CryptVerifySignatureW, 40
PRX_EXPORT stdcall, SystemFunction035, 41

end
