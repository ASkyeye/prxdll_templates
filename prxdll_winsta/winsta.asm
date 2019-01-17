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

PRX_EXPORT stdcall, LogonIdFromWinStationNameA, 1
PRX_EXPORT stdcall, LogonIdFromWinStationNameW, 2
PRX_EXPORT stdcall, RemoteAssistancePrepareSystemRestore, 3
PRX_EXPORT stdcall, ServerGetInternetConnectorStatus, 4
PRX_EXPORT stdcall, ServerLicensingClose, 5
PRX_EXPORT stdcall, ServerLicensingDeactivateCurrentPolicy, 6
PRX_EXPORT stdcall, ServerLicensingFreePolicyInformation, 7
PRX_EXPORT stdcall, ServerLicensingGetAvailablePolicyIds, 8
PRX_EXPORT stdcall, ServerLicensingGetPolicy, 9
PRX_EXPORT stdcall, ServerLicensingGetPolicyInformationA, 10
PRX_EXPORT stdcall, ServerLicensingGetPolicyInformationW, 11
PRX_EXPORT stdcall, ServerLicensingLoadPolicy, 12
PRX_EXPORT stdcall, ServerLicensingOpenA, 13
PRX_EXPORT stdcall, ServerLicensingOpenW, 14
PRX_EXPORT stdcall, ServerLicensingSetPolicy, 15
PRX_EXPORT stdcall, ServerLicensingUnloadPolicy, 16
PRX_EXPORT stdcall, ServerQueryInetConnectorInformationA, 17
PRX_EXPORT stdcall, ServerQueryInetConnectorInformationW, 18
PRX_EXPORT stdcall, ServerSetInternetConnectorStatus, 19
PRX_EXPORT stdcall, WinStationActivateLicense, 20
PRX_EXPORT stdcall, WinStationAutoReconnect, 21
PRX_EXPORT stdcall, WinStationBroadcastSystemMessage, 22
PRX_EXPORT stdcall, WinStationCheckAccess, 23
PRX_EXPORT stdcall, WinStationCheckLoopBack, 24
PRX_EXPORT stdcall, WinStationCloseServer, 25
PRX_EXPORT stdcall, WinStationConnectA, 26
PRX_EXPORT stdcall, WinStationConnectCallback, 27
PRX_EXPORT stdcall, WinStationConnectEx, 28
PRX_EXPORT stdcall, WinStationConnectW, 29
PRX_EXPORT stdcall, WinStationDisconnect, 30
PRX_EXPORT stdcall, WinStationEnumerateA, 31
PRX_EXPORT stdcall, WinStationEnumerateExW, 32
PRX_EXPORT stdcall, WinStationEnumerateLicenses, 33
PRX_EXPORT stdcall, WinStationEnumerateProcesses, 34
PRX_EXPORT stdcall, WinStationEnumerateW, 35
PRX_EXPORT stdcall, WinStationEnumerate_IndexedA, 36
PRX_EXPORT stdcall, WinStationEnumerate_IndexedW, 37
PRX_EXPORT stdcall, WinStationFreeConsoleNotification, 38
PRX_EXPORT stdcall, WinStationFreeGAPMemory, 39
PRX_EXPORT stdcall, WinStationFreeMemory, 40
PRX_EXPORT stdcall, WinStationFreePropertyValue, 41
PRX_EXPORT stdcall, WinStationFreeUserCertificates, 42
PRX_EXPORT stdcall, WinStationFreeUserCredentials, 43
PRX_EXPORT stdcall, WinStationGenerateLicense, 44
PRX_EXPORT stdcall, WinStationGetAllProcesses, 45
PRX_EXPORT stdcall, WinStationGetAllSessionsW, 46
PRX_EXPORT stdcall, WinStationGetConnectionProperty, 47
PRX_EXPORT stdcall, WinStationGetDeviceId, 48
PRX_EXPORT stdcall, WinStationGetInitialApplication, 49
PRX_EXPORT stdcall, WinStationGetLanAdapterNameA, 50
PRX_EXPORT stdcall, WinStationGetLanAdapterNameW, 51
PRX_EXPORT stdcall, WinStationGetLoggedOnCount, 52
PRX_EXPORT stdcall, WinStationGetMachinePolicy, 53
PRX_EXPORT stdcall, WinStationGetProcessSid, 54
PRX_EXPORT stdcall, WinStationGetRestrictedLogonInfo, 55
PRX_EXPORT stdcall, WinStationGetSessionIds, 56
PRX_EXPORT stdcall, WinStationGetTermSrvCountersValue, 57
PRX_EXPORT stdcall, WinStationGetUserCertificates, 58
PRX_EXPORT stdcall, WinStationGetUserCredentials, 59
PRX_EXPORT stdcall, WinStationGetUserProfile, 60
PRX_EXPORT stdcall, WinStationInstallLicense, 61
PRX_EXPORT stdcall, WinStationIsHelpAssistantSession, 62
PRX_EXPORT stdcall, WinStationIsSessionPermitted, 63
PRX_EXPORT stdcall, WinStationIsSessionRemoteable, 64
PRX_EXPORT stdcall, WinStationNameFromLogonIdA, 65
PRX_EXPORT stdcall, WinStationNameFromLogonIdW, 66
PRX_EXPORT stdcall, WinStationNegotiateSession, 67
PRX_EXPORT stdcall, WinStationNtsdDebug, 68
PRX_EXPORT stdcall, WinStationOpenServerA, 69
PRX_EXPORT stdcall, WinStationOpenServerExA, 70
PRX_EXPORT stdcall, WinStationOpenServerExW, 71
PRX_EXPORT stdcall, WinStationOpenServerW, 72
PRX_EXPORT stdcall, WinStationQueryAllowConcurrentConnections, 73
PRX_EXPORT stdcall, WinStationQueryEnforcementCore, 74
PRX_EXPORT stdcall, WinStationQueryInformationA, 75
PRX_EXPORT stdcall, WinStationQueryInformationW, 76
PRX_EXPORT stdcall, WinStationQueryLicense, 77
PRX_EXPORT stdcall, WinStationQueryLogonCredentialsW, 78
PRX_EXPORT stdcall, WinStationQuerySessionVirtualIP, 79
PRX_EXPORT stdcall, WinStationQueryUpdateRequired, 80
PRX_EXPORT stdcall, WinStationRedirectErrorMessage, 81
PRX_EXPORT stdcall, WinStationRedirectLogonBeginPainting, 82
PRX_EXPORT stdcall, WinStationRedirectLogonError, 83
PRX_EXPORT stdcall, WinStationRedirectLogonMessage, 84
PRX_EXPORT stdcall, WinStationRedirectLogonStatus, 85
PRX_EXPORT stdcall, WinStationRegisterConsoleNotification, 86
PRX_EXPORT stdcall, WinStationRegisterConsoleNotificationEx, 87
PRX_EXPORT stdcall, WinStationRegisterNotificationEvent, 88
PRX_EXPORT stdcall, WinStationRemoveLicense, 89
PRX_EXPORT stdcall, WinStationRenameA, 90
PRX_EXPORT stdcall, WinStationRenameW, 91
PRX_EXPORT stdcall, WinStationReportUIResult, 92
PRX_EXPORT stdcall, WinStationReset, 93
PRX_EXPORT stdcall, WinStationRevertFromServicesSession, 94
PRX_EXPORT stdcall, WinStationSendMessageA, 95
PRX_EXPORT stdcall, WinStationSendMessageW, 96
PRX_EXPORT stdcall, WinStationSendWindowMessage, 97
PRX_EXPORT stdcall, WinStationServerPing, 98
PRX_EXPORT stdcall, WinStationSetAutologonPassword, 99
PRX_EXPORT stdcall, WinStationSetInformationA, 100
PRX_EXPORT stdcall, WinStationSetInformationW, 101
PRX_EXPORT stdcall, WinStationSetPoolCount, 102
PRX_EXPORT stdcall, WinStationShadow, 103
PRX_EXPORT stdcall, WinStationShadowStop, 104
PRX_EXPORT stdcall, WinStationShutdownSystem, 105
PRX_EXPORT stdcall, WinStationSwitchToServicesSession, 106
PRX_EXPORT stdcall, WinStationSystemShutdownStarted, 107
PRX_EXPORT stdcall, WinStationSystemShutdownWait, 108
PRX_EXPORT stdcall, WinStationTerminateProcess, 109
PRX_EXPORT stdcall, WinStationUnRegisterConsoleNotification, 110
PRX_EXPORT stdcall, WinStationUnRegisterNotificationEvent, 111
PRX_EXPORT stdcall, WinStationUserLoginAccessCheck, 112
PRX_EXPORT stdcall, WinStationVerify, 113
PRX_EXPORT stdcall, WinStationVirtualOpen, 114
PRX_EXPORT stdcall, WinStationVirtualOpenEx, 115
PRX_EXPORT stdcall, WinStationWaitSystemEvent, 116
PRX_EXPORT stdcall, _NWLogonQueryAdmin, 117
PRX_EXPORT stdcall, _NWLogonSetAdmin, 118
PRX_EXPORT stdcall, _WinStationAnnoyancePopup, 119
PRX_EXPORT stdcall, _WinStationBeepOpen, 120
PRX_EXPORT stdcall, _WinStationBreakPoint, 121
PRX_EXPORT stdcall, _WinStationCallback, 122
PRX_EXPORT stdcall, _WinStationCheckForApplicationName, 123
PRX_EXPORT stdcall, _WinStationFUSCanRemoteUserDisconnect, 124
PRX_EXPORT stdcall, _WinStationGetApplicationInfo, 125
PRX_EXPORT stdcall, _WinStationNotifyDisconnectPipe, 126
PRX_EXPORT stdcall, _WinStationNotifyLogoff, 127
PRX_EXPORT stdcall, _WinStationNotifyLogon, 128
PRX_EXPORT stdcall, _WinStationNotifyNewSession, 129
PRX_EXPORT stdcall, _WinStationOpenSessionDirectory, 130
PRX_EXPORT stdcall, _WinStationReInitializeSecurity, 131
PRX_EXPORT stdcall, _WinStationReadRegistry, 132
PRX_EXPORT stdcall, _WinStationSessionInitialized, 133
PRX_EXPORT stdcall, _WinStationShadowTarget2, 134
PRX_EXPORT stdcall, _WinStationShadowTarget, 135
PRX_EXPORT stdcall, _WinStationShadowTargetSetup, 136
PRX_EXPORT stdcall, _WinStationUpdateClientCachedCredentials, 137
PRX_EXPORT stdcall, _WinStationUpdateSettings, 138
PRX_EXPORT stdcall, _WinStationUpdateUserConfig, 139
PRX_EXPORT stdcall, _WinStationWaitForConnect, 140

end
