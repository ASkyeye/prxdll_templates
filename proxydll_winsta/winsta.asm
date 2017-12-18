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

M_EXPORT_PROC LogonIdFromWinStationNameA, 0
M_EXPORT_PROC LogonIdFromWinStationNameW, 1
M_EXPORT_PROC RemoteAssistancePrepareSystemRestore, 2
M_EXPORT_PROC ServerGetInternetConnectorStatus, 3
M_EXPORT_PROC ServerLicensingClose, 4
M_EXPORT_PROC ServerLicensingDeactivateCurrentPolicy, 5
M_EXPORT_PROC ServerLicensingFreePolicyInformation, 6
M_EXPORT_PROC ServerLicensingGetAvailablePolicyIds, 7
M_EXPORT_PROC ServerLicensingGetPolicy, 8
M_EXPORT_PROC ServerLicensingGetPolicyInformationA, 9
M_EXPORT_PROC ServerLicensingGetPolicyInformationW, 10
M_EXPORT_PROC ServerLicensingLoadPolicy, 11
M_EXPORT_PROC ServerLicensingOpenA, 12
M_EXPORT_PROC ServerLicensingOpenW, 13
M_EXPORT_PROC ServerLicensingSetPolicy, 14
M_EXPORT_PROC ServerLicensingUnloadPolicy, 15
M_EXPORT_PROC ServerQueryInetConnectorInformationA, 16
M_EXPORT_PROC ServerQueryInetConnectorInformationW, 17
M_EXPORT_PROC ServerSetInternetConnectorStatus, 18
M_EXPORT_PROC WinStationActivateLicense, 19
M_EXPORT_PROC WinStationAutoReconnect, 20
M_EXPORT_PROC WinStationBroadcastSystemMessage, 21
M_EXPORT_PROC WinStationCheckAccess, 22
M_EXPORT_PROC WinStationCheckLoopBack, 23
M_EXPORT_PROC WinStationCloseServer, 24
M_EXPORT_PROC WinStationConnectA, 25
M_EXPORT_PROC WinStationConnectCallback, 26
M_EXPORT_PROC WinStationConnectEx, 27
M_EXPORT_PROC WinStationConnectW, 28
M_EXPORT_PROC WinStationDisconnect, 29
M_EXPORT_PROC WinStationEnumerateA, 30
M_EXPORT_PROC WinStationEnumerateExW, 31
M_EXPORT_PROC WinStationEnumerateLicenses, 32
M_EXPORT_PROC WinStationEnumerateProcesses, 33
M_EXPORT_PROC WinStationEnumerateW, 34
M_EXPORT_PROC WinStationEnumerate_IndexedA, 35
M_EXPORT_PROC WinStationEnumerate_IndexedW, 36
M_EXPORT_PROC WinStationFreeConsoleNotification, 37
M_EXPORT_PROC WinStationFreeGAPMemory, 38
M_EXPORT_PROC WinStationFreeMemory, 39
M_EXPORT_PROC WinStationFreePropertyValue, 40
M_EXPORT_PROC WinStationFreeUserCertificates, 41
M_EXPORT_PROC WinStationFreeUserCredentials, 42
M_EXPORT_PROC WinStationGenerateLicense, 43
M_EXPORT_PROC WinStationGetAllProcesses, 44
M_EXPORT_PROC WinStationGetAllSessionsW, 45
M_EXPORT_PROC WinStationGetConnectionProperty, 46
M_EXPORT_PROC WinStationGetDeviceId, 47
M_EXPORT_PROC WinStationGetInitialApplication, 48
M_EXPORT_PROC WinStationGetLanAdapterNameA, 49
M_EXPORT_PROC WinStationGetLanAdapterNameW, 50
M_EXPORT_PROC WinStationGetLoggedOnCount, 51
M_EXPORT_PROC WinStationGetMachinePolicy, 52
M_EXPORT_PROC WinStationGetProcessSid, 53
M_EXPORT_PROC WinStationGetRestrictedLogonInfo, 54
M_EXPORT_PROC WinStationGetSessionIds, 55
M_EXPORT_PROC WinStationGetTermSrvCountersValue, 56
M_EXPORT_PROC WinStationGetUserCertificates, 57
M_EXPORT_PROC WinStationGetUserCredentials, 58
M_EXPORT_PROC WinStationGetUserProfile, 59
M_EXPORT_PROC WinStationInstallLicense, 60
M_EXPORT_PROC WinStationIsHelpAssistantSession, 61
M_EXPORT_PROC WinStationIsSessionPermitted, 62
M_EXPORT_PROC WinStationIsSessionRemoteable, 63
M_EXPORT_PROC WinStationNameFromLogonIdA, 64
M_EXPORT_PROC WinStationNameFromLogonIdW, 65
M_EXPORT_PROC WinStationNegotiateSession, 66
M_EXPORT_PROC WinStationNtsdDebug, 67
M_EXPORT_PROC WinStationOpenServerA, 68
M_EXPORT_PROC WinStationOpenServerExA, 69
M_EXPORT_PROC WinStationOpenServerExW, 70
M_EXPORT_PROC WinStationOpenServerW, 71
M_EXPORT_PROC WinStationQueryAllowConcurrentConnections, 72
M_EXPORT_PROC WinStationQueryEnforcementCore, 73
M_EXPORT_PROC WinStationQueryInformationA, 74
M_EXPORT_PROC WinStationQueryInformationW, 75
M_EXPORT_PROC WinStationQueryLicense, 76
M_EXPORT_PROC WinStationQueryLogonCredentialsW, 77
M_EXPORT_PROC WinStationQuerySessionVirtualIP, 78
M_EXPORT_PROC WinStationQueryUpdateRequired, 79
M_EXPORT_PROC WinStationRedirectErrorMessage, 80
M_EXPORT_PROC WinStationRedirectLogonBeginPainting, 81
M_EXPORT_PROC WinStationRedirectLogonError, 82
M_EXPORT_PROC WinStationRedirectLogonMessage, 83
M_EXPORT_PROC WinStationRedirectLogonStatus, 84
M_EXPORT_PROC WinStationRegisterConsoleNotification, 85
M_EXPORT_PROC WinStationRegisterConsoleNotificationEx, 86
M_EXPORT_PROC WinStationRegisterNotificationEvent, 87
M_EXPORT_PROC WinStationRemoveLicense, 88
M_EXPORT_PROC WinStationRenameA, 89
M_EXPORT_PROC WinStationRenameW, 90
M_EXPORT_PROC WinStationReportUIResult, 91
M_EXPORT_PROC WinStationReset, 92
M_EXPORT_PROC WinStationRevertFromServicesSession, 93
M_EXPORT_PROC WinStationSendMessageA, 94
M_EXPORT_PROC WinStationSendMessageW, 95
M_EXPORT_PROC WinStationSendWindowMessage, 96
M_EXPORT_PROC WinStationServerPing, 97
M_EXPORT_PROC WinStationSetAutologonPassword, 98
M_EXPORT_PROC WinStationSetInformationA, 99
M_EXPORT_PROC WinStationSetInformationW, 100
M_EXPORT_PROC WinStationSetPoolCount, 101
M_EXPORT_PROC WinStationShadow, 102
M_EXPORT_PROC WinStationShadowStop, 103
M_EXPORT_PROC WinStationShutdownSystem, 104
M_EXPORT_PROC WinStationSwitchToServicesSession, 105
M_EXPORT_PROC WinStationSystemShutdownStarted, 106
M_EXPORT_PROC WinStationSystemShutdownWait, 107
M_EXPORT_PROC WinStationTerminateProcess, 108
M_EXPORT_PROC WinStationUnRegisterConsoleNotification, 109
M_EXPORT_PROC WinStationUnRegisterNotificationEvent, 110
M_EXPORT_PROC WinStationUserLoginAccessCheck, 111
M_EXPORT_PROC WinStationVerify, 112
M_EXPORT_PROC WinStationVirtualOpen, 113
M_EXPORT_PROC WinStationVirtualOpenEx, 114
M_EXPORT_PROC WinStationWaitSystemEvent, 115
M_EXPORT_PROC _NWLogonQueryAdmin, 116
M_EXPORT_PROC _NWLogonSetAdmin, 117
M_EXPORT_PROC _WinStationAnnoyancePopup, 118
M_EXPORT_PROC _WinStationBeepOpen, 119
M_EXPORT_PROC _WinStationBreakPoint, 120
M_EXPORT_PROC _WinStationCallback, 121
M_EXPORT_PROC _WinStationCheckForApplicationName, 122
M_EXPORT_PROC _WinStationFUSCanRemoteUserDisconnect, 123
M_EXPORT_PROC _WinStationGetApplicationInfo, 124
M_EXPORT_PROC _WinStationNotifyDisconnectPipe, 125
M_EXPORT_PROC _WinStationNotifyLogoff, 126
M_EXPORT_PROC _WinStationNotifyLogon, 127
M_EXPORT_PROC _WinStationNotifyNewSession, 128
M_EXPORT_PROC _WinStationOpenSessionDirectory, 129
M_EXPORT_PROC _WinStationReInitializeSecurity, 130
M_EXPORT_PROC _WinStationReadRegistry, 131
M_EXPORT_PROC _WinStationSessionInitialized, 132
M_EXPORT_PROC _WinStationShadowTarget2, 133
M_EXPORT_PROC _WinStationShadowTarget, 134
M_EXPORT_PROC _WinStationShadowTargetSetup, 135
M_EXPORT_PROC _WinStationUpdateClientCachedCredentials, 136
M_EXPORT_PROC _WinStationUpdateSettings, 137
M_EXPORT_PROC _WinStationUpdateUserConfig, 138
M_EXPORT_PROC _WinStationWaitForConnect, 139

SEH_handler   proc
	; empty handler
	ret
SEH_handler   endp

end
