IFNDEF x64
        .MODEL FLAT
        .SAFESEH SEH_handler
ENDIF

.CODE

IFNDEF x64
        proxydll_find_function PROTO STDCALL, arg1:WORD
ELSE
        EXTERN proxydll_find_function:PROC
ENDIF

EXPORT32 MACRO langtype:REQ, procname:REQ, ordinal:REQ
    .ERRE ordinal

    IFNDEF x64
        procname PROC langtype
            INVOKE proxydll_find_function, ordinal
            jmp dword ptr eax
        procname ENDP
    ENDIF
ENDM

EXPORT64 MACRO procname:REQ, ordinal:REQ
    .ERRE ordinal

    IFDEF x64
        procname PROC
                push rcx
                push rdx
                push r8
                push r9
                sub rsp, 28h
                mov rcx, ordinal
                call proxydll_find_function
                add rsp, 28h
                pop r9
                pop r8
                pop rdx
                pop rcx
                jmp qword ptr rax
        procname ENDP
    ENDIF
ENDM

EXPORT MACRO langtype:REQ, procname:REQ, ordinal1:REQ, ordinal2
    EXPORT32 langtype, procname, ordinal1
    
    IFB <ordinal2>
        EXPORT64 procname, ordinal1
    ELSE
        EXPORT64 procname, ordinal2
    ENDIF
ENDM

EXPORT STDCALL, Direct3DShaderValidatorCreate9, 1
EXPORT STDCALL, PSGPError, 2
EXPORT STDCALL, PSGPSampleTexture, 3
EXPORT STDCALL, D3DPERF_BeginEvent, 4
EXPORT STDCALL, D3DPERF_EndEvent, 5
EXPORT STDCALL, D3DPERF_GetStatus, 6
EXPORT STDCALL, D3DPERF_QueryRepeatFrame, 7
EXPORT STDCALL, D3DPERF_SetMarker, 8
EXPORT STDCALL, D3DPERF_SetOptions, 9
EXPORT STDCALL, D3DPERF_SetRegion, 10
EXPORT STDCALL, DebugSetLevel, 11
EXPORT STDCALL, DebugSetMute, 12
EXPORT STDCALL, Direct3DCreate9, 13
EXPORT STDCALL, Direct3DCreate9Ex, 14

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
