IFNDEF _M_X64
    .MODEL FLAT
ELSE
    INCLUDE ksamd64.inc
ENDIF

.CODE

IFNDEF _M_X64
    proxydll_find_function PROTO STDCALL, arg1:WORD
ELSE
    EXTERN proxydll_find_function:PROC
ENDIF

EXPORT32 MACRO langtype:REQ, procname:REQ, ordinal:REQ
    .ERRE ordinal

    IFNDEF _M_X64
        procname PROC langtype
            INVOKE proxydll_find_function, ordinal
            jmp eax
        procname ENDP
    ENDIF
ENDM

EXPORT64 MACRO procname:REQ, ordinal:REQ
    .ERRE ordinal

    IFDEF _M_X64
        procname PROC FRAME
            save_reg r9, 20h
            save_reg r8, 18h
            save_reg rdx, 10h
            save_reg rcx, 8
            alloc_stack 20h
            END_PROLOGUE
            
            mov rcx, ordinal
            call proxydll_find_function
            
            add rsp, 20h
            mov rcx, [rsp+8]
            mov rdx, [rsp+10h]
            mov r8, [rsp+18h]
            mov r9, [rsp+20h]

            BEGIN_EPILOGUE
            rex_jmp_reg rax
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

END
