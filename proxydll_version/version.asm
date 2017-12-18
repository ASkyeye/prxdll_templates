ifndef x64
    .model flat, stdcall
	.safeseh SEH_handler
endif

.code

ifndef x64
    resolve_export_proc proto C, arg1:dword
else
    extern resolve_export_proc:proc
endif

M_EXPORT_PROC macro export, index
export proc
ifndef x64
    invoke resolve_export_proc, index
    jmp dword ptr eax
else
    push rcx
    push rdx
    push r8
    push r9
    sub rsp, 28h
if index eq 0
    xor rcx, rcx
else
    mov rcx, index
endif
    call resolve_export_proc
    add rsp, 28h
    pop r9
    pop r8
    pop rdx
    pop rcx
    jmp qword ptr rax
endif
export endp
endm

M_EXPORT_PROC GetFileVersionInfoA, 0
M_EXPORT_PROC GetFileVersionInfoByHandle, 1
M_EXPORT_PROC GetFileVersionInfoExW, 2
M_EXPORT_PROC GetFileVersionInfoSizeA, 3
M_EXPORT_PROC GetFileVersionInfoSizeExW, 4
M_EXPORT_PROC GetFileVersionInfoSizeW, 5
M_EXPORT_PROC GetFileVersionInfoW, 6
M_EXPORT_PROC VerFindFileA, 7
M_EXPORT_PROC VerFindFileW, 8
M_EXPORT_PROC VerInstallFileA, 9
M_EXPORT_PROC VerInstallFileW, 10
M_EXPORT_PROC VerLanguageNameA, 11
M_EXPORT_PROC VerLanguageNameW, 12
M_EXPORT_PROC VerQueryValueA, 13
M_EXPORT_PROC VerQueryValueW, 14

SEH_handler   proc
	; empty handler
	ret
SEH_handler   endp

end
