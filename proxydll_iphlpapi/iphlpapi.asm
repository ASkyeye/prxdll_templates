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

export AddIPAddress, 1, 1
export AllocateAndGetInterfaceInfoFromStack, 2, 2
export AllocateAndGetIpAddrTableFromStack, 3, 3
export CPNatfwtCreateProviderInstance, 4, 4
export CPNatfwtDeregisterProviderInstance, 5, 5
export CPNatfwtDestroyProviderInstance, 6, 6
export CPNatfwtIndicateReceivedBuffers, 7, 7
export CPNatfwtRegisterProviderInstance, 8, 8
export CancelIPChangeNotify, 9, 9
export CancelMibChangeNotify2, 10, 10
export ConvertGuidToStringA, 11, 11
export ConvertGuidToStringW, 12, 12
export ConvertInterfaceAliasToLuid, 13, 13
export ConvertInterfaceGuidToLuid, 14, 14
export ConvertInterfaceIndexToLuid, 15, 15
export ConvertInterfaceLuidToAlias, 16, 16
export ConvertInterfaceLuidToGuid, 17, 17
export ConvertInterfaceLuidToIndex, 18, 18
export ConvertInterfaceLuidToNameA, 19, 19
export ConvertInterfaceLuidToNameW, 20, 20
export ConvertInterfaceNameToLuidA, 21, 21
export ConvertInterfaceNameToLuidW, 22, 22
export ConvertInterfacePhysicalAddressToLuid, 23, 23
export ConvertIpv4MaskToLength, 24, 24
export ConvertLengthToIpv4Mask, 25, 25
export ConvertRemoteInterfaceAliasToLuid, 26, 26
export ConvertRemoteInterfaceGuidToLuid, 27, 27
export ConvertRemoteInterfaceIndexToLuid, 28, 28
export ConvertRemoteInterfaceLuidToAlias, 29, 29
export ConvertRemoteInterfaceLuidToGuid, 30, 30
export ConvertRemoteInterfaceLuidToIndex, 31, 31
export ConvertStringToGuidA, 32, 32
export ConvertStringToGuidW, 33, 33
export ConvertStringToInterfacePhysicalAddress, 34, 34
export CreateAnycastIpAddressEntry, 35, 35
export CreateIpForwardEntry2, 36, 36
export CreateIpForwardEntry, 37, 37
export CreateIpNetEntry2, 38, 38
export CreateIpNetEntry, 39, 39
export CreatePersistentTcpPortReservation, 40, 40
export CreatePersistentUdpPortReservation, 41, 41
export CreateProxyArpEntry, 42, 42
export CreateSortedAddressPairs, 43, 43
export CreateUnicastIpAddressEntry, 44, 44
export DeleteAnycastIpAddressEntry, 45, 45
export DeleteIPAddress, 46, 46
export DeleteIpForwardEntry2, 47, 47
export DeleteIpForwardEntry, 48, 48
export DeleteIpNetEntry2, 49, 49
export DeleteIpNetEntry, 50, 50
export DeletePersistentTcpPortReservation, 51, 51
export DeletePersistentUdpPortReservation, 52, 52
export DeleteProxyArpEntry, 53, 53
export DeleteUnicastIpAddressEntry, 54, 54
export DisableMediaSense, 55, 55
export EnableRouter, 56, 56
export FlushIpNetTable2, 57, 57
export FlushIpNetTable, 58, 58
export FlushIpPathTable, 59, 59
export FreeMibTable, 60, 60
export GetAdapterIndex, 61, 61
export GetAdapterOrderMap, 62, 62
export GetAdaptersAddresses, 63, 63
export GetAdaptersInfo, 64, 64
export GetAnycastIpAddressEntry, 65, 65
export GetAnycastIpAddressTable, 66, 66
export GetBestInterface, 67, 67
export GetBestInterfaceEx, 68, 68
export GetBestRoute2, 69, 69
export GetBestRoute, 70, 70
export GetCurrentThreadCompartmentId, 71, 71
export GetExtendedTcpTable, 72, 72
export GetExtendedUdpTable, 73, 73
export GetFriendlyIfIndex, 74, 74
export GetIcmpStatistics, 75, 75
export GetIcmpStatisticsEx, 76, 76
export GetIfEntry2, 77, 77
export GetIfEntry, 78, 78
export GetIfStackTable, 79, 79
export GetIfTable2, 80, 80
export GetIfTable2Ex, 81, 81
export GetIfTable, 82, 82
export GetInterfaceInfo, 83, 83
export GetInvertedIfStackTable, 84, 84
export GetIpAddrTable, 85, 85
export GetIpErrorString, 86, 86
export GetIpForwardEntry2, 87, 87
export GetIpForwardTable2, 88, 88
export GetIpForwardTable, 89, 89
export GetIpInterfaceEntry, 90, 90
export GetIpInterfaceTable, 91, 91
export GetIpNetEntry2, 92, 92
export GetIpNetTable2, 93, 93
export GetIpNetTable, 94, 94
export GetIpPathEntry, 95, 95
export GetIpPathTable, 96, 96
export GetIpStatistics, 97, 97
export GetIpStatisticsEx, 98, 98
export GetMulticastIpAddressEntry, 99, 99
export GetMulticastIpAddressTable, 100, 100
export GetNetworkInformation, 101, 101
export GetNetworkParams, 102, 102
export GetNumberOfInterfaces, 103, 103
export GetOwnerModuleFromPidAndInfo, 104, 104
export GetOwnerModuleFromTcp6Entry, 105, 105
export GetOwnerModuleFromTcpEntry, 106, 106
export GetOwnerModuleFromUdp6Entry, 107, 107
export GetOwnerModuleFromUdpEntry, 108, 108
export GetPerAdapterInfo, 109, 109
export GetPerTcp6ConnectionEStats, 110, 110
export GetPerTcp6ConnectionStats, 111, 111
export GetPerTcpConnectionEStats, 112, 112
export GetPerTcpConnectionStats, 113, 113
export GetRTTAndHopCount, 114, 114
export GetSessionCompartmentId, 115, 115
export GetTcp6Table2, 116, 116
export GetTcp6Table, 117, 117
export GetTcpStatistics, 118, 118
export GetTcpStatisticsEx, 119, 119
export GetTcpTable2, 120, 120
export GetTcpTable, 121, 121
export GetTeredoPort, 122, 122
export GetUdp6Table, 123, 123
export GetUdpStatistics, 124, 124
export GetUdpStatisticsEx, 125, 125
export GetUdpTable, 126, 126
export GetUniDirectionalAdapterInfo, 127, 127
export GetUnicastIpAddressEntry, 128, 128
export GetUnicastIpAddressTable, 129, 129
export Icmp6CreateFile, 130, 130
export Icmp6ParseReplies, 131, 131
export Icmp6SendEcho2, 132, 132
export IcmpCloseHandle, 133, 133
export IcmpCreateFile, 134, 134
export IcmpParseReplies, 135, 135
export IcmpSendEcho2, 136, 136
export IcmpSendEcho2Ex, 137, 137
export IcmpSendEcho, 138, 138
export InitializeIpForwardEntry, 139, 139
export InitializeIpInterfaceEntry, 140, 140
export InitializeUnicastIpAddressEntry, 141, 141
export InternalCleanupPersistentStore, 142, 142
export InternalCreateAnycastIpAddressEntry, 143, 143
export InternalCreateIpForwardEntry2, 144, 144
export InternalCreateIpForwardEntry, 145, 145
export InternalCreateIpNetEntry2, 146, 146
export InternalCreateIpNetEntry, 147, 147
export InternalCreateUnicastIpAddressEntry, 148, 148
export InternalDeleteAnycastIpAddressEntry, 149, 149
export InternalDeleteIpForwardEntry2, 150, 150
export InternalDeleteIpForwardEntry, 151, 151
export InternalDeleteIpNetEntry2, 152, 152
export InternalDeleteIpNetEntry, 153, 153
export InternalDeleteUnicastIpAddressEntry, 154, 154
export InternalFindInterfaceByAddress, 155, 155
export InternalGetAnycastIpAddressEntry, 156, 156
export InternalGetAnycastIpAddressTable, 157, 157
export InternalGetForwardIpTable2, 158, 158
export InternalGetIfEntry2, 159, 159
export InternalGetIfTable2, 160, 160
export InternalGetIfTable, 161, 161
export InternalGetIpAddrTable, 162, 162
export InternalGetIpForwardEntry2, 163, 163
export InternalGetIpForwardTable, 164, 164
export InternalGetIpInterfaceEntry, 165, 165
export InternalGetIpInterfaceTable, 166, 166
export InternalGetIpNetEntry2, 167, 167
export InternalGetIpNetTable2, 168, 168
export InternalGetIpNetTable, 169, 169
export InternalGetMulticastIpAddressEntry, 170, 170
export InternalGetMulticastIpAddressTable, 171, 171
export InternalGetTcp6Table2, 172, 172
export InternalGetTcp6TableWithOwnerModule, 173, 173
export InternalGetTcp6TableWithOwnerPid, 174, 174
export InternalGetTcpTable2, 175, 175
export InternalGetTcpTable, 176, 176
export InternalGetTcpTableEx, 177, 177
export InternalGetTcpTableWithOwnerModule, 178, 178
export InternalGetTcpTableWithOwnerPid, 179, 179
export InternalGetTunnelPhysicalAdapter, 180, 180
export InternalGetUdp6TableWithOwnerModule, 181, 181
export InternalGetUdp6TableWithOwnerPid, 182, 182
export InternalGetUdpTable, 183, 183
export InternalGetUdpTableEx, 184, 184
export InternalGetUdpTableWithOwnerModule, 185, 185
export InternalGetUdpTableWithOwnerPid, 186, 186
export InternalGetUnicastIpAddressEntry, 187, 187
export InternalGetUnicastIpAddressTable, 188, 188
export InternalSetIfEntry, 189, 189
export InternalSetIpForwardEntry2, 190, 190
export InternalSetIpForwardEntry, 191, 191
export InternalSetIpInterfaceEntry, 192, 192
export InternalSetIpNetEntry2, 193, 193
export InternalSetIpNetEntry, 194, 194
export InternalSetIpStats, 195, 195
export InternalSetTcpEntry, 196, 196
export InternalSetTeredoPort, 197, 197
export InternalSetUnicastIpAddressEntry, 198, 198
export IpReleaseAddress, 199, 199
export IpRenewAddress, 200, 200
export LookupPersistentTcpPortReservation, 201, 201
export LookupPersistentUdpPortReservation, 202, 202
export NTPTimeToNTFileTime, 203, 203
export NTTimeToNTPTime, 204, 204
export NhGetGuidFromInterfaceName, 205, 205
export NhGetInterfaceDescriptionFromGuid, 206, 206
export NhGetInterfaceNameFromDeviceGuid, 207, 207
export NhGetInterfaceNameFromGuid, 208, 208
export NhpAllocateAndGetInterfaceInfoFromStack, 209, 209
export NotifyAddrChange, 210, 210
export NotifyIpInterfaceChange, 211, 211
export NotifyRouteChange2, 212, 212
export NotifyRouteChange, 213, 213
export NotifyStableUnicastIpAddressTable, 214, 214
export NotifyTeredoPortChange, 215, 215
export NotifyUnicastIpAddressChange, 216, 216
export ParseNetworkString, 217, 217
export PfAddFiltersToInterface, 218, 218
export PfAddGlobalFilterToInterface, 219, 219
export PfBindInterfaceToIPAddress, 220, 220
export PfBindInterfaceToIndex, 221, 221
export PfCreateInterface, 222, 222
export PfDeleteInterface, 223, 223
export PfDeleteLog, 224, 224
export PfGetInterfaceStatistics, 225, 225
export PfMakeLog, 226, 226
export PfRebindFilters, 227, 227
export PfRemoveFilterHandles, 228, 228
export PfRemoveFiltersFromInterface, 229, 229
export PfRemoveGlobalFilterFromInterface, 230, 230
export PfSetLogBuffer, 231, 231
export PfTestPacket, 232, 232
export PfUnBindInterface, 233, 233
export ResolveIpNetEntry2, 234, 234
export ResolveNeighbor, 235, 235
export RestoreMediaSense, 236, 236
export SendARP, 237, 237
export SetAdapterIpAddress, 238, 238
export SetCurrentThreadCompartmentId, 239, 239
export SetIfEntry, 240, 240
export SetIpForwardEntry2, 241, 241
export SetIpForwardEntry, 242, 242
export SetIpInterfaceEntry, 243, 243
export SetIpNetEntry2, 244, 244
export SetIpNetEntry, 245, 245
export SetIpStatistics, 246, 246
export SetIpStatisticsEx, 247, 247
export SetIpTTL, 248, 248
export SetNetworkInformation, 249, 249
export SetPerTcp6ConnectionEStats, 250, 250
export SetPerTcp6ConnectionStats, 251, 251
export SetPerTcpConnectionEStats, 252, 252
export SetPerTcpConnectionStats, 253, 253
export SetSessionCompartmentId, 254, 254
export SetTcpEntry, 255, 255
export SetUnicastIpAddressEntry, 256, 256
export UnenableRouter, 257, 257
export do_echo_rep, 258, 258
export do_echo_req, 259, 259
export if_indextoname, 260, 260
export if_nametoindex, 261, 261
export register_icmp, 262, 262

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
