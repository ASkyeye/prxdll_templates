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

EXPORT STDCALL, D3DKMTCloseAdapter, 1
EXPORT STDCALL, D3DKMTDestroyAllocation, 2
EXPORT STDCALL, D3DKMTDestroyContext, 3
EXPORT STDCALL, D3DKMTDestroyDevice, 4
EXPORT STDCALL, D3DKMTDestroySynchronizationObject, 5
EXPORT STDCALL, D3DKMTQueryAdapterInfo, 6
EXPORT STDCALL, D3DKMTSetDisplayPrivateDriverFormat, 7
EXPORT STDCALL, D3DKMTSignalSynchronizationObject, 8
EXPORT STDCALL, D3DKMTUnlock, 9
EXPORT STDCALL, D3DKMTWaitForSynchronizationObject, 10
EXPORT STDCALL, EnableFeatureLevelUpgrade, 11
EXPORT STDCALL, OpenAdapter10, 12
EXPORT STDCALL, OpenAdapter10_2, 13
EXPORT STDCALL, D3D11CoreCreateDevice, 14
EXPORT STDCALL, D3D11CoreCreateLayeredDevice, 15
EXPORT STDCALL, D3D11CoreGetLayeredDeviceSize, 16
EXPORT STDCALL, D3D11CoreRegisterLayers, 17
EXPORT STDCALL, D3D11CreateDevice, 18
EXPORT STDCALL, D3D11CreateDeviceAndSwapChain, 19
EXPORT STDCALL, D3DKMTCreateAllocation, 20
EXPORT STDCALL, D3DKMTCreateContext, 21
EXPORT STDCALL, D3DKMTCreateDevice, 22
EXPORT STDCALL, D3DKMTCreateSynchronizationObject, 23
EXPORT STDCALL, D3DKMTEscape, 24
EXPORT STDCALL, D3DKMTGetContextSchedulingPriority, 25
EXPORT STDCALL, D3DKMTGetDeviceState, 26
EXPORT STDCALL, D3DKMTGetDisplayModeList, 27
EXPORT STDCALL, D3DKMTGetMultisampleMethodList, 28
EXPORT STDCALL, D3DKMTGetRuntimeData, 29
EXPORT STDCALL, D3DKMTGetSharedPrimaryHandle, 30
EXPORT STDCALL, D3DKMTLock, 31
EXPORT STDCALL, D3DKMTOpenAdapterFromHdc, 32
EXPORT STDCALL, D3DKMTOpenResource, 33
EXPORT STDCALL, D3DKMTPresent, 34
EXPORT STDCALL, D3DKMTQueryAllocationResidency, 35
EXPORT STDCALL, D3DKMTQueryResourceInfo, 36
EXPORT STDCALL, D3DKMTRender, 37
EXPORT STDCALL, D3DKMTSetAllocationPriority, 38
EXPORT STDCALL, D3DKMTSetContextSchedulingPriority, 39
EXPORT STDCALL, D3DKMTSetDisplayMode, 40
EXPORT STDCALL, D3DKMTSetGammaRamp, 41
EXPORT STDCALL, D3DKMTSetVidPnSourceOwner, 42
EXPORT STDCALL, D3DKMTWaitForVerticalBlankEvent, 43
EXPORT STDCALL, D3DPerformance_BeginEvent, 44
EXPORT STDCALL, D3DPerformance_EndEvent, 45
EXPORT STDCALL, D3DPerformance_GetStatus, 46
EXPORT STDCALL, D3DPerformance_SetMarker, 47

END
