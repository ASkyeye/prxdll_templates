IFNDEF x64
        .MODEL FLAT, STDCALL
        .SAFESEH SEH_handler
ENDIF

.CODE

IFNDEF x64
        find_real_function PROTO STDCALL, arg1:WORD
ELSE
        EXTERN find_real_function:PROC
ENDIF

export MACRO name, x, y
IFNDEF x64 AND x NE 0
    name PROC
            INVOKE find_real_function, x
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
            call find_real_function
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

export LogonIdFromWinStationNameA, 1, 1
export LogonIdFromWinStationNameW, 2, 2
export RemoteAssistancePrepareSystemRestore, 3, 3
export ServerGetInternetConnectorStatus, 4, 4
export ServerLicensingClose, 5, 5
export ServerLicensingDeactivateCurrentPolicy, 6, 6
export ServerLicensingFreePolicyInformation, 7, 7
export ServerLicensingGetAvailablePolicyIds, 8, 8
export ServerLicensingGetPolicy, 9, 9
export ServerLicensingGetPolicyInformationA, 10, 10
export ServerLicensingGetPolicyInformationW, 11, 11
export ServerLicensingLoadPolicy, 12, 12
export ServerLicensingOpenA, 13, 13
export ServerLicensingOpenW, 14, 14
export ServerLicensingSetPolicy, 15, 15
export ServerLicensingUnloadPolicy, 16, 16
export ServerQueryInetConnectorInformationA, 17, 17
export ServerQueryInetConnectorInformationW, 18, 18
export ServerSetInternetConnectorStatus, 19, 19
export WinStationActivateLicense, 20, 20
export WinStationAutoReconnect, 21, 21
export WinStationBroadcastSystemMessage, 22, 22
export WinStationCheckAccess, 23, 23
export WinStationCheckLoopBack, 24, 24
export WinStationCloseServer, 25, 25
export WinStationConnectA, 26, 26
export WinStationConnectCallback, 27, 27
export WinStationConnectEx, 28, 28
export WinStationConnectW, 29, 29
export WinStationDisconnect, 30, 30
export WinStationEnumerateA, 31, 31
export WinStationEnumerateExW, 32, 32
export WinStationEnumerateLicenses, 33, 33
export WinStationEnumerateProcesses, 34, 34
export WinStationEnumerateW, 35, 35
export WinStationEnumerate_IndexedA, 36, 36
export WinStationEnumerate_IndexedW, 37, 37
export WinStationFreeConsoleNotification, 38, 38
export WinStationFreeGAPMemory, 39, 39
export WinStationFreeMemory, 40, 40
export WinStationFreePropertyValue, 41, 41
export WinStationFreeUserCertificates, 42, 42
export WinStationFreeUserCredentials, 43, 43
export WinStationGenerateLicense, 44, 44
export WinStationGetAllProcesses, 45, 45
export WinStationGetAllSessionsW, 46, 46
export WinStationGetConnectionProperty, 47, 47
export WinStationGetDeviceId, 48, 48
export WinStationGetInitialApplication, 49, 49
export WinStationGetLanAdapterNameA, 50, 50
export WinStationGetLanAdapterNameW, 51, 51
export WinStationGetLoggedOnCount, 52, 52
export WinStationGetMachinePolicy, 53, 53
export WinStationGetProcessSid, 54, 54
export WinStationGetRestrictedLogonInfo, 55, 55
export WinStationGetSessionIds, 56, 56
export WinStationGetTermSrvCountersValue, 57, 57
export WinStationGetUserCertificates, 58, 58
export WinStationGetUserCredentials, 59, 59
export WinStationGetUserProfile, 60, 60
export WinStationInstallLicense, 61, 61
export WinStationIsHelpAssistantSession, 62, 62
export WinStationIsSessionPermitted, 63, 63
export WinStationIsSessionRemoteable, 64, 64
export WinStationNameFromLogonIdA, 65, 65
export WinStationNameFromLogonIdW, 66, 66
export WinStationNegotiateSession, 67, 67
export WinStationNtsdDebug, 68, 68
export WinStationOpenServerA, 69, 69
export WinStationOpenServerExA, 70, 70
export WinStationOpenServerExW, 71, 71
export WinStationOpenServerW, 72, 72
export WinStationQueryAllowConcurrentConnections, 73, 73
export WinStationQueryEnforcementCore, 74, 74
export WinStationQueryInformationA, 75, 75
export WinStationQueryInformationW, 76, 76
export WinStationQueryLicense, 77, 77
export WinStationQueryLogonCredentialsW, 78, 78
export WinStationQuerySessionVirtualIP, 79, 79
export WinStationQueryUpdateRequired, 80, 80
export WinStationRedirectErrorMessage, 81, 81
export WinStationRedirectLogonBeginPainting, 82, 82
export WinStationRedirectLogonError, 83, 83
export WinStationRedirectLogonMessage, 84, 84
export WinStationRedirectLogonStatus, 85, 85
export WinStationRegisterConsoleNotification, 86, 86
export WinStationRegisterConsoleNotificationEx, 87, 87
export WinStationRegisterNotificationEvent, 88, 88
export WinStationRemoveLicense, 89, 89
export WinStationRenameA, 90, 90
export WinStationRenameW, 91, 91
export WinStationReportUIResult, 92, 92
export WinStationReset, 93, 93
export WinStationRevertFromServicesSession, 94, 94
export WinStationSendMessageA, 95, 95
export WinStationSendMessageW, 96, 96
export WinStationSendWindowMessage, 97, 97
export WinStationServerPing, 98, 98
export WinStationSetAutologonPassword, 99, 99
export WinStationSetInformationA, 100, 100
export WinStationSetInformationW, 101, 101
export WinStationSetPoolCount, 102, 102
export WinStationShadow, 103, 103
export WinStationShadowStop, 104, 104
export WinStationShutdownSystem, 105, 105
export WinStationSwitchToServicesSession, 106, 106
export WinStationSystemShutdownStarted, 107, 107
export WinStationSystemShutdownWait, 108, 108
export WinStationTerminateProcess, 109, 109
export WinStationUnRegisterConsoleNotification, 110, 110
export WinStationUnRegisterNotificationEvent, 111, 111
export WinStationUserLoginAccessCheck, 112, 112
export WinStationVerify, 113, 113
export WinStationVirtualOpen, 114, 114
export WinStationVirtualOpenEx, 115, 115
export WinStationWaitSystemEvent, 116, 116
export _NWLogonQueryAdmin, 117, 117
export _NWLogonSetAdmin, 118, 118
export _WinStationAnnoyancePopup, 119, 119
export _WinStationBeepOpen, 120, 120
export _WinStationBreakPoint, 121, 121
export _WinStationCallback, 122, 122
export _WinStationCheckForApplicationName, 123, 123
export _WinStationFUSCanRemoteUserDisconnect, 124, 124
export _WinStationGetApplicationInfo, 125, 125
export _WinStationNotifyDisconnectPipe, 126, 126
export _WinStationNotifyLogoff, 127, 127
export _WinStationNotifyLogon, 128, 128
export _WinStationNotifyNewSession, 129, 129
export _WinStationOpenSessionDirectory, 130, 130
export _WinStationReInitializeSecurity, 131, 131
export _WinStationReadRegistry, 132, 132
export _WinStationSessionInitialized, 133, 133
export _WinStationShadowTarget2, 134, 134
export _WinStationShadowTarget, 135, 135
export _WinStationShadowTargetSetup, 136, 136
export _WinStationUpdateClientCachedCredentials, 137, 137
export _WinStationUpdateSettings, 138, 138
export _WinStationUpdateUserConfig, 139, 139
export _WinStationWaitForConnect, 140, 140

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
