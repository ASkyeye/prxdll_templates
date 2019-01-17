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
            alloc_stack 20h
            END_PROLOGUE
            
            mov rax, procname&_ptr
            test rax, rax
            jnz skip_find
                mov rcx, ordinal
                mov rdx, offset procname&_ptr
                call prx_find_function

        skip_find:
            add rsp, 20h
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

PRX_EXPORT stdcall, WTSCloseServer, 1
PRX_EXPORT stdcall, WTSConnectSessionA, 2
PRX_EXPORT stdcall, WTSConnectSessionW, 3
PRX_EXPORT stdcall, WTSCreateListenerA, 4
PRX_EXPORT stdcall, WTSCreateListenerW, 5
PRX_EXPORT stdcall, WTSDisconnectSession, 6
PRX_EXPORT stdcall, WTSEnumerateListenersA, 7
PRX_EXPORT stdcall, WTSEnumerateListenersW, 8
PRX_EXPORT stdcall, WTSEnumerateProcessesA, 9
PRX_EXPORT stdcall, WTSEnumerateProcessesExA, 10
PRX_EXPORT stdcall, WTSEnumerateProcessesExW, 11
PRX_EXPORT stdcall, WTSEnumerateProcessesW, 12
PRX_EXPORT stdcall, WTSEnumerateServersA, 13
PRX_EXPORT stdcall, WTSEnumerateServersW, 14
PRX_EXPORT stdcall, WTSEnumerateSessionsA, 15
PRX_EXPORT stdcall, WTSEnumerateSessionsExA, 16
PRX_EXPORT stdcall, WTSEnumerateSessionsExW, 17
PRX_EXPORT stdcall, WTSEnumerateSessionsW, 18
PRX_EXPORT stdcall, WTSFreeMemory, 19
PRX_EXPORT stdcall, WTSFreeMemoryExA, 20
PRX_EXPORT stdcall, WTSFreeMemoryExW, 21
PRX_EXPORT stdcall, WTSGetListenerSecurityA, 22
PRX_EXPORT stdcall, WTSGetListenerSecurityW, 23
PRX_EXPORT stdcall, WTSLogoffSession, 24
PRX_EXPORT stdcall, WTSOpenServerA, 25
PRX_EXPORT stdcall, WTSOpenServerExA, 26
PRX_EXPORT stdcall, WTSOpenServerExW, 27
PRX_EXPORT stdcall, WTSOpenServerW, 28
PRX_EXPORT stdcall, WTSQueryListenerConfigA, 29
PRX_EXPORT stdcall, WTSQueryListenerConfigW, 30
PRX_EXPORT stdcall, WTSQuerySessionInformationA, 31
PRX_EXPORT stdcall, WTSQuerySessionInformationW, 32
PRX_EXPORT stdcall, WTSQueryUserConfigA, 33
PRX_EXPORT stdcall, WTSQueryUserConfigW, 34
PRX_EXPORT stdcall, WTSQueryUserToken, 35
PRX_EXPORT stdcall, WTSRegisterSessionNotification, 36
PRX_EXPORT stdcall, WTSRegisterSessionNotificationEx, 37
PRX_EXPORT stdcall, WTSSendMessageA, 38
PRX_EXPORT stdcall, WTSSendMessageW, 39
PRX_EXPORT stdcall, WTSSetListenerSecurityA, 40
PRX_EXPORT stdcall, WTSSetListenerSecurityW, 41
PRX_EXPORT stdcall, WTSSetSessionInformationA, 42
PRX_EXPORT stdcall, WTSSetSessionInformationW, 43
PRX_EXPORT stdcall, WTSSetUserConfigA, 44
PRX_EXPORT stdcall, WTSSetUserConfigW, 45
PRX_EXPORT stdcall, WTSShutdownSystem, 46
PRX_EXPORT stdcall, WTSStartRemoteControlSessionA, 47
PRX_EXPORT stdcall, WTSStartRemoteControlSessionW, 48
PRX_EXPORT stdcall, WTSStopRemoteControlSession, 49
PRX_EXPORT stdcall, WTSTerminateProcess, 50
PRX_EXPORT stdcall, WTSUnRegisterSessionNotification, 51
PRX_EXPORT stdcall, WTSUnRegisterSessionNotificationEx, 52
PRX_EXPORT stdcall, WTSVirtualChannelClose, 53
PRX_EXPORT stdcall, WTSVirtualChannelOpen, 54
PRX_EXPORT stdcall, WTSVirtualChannelOpenEx, 55
PRX_EXPORT stdcall, WTSVirtualChannelPurgeInput, 56
PRX_EXPORT stdcall, WTSVirtualChannelPurgeOutput, 57
PRX_EXPORT stdcall, WTSVirtualChannelQuery, 58
PRX_EXPORT stdcall, WTSVirtualChannelRead, 59
PRX_EXPORT stdcall, WTSVirtualChannelWrite, 60
PRX_EXPORT stdcall, WTSWaitSystemEvent, 61

end
