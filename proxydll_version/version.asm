IFNDEF x64
        .MODEL FLAT, STDCALL
        .SAFESEH SEH_handler
ENDIF

.CODE

IFNDEF x64
        proxydll_find_function PROTO STDCALL, arg1:WORD
ELSE
        EXTERN proxydll_find_function:PROC
ENDIF

export MACRO name, x, y
IFNDEF x64 AND x NE 0
    name PROC
            INVOKE proxydll_find_function, x
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
            call proxydll_find_function
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

export GetFileVersionInfoA, 1, 1
export GetFileVersionInfoByHandle, 2, 2
export GetFileVersionInfoExW, 3, 3
export GetFileVersionInfoSizeA, 4, 4
export GetFileVersionInfoSizeExW, 5, 5
export GetFileVersionInfoSizeW, 6, 6
export GetFileVersionInfoW, 7, 7
export VerFindFileA, 8, 8
export VerFindFileW, 9, 9
export VerInstallFileA, 10, 10
export VerInstallFileW, 11, 11
export VerLanguageNameA, 12, 12
export VerLanguageNameW, 13, 13
export VerQueryValueA, 14, 14
export VerQueryValueW, 15, 15

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
