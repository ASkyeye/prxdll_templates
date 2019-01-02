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

EXPORT STDCALL, LogonIdFromWinStationNameA, 1
EXPORT STDCALL, LogonIdFromWinStationNameW, 2
EXPORT STDCALL, RemoteAssistancePrepareSystemRestore, 3
EXPORT STDCALL, ServerGetInternetConnectorStatus, 4
EXPORT STDCALL, ServerLicensingClose, 5
EXPORT STDCALL, ServerLicensingDeactivateCurrentPolicy, 6
EXPORT STDCALL, ServerLicensingFreePolicyInformation, 7
EXPORT STDCALL, ServerLicensingGetAvailablePolicyIds, 8
EXPORT STDCALL, ServerLicensingGetPolicy, 9
EXPORT STDCALL, ServerLicensingGetPolicyInformationA, 10
EXPORT STDCALL, ServerLicensingGetPolicyInformationW, 11
EXPORT STDCALL, ServerLicensingLoadPolicy, 12
EXPORT STDCALL, ServerLicensingOpenA, 13
EXPORT STDCALL, ServerLicensingOpenW, 14
EXPORT STDCALL, ServerLicensingSetPolicy, 15
EXPORT STDCALL, ServerLicensingUnloadPolicy, 16
EXPORT STDCALL, ServerQueryInetConnectorInformationA, 17
EXPORT STDCALL, ServerQueryInetConnectorInformationW, 18
EXPORT STDCALL, ServerSetInternetConnectorStatus, 19
EXPORT STDCALL, WinStationActivateLicense, 20
EXPORT STDCALL, WinStationAutoReconnect, 21
EXPORT STDCALL, WinStationBroadcastSystemMessage, 22
EXPORT STDCALL, WinStationCheckAccess, 23
EXPORT STDCALL, WinStationCheckLoopBack, 24
EXPORT STDCALL, WinStationCloseServer, 25
EXPORT STDCALL, WinStationConnectA, 26
EXPORT STDCALL, WinStationConnectCallback, 27
EXPORT STDCALL, WinStationConnectEx, 28
EXPORT STDCALL, WinStationConnectW, 29
EXPORT STDCALL, WinStationDisconnect, 30
EXPORT STDCALL, WinStationEnumerateA, 31
EXPORT STDCALL, WinStationEnumerateExW, 32
EXPORT STDCALL, WinStationEnumerateLicenses, 33
EXPORT STDCALL, WinStationEnumerateProcesses, 34
EXPORT STDCALL, WinStationEnumerateW, 35
EXPORT STDCALL, WinStationEnumerate_IndexedA, 36
EXPORT STDCALL, WinStationEnumerate_IndexedW, 37
EXPORT STDCALL, WinStationFreeConsoleNotification, 38
EXPORT STDCALL, WinStationFreeGAPMemory, 39
EXPORT STDCALL, WinStationFreeMemory, 40
EXPORT STDCALL, WinStationFreePropertyValue, 41
EXPORT STDCALL, WinStationFreeUserCertificates, 42
EXPORT STDCALL, WinStationFreeUserCredentials, 43
EXPORT STDCALL, WinStationGenerateLicense, 44
EXPORT STDCALL, WinStationGetAllProcesses, 45
EXPORT STDCALL, WinStationGetAllSessionsW, 46
EXPORT STDCALL, WinStationGetConnectionProperty, 47
EXPORT STDCALL, WinStationGetDeviceId, 48
EXPORT STDCALL, WinStationGetInitialApplication, 49
EXPORT STDCALL, WinStationGetLanAdapterNameA, 50
EXPORT STDCALL, WinStationGetLanAdapterNameW, 51
EXPORT STDCALL, WinStationGetLoggedOnCount, 52
EXPORT STDCALL, WinStationGetMachinePolicy, 53
EXPORT STDCALL, WinStationGetProcessSid, 54
EXPORT STDCALL, WinStationGetRestrictedLogonInfo, 55
EXPORT STDCALL, WinStationGetSessionIds, 56
EXPORT STDCALL, WinStationGetTermSrvCountersValue, 57
EXPORT STDCALL, WinStationGetUserCertificates, 58
EXPORT STDCALL, WinStationGetUserCredentials, 59
EXPORT STDCALL, WinStationGetUserProfile, 60
EXPORT STDCALL, WinStationInstallLicense, 61
EXPORT STDCALL, WinStationIsHelpAssistantSession, 62
EXPORT STDCALL, WinStationIsSessionPermitted, 63
EXPORT STDCALL, WinStationIsSessionRemoteable, 64
EXPORT STDCALL, WinStationNameFromLogonIdA, 65
EXPORT STDCALL, WinStationNameFromLogonIdW, 66
EXPORT STDCALL, WinStationNegotiateSession, 67
EXPORT STDCALL, WinStationNtsdDebug, 68
EXPORT STDCALL, WinStationOpenServerA, 69
EXPORT STDCALL, WinStationOpenServerExA, 70
EXPORT STDCALL, WinStationOpenServerExW, 71
EXPORT STDCALL, WinStationOpenServerW, 72
EXPORT STDCALL, WinStationQueryAllowConcurrentConnections, 73
EXPORT STDCALL, WinStationQueryEnforcementCore, 74
EXPORT STDCALL, WinStationQueryInformationA, 75
EXPORT STDCALL, WinStationQueryInformationW, 76
EXPORT STDCALL, WinStationQueryLicense, 77
EXPORT STDCALL, WinStationQueryLogonCredentialsW, 78
EXPORT STDCALL, WinStationQuerySessionVirtualIP, 79
EXPORT STDCALL, WinStationQueryUpdateRequired, 80
EXPORT STDCALL, WinStationRedirectErrorMessage, 81
EXPORT STDCALL, WinStationRedirectLogonBeginPainting, 82
EXPORT STDCALL, WinStationRedirectLogonError, 83
EXPORT STDCALL, WinStationRedirectLogonMessage, 84
EXPORT STDCALL, WinStationRedirectLogonStatus, 85
EXPORT STDCALL, WinStationRegisterConsoleNotification, 86
EXPORT STDCALL, WinStationRegisterConsoleNotificationEx, 87
EXPORT STDCALL, WinStationRegisterNotificationEvent, 88
EXPORT STDCALL, WinStationRemoveLicense, 89
EXPORT STDCALL, WinStationRenameA, 90
EXPORT STDCALL, WinStationRenameW, 91
EXPORT STDCALL, WinStationReportUIResult, 92
EXPORT STDCALL, WinStationReset, 93
EXPORT STDCALL, WinStationRevertFromServicesSession, 94
EXPORT STDCALL, WinStationSendMessageA, 95
EXPORT STDCALL, WinStationSendMessageW, 96
EXPORT STDCALL, WinStationSendWindowMessage, 97
EXPORT STDCALL, WinStationServerPing, 98
EXPORT STDCALL, WinStationSetAutologonPassword, 99
EXPORT STDCALL, WinStationSetInformationA, 100
EXPORT STDCALL, WinStationSetInformationW, 101
EXPORT STDCALL, WinStationSetPoolCount, 102
EXPORT STDCALL, WinStationShadow, 103
EXPORT STDCALL, WinStationShadowStop, 104
EXPORT STDCALL, WinStationShutdownSystem, 105
EXPORT STDCALL, WinStationSwitchToServicesSession, 106
EXPORT STDCALL, WinStationSystemShutdownStarted, 107
EXPORT STDCALL, WinStationSystemShutdownWait, 108
EXPORT STDCALL, WinStationTerminateProcess, 109
EXPORT STDCALL, WinStationUnRegisterConsoleNotification, 110
EXPORT STDCALL, WinStationUnRegisterNotificationEvent, 111
EXPORT STDCALL, WinStationUserLoginAccessCheck, 112
EXPORT STDCALL, WinStationVerify, 113
EXPORT STDCALL, WinStationVirtualOpen, 114
EXPORT STDCALL, WinStationVirtualOpenEx, 115
EXPORT STDCALL, WinStationWaitSystemEvent, 116
EXPORT STDCALL, _NWLogonQueryAdmin, 117
EXPORT STDCALL, _NWLogonSetAdmin, 118
EXPORT STDCALL, _WinStationAnnoyancePopup, 119
EXPORT STDCALL, _WinStationBeepOpen, 120
EXPORT STDCALL, _WinStationBreakPoint, 121
EXPORT STDCALL, _WinStationCallback, 122
EXPORT STDCALL, _WinStationCheckForApplicationName, 123
EXPORT STDCALL, _WinStationFUSCanRemoteUserDisconnect, 124
EXPORT STDCALL, _WinStationGetApplicationInfo, 125
EXPORT STDCALL, _WinStationNotifyDisconnectPipe, 126
EXPORT STDCALL, _WinStationNotifyLogoff, 127
EXPORT STDCALL, _WinStationNotifyLogon, 128
EXPORT STDCALL, _WinStationNotifyNewSession, 129
EXPORT STDCALL, _WinStationOpenSessionDirectory, 130
EXPORT STDCALL, _WinStationReInitializeSecurity, 131
EXPORT STDCALL, _WinStationReadRegistry, 132
EXPORT STDCALL, _WinStationSessionInitialized, 133
EXPORT STDCALL, _WinStationShadowTarget2, 134
EXPORT STDCALL, _WinStationShadowTarget, 135
EXPORT STDCALL, _WinStationShadowTargetSetup, 136
EXPORT STDCALL, _WinStationUpdateClientCachedCredentials, 137
EXPORT STDCALL, _WinStationUpdateSettings, 138
EXPORT STDCALL, _WinStationUpdateUserConfig, 139
EXPORT STDCALL, _WinStationWaitForConnect, 140

END
