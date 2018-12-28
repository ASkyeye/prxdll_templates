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

EXPORT STDCALL, WTSCloseServer, 1
EXPORT STDCALL, WTSConnectSessionA, 2
EXPORT STDCALL, WTSConnectSessionW, 3
EXPORT STDCALL, WTSCreateListenerA, 4
EXPORT STDCALL, WTSCreateListenerW, 5
EXPORT STDCALL, WTSDisconnectSession, 6
EXPORT STDCALL, WTSEnumerateListenersA, 7
EXPORT STDCALL, WTSEnumerateListenersW, 8
EXPORT STDCALL, WTSEnumerateProcessesA, 9
EXPORT STDCALL, WTSEnumerateProcessesExA, 10
EXPORT STDCALL, WTSEnumerateProcessesExW, 11
EXPORT STDCALL, WTSEnumerateProcessesW, 12
EXPORT STDCALL, WTSEnumerateServersA, 13
EXPORT STDCALL, WTSEnumerateServersW, 14
EXPORT STDCALL, WTSEnumerateSessionsA, 15
EXPORT STDCALL, WTSEnumerateSessionsExA, 16
EXPORT STDCALL, WTSEnumerateSessionsExW, 17
EXPORT STDCALL, WTSEnumerateSessionsW, 18
EXPORT STDCALL, WTSFreeMemory, 19
EXPORT STDCALL, WTSFreeMemoryExA, 20
EXPORT STDCALL, WTSFreeMemoryExW, 21
EXPORT STDCALL, WTSGetListenerSecurityA, 22
EXPORT STDCALL, WTSGetListenerSecurityW, 23
EXPORT STDCALL, WTSLogoffSession, 24
EXPORT STDCALL, WTSOpenServerA, 25
EXPORT STDCALL, WTSOpenServerExA, 26
EXPORT STDCALL, WTSOpenServerExW, 27
EXPORT STDCALL, WTSOpenServerW, 28
EXPORT STDCALL, WTSQueryListenerConfigA, 29
EXPORT STDCALL, WTSQueryListenerConfigW, 30
EXPORT STDCALL, WTSQuerySessionInformationA, 31
EXPORT STDCALL, WTSQuerySessionInformationW, 32
EXPORT STDCALL, WTSQueryUserConfigA, 33
EXPORT STDCALL, WTSQueryUserConfigW, 34
EXPORT STDCALL, WTSQueryUserToken, 35
EXPORT STDCALL, WTSRegisterSessionNotification, 36
EXPORT STDCALL, WTSRegisterSessionNotificationEx, 37
EXPORT STDCALL, WTSSendMessageA, 38
EXPORT STDCALL, WTSSendMessageW, 39
EXPORT STDCALL, WTSSetListenerSecurityA, 40
EXPORT STDCALL, WTSSetListenerSecurityW, 41
EXPORT STDCALL, WTSSetSessionInformationA, 42
EXPORT STDCALL, WTSSetSessionInformationW, 43
EXPORT STDCALL, WTSSetUserConfigA, 44
EXPORT STDCALL, WTSSetUserConfigW, 45
EXPORT STDCALL, WTSShutdownSystem, 46
EXPORT STDCALL, WTSStartRemoteControlSessionA, 47
EXPORT STDCALL, WTSStartRemoteControlSessionW, 48
EXPORT STDCALL, WTSStopRemoteControlSession, 49
EXPORT STDCALL, WTSTerminateProcess, 50
EXPORT STDCALL, WTSUnRegisterSessionNotification, 51
EXPORT STDCALL, WTSUnRegisterSessionNotificationEx, 52
EXPORT STDCALL, WTSVirtualChannelClose, 53
EXPORT STDCALL, WTSVirtualChannelOpen, 54
EXPORT STDCALL, WTSVirtualChannelOpenEx, 55
EXPORT STDCALL, WTSVirtualChannelPurgeInput, 56
EXPORT STDCALL, WTSVirtualChannelPurgeOutput, 57
EXPORT STDCALL, WTSVirtualChannelQuery, 58
EXPORT STDCALL, WTSVirtualChannelRead, 59
EXPORT STDCALL, WTSVirtualChannelWrite, 60
EXPORT STDCALL, WTSWaitSystemEvent, 61

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
