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

export WTSCloseServer, 1, 1
export WTSConnectSessionA, 2, 2
export WTSConnectSessionW, 3, 3
export WTSCreateListenerA, 4, 4
export WTSCreateListenerW, 5, 5
export WTSDisconnectSession, 6, 6
export WTSEnumerateListenersA, 7, 7
export WTSEnumerateListenersW, 8, 8
export WTSEnumerateProcessesA, 9, 9
export WTSEnumerateProcessesExA, 10, 10
export WTSEnumerateProcessesExW, 11, 11
export WTSEnumerateProcessesW, 12, 12
export WTSEnumerateServersA, 13, 13
export WTSEnumerateServersW, 14, 14
export WTSEnumerateSessionsA, 15, 15
export WTSEnumerateSessionsExA, 16, 16
export WTSEnumerateSessionsExW, 17, 17
export WTSEnumerateSessionsW, 18, 18
export WTSFreeMemory, 19, 19
export WTSFreeMemoryExA, 20, 20
export WTSFreeMemoryExW, 21, 21
export WTSGetListenerSecurityA, 22, 22
export WTSGetListenerSecurityW, 23, 23
export WTSLogoffSession, 24, 24
export WTSOpenServerA, 25, 25
export WTSOpenServerExA, 26, 26
export WTSOpenServerExW, 27, 27
export WTSOpenServerW, 28, 28
export WTSQueryListenerConfigA, 29, 29
export WTSQueryListenerConfigW, 30, 30
export WTSQuerySessionInformationA, 31, 31
export WTSQuerySessionInformationW, 32, 32
export WTSQueryUserConfigA, 33, 33
export WTSQueryUserConfigW, 34, 34
export WTSQueryUserToken, 35, 35
export WTSRegisterSessionNotification, 36, 36
export WTSRegisterSessionNotificationEx, 37, 37
export WTSSendMessageA, 38, 38
export WTSSendMessageW, 39, 39
export WTSSetListenerSecurityA, 40, 40
export WTSSetListenerSecurityW, 41, 41
export WTSSetSessionInformationA, 42, 42
export WTSSetSessionInformationW, 43, 43
export WTSSetUserConfigA, 44, 44
export WTSSetUserConfigW, 45, 45
export WTSShutdownSystem, 46, 46
export WTSStartRemoteControlSessionA, 47, 47
export WTSStartRemoteControlSessionW, 48, 48
export WTSStopRemoteControlSession, 49, 49
export WTSTerminateProcess, 50, 50
export WTSUnRegisterSessionNotification, 51, 51
export WTSUnRegisterSessionNotificationEx, 52, 52
export WTSVirtualChannelClose, 53, 53
export WTSVirtualChannelOpen, 54, 54
export WTSVirtualChannelOpenEx, 55, 55
export WTSVirtualChannelPurgeInput, 56, 56
export WTSVirtualChannelPurgeOutput, 57, 57
export WTSVirtualChannelQuery, 58, 58
export WTSVirtualChannelRead, 59, 59
export WTSVirtualChannelWrite, 60, 60
export WTSWaitSystemEvent, 61, 61

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
