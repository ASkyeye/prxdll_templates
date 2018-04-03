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

M_EXPORT_PROC AddIPAddress, 0
M_EXPORT_PROC AllocateAndGetInterfaceInfoFromStack, 1
M_EXPORT_PROC AllocateAndGetIpAddrTableFromStack, 2
M_EXPORT_PROC CPNatfwtCreateProviderInstance, 3
M_EXPORT_PROC CPNatfwtDeregisterProviderInstance, 4
M_EXPORT_PROC CPNatfwtDestroyProviderInstance, 5
M_EXPORT_PROC CPNatfwtIndicateReceivedBuffers, 6
M_EXPORT_PROC CPNatfwtRegisterProviderInstance, 7
M_EXPORT_PROC CancelIPChangeNotify, 8
M_EXPORT_PROC CancelMibChangeNotify2, 9
M_EXPORT_PROC ConvertGuidToStringA, 10
M_EXPORT_PROC ConvertGuidToStringW, 11
M_EXPORT_PROC ConvertInterfaceAliasToLuid, 12
M_EXPORT_PROC ConvertInterfaceGuidToLuid, 13
M_EXPORT_PROC ConvertInterfaceIndexToLuid, 14
M_EXPORT_PROC ConvertInterfaceLuidToAlias, 15
M_EXPORT_PROC ConvertInterfaceLuidToGuid, 16
M_EXPORT_PROC ConvertInterfaceLuidToIndex, 17
M_EXPORT_PROC ConvertInterfaceLuidToNameA, 18
M_EXPORT_PROC ConvertInterfaceLuidToNameW, 19
M_EXPORT_PROC ConvertInterfaceNameToLuidA, 20
M_EXPORT_PROC ConvertInterfaceNameToLuidW, 21
M_EXPORT_PROC ConvertInterfacePhysicalAddressToLuid, 22
M_EXPORT_PROC ConvertIpv4MaskToLength, 23
M_EXPORT_PROC ConvertLengthToIpv4Mask, 24
M_EXPORT_PROC ConvertRemoteInterfaceAliasToLuid, 25
M_EXPORT_PROC ConvertRemoteInterfaceGuidToLuid, 26
M_EXPORT_PROC ConvertRemoteInterfaceIndexToLuid, 27
M_EXPORT_PROC ConvertRemoteInterfaceLuidToAlias, 28
M_EXPORT_PROC ConvertRemoteInterfaceLuidToGuid, 29
M_EXPORT_PROC ConvertRemoteInterfaceLuidToIndex, 30
M_EXPORT_PROC ConvertStringToGuidA, 31
M_EXPORT_PROC ConvertStringToGuidW, 32
M_EXPORT_PROC ConvertStringToInterfacePhysicalAddress, 33
M_EXPORT_PROC CreateAnycastIpAddressEntry, 34
M_EXPORT_PROC CreateIpForwardEntry2, 35
M_EXPORT_PROC CreateIpForwardEntry, 36
M_EXPORT_PROC CreateIpNetEntry2, 37
M_EXPORT_PROC CreateIpNetEntry, 38
M_EXPORT_PROC CreatePersistentTcpPortReservation, 39
M_EXPORT_PROC CreatePersistentUdpPortReservation, 40
M_EXPORT_PROC CreateProxyArpEntry, 41
M_EXPORT_PROC CreateSortedAddressPairs, 42
M_EXPORT_PROC CreateUnicastIpAddressEntry, 43
M_EXPORT_PROC DeleteAnycastIpAddressEntry, 44
M_EXPORT_PROC DeleteIPAddress, 45
M_EXPORT_PROC DeleteIpForwardEntry2, 46
M_EXPORT_PROC DeleteIpForwardEntry, 47
M_EXPORT_PROC DeleteIpNetEntry2, 48
M_EXPORT_PROC DeleteIpNetEntry, 49
M_EXPORT_PROC DeletePersistentTcpPortReservation, 50
M_EXPORT_PROC DeletePersistentUdpPortReservation, 51
M_EXPORT_PROC DeleteProxyArpEntry, 52
M_EXPORT_PROC DeleteUnicastIpAddressEntry, 53
M_EXPORT_PROC DisableMediaSense, 54
M_EXPORT_PROC EnableRouter, 55
M_EXPORT_PROC FlushIpNetTable2, 56
M_EXPORT_PROC FlushIpNetTable, 57
M_EXPORT_PROC FlushIpPathTable, 58
M_EXPORT_PROC FreeMibTable, 59
M_EXPORT_PROC GetAdapterIndex, 60
M_EXPORT_PROC GetAdapterOrderMap, 61
M_EXPORT_PROC GetAdaptersAddresses, 62
M_EXPORT_PROC GetAdaptersInfo, 63
M_EXPORT_PROC GetAnycastIpAddressEntry, 64
M_EXPORT_PROC GetAnycastIpAddressTable, 65
M_EXPORT_PROC GetBestInterface, 66
M_EXPORT_PROC GetBestInterfaceEx, 67
M_EXPORT_PROC GetBestRoute2, 68
M_EXPORT_PROC GetBestRoute, 69
M_EXPORT_PROC GetCurrentThreadCompartmentId, 70
M_EXPORT_PROC GetExtendedTcpTable, 71
M_EXPORT_PROC GetExtendedUdpTable, 72
M_EXPORT_PROC GetFriendlyIfIndex, 73
M_EXPORT_PROC GetIcmpStatistics, 74
M_EXPORT_PROC GetIcmpStatisticsEx, 75
M_EXPORT_PROC GetIfEntry2, 76
M_EXPORT_PROC GetIfEntry, 77
M_EXPORT_PROC GetIfStackTable, 78
M_EXPORT_PROC GetIfTable2, 79
M_EXPORT_PROC GetIfTable2Ex, 80
M_EXPORT_PROC GetIfTable, 81
M_EXPORT_PROC GetInterfaceInfo, 82
M_EXPORT_PROC GetInvertedIfStackTable, 83
M_EXPORT_PROC GetIpAddrTable, 84
M_EXPORT_PROC GetIpErrorString, 85
M_EXPORT_PROC GetIpForwardEntry2, 86
M_EXPORT_PROC GetIpForwardTable2, 87
M_EXPORT_PROC GetIpForwardTable, 88
M_EXPORT_PROC GetIpInterfaceEntry, 89
M_EXPORT_PROC GetIpInterfaceTable, 90
M_EXPORT_PROC GetIpNetEntry2, 91
M_EXPORT_PROC GetIpNetTable2, 92
M_EXPORT_PROC GetIpNetTable, 93
M_EXPORT_PROC GetIpPathEntry, 94
M_EXPORT_PROC GetIpPathTable, 95
M_EXPORT_PROC GetIpStatistics, 96
M_EXPORT_PROC GetIpStatisticsEx, 97
M_EXPORT_PROC GetMulticastIpAddressEntry, 98
M_EXPORT_PROC GetMulticastIpAddressTable, 99
M_EXPORT_PROC GetNetworkInformation, 100
M_EXPORT_PROC GetNetworkParams, 101
M_EXPORT_PROC GetNumberOfInterfaces, 102
M_EXPORT_PROC GetOwnerModuleFromPidAndInfo, 103
M_EXPORT_PROC GetOwnerModuleFromTcp6Entry, 104
M_EXPORT_PROC GetOwnerModuleFromTcpEntry, 105
M_EXPORT_PROC GetOwnerModuleFromUdp6Entry, 106
M_EXPORT_PROC GetOwnerModuleFromUdpEntry, 107
M_EXPORT_PROC GetPerAdapterInfo, 108
M_EXPORT_PROC GetPerTcp6ConnectionEStats, 109
M_EXPORT_PROC GetPerTcp6ConnectionStats, 110
M_EXPORT_PROC GetPerTcpConnectionEStats, 111
M_EXPORT_PROC GetPerTcpConnectionStats, 112
M_EXPORT_PROC GetRTTAndHopCount, 113
M_EXPORT_PROC GetSessionCompartmentId, 114
M_EXPORT_PROC GetTcp6Table2, 115
M_EXPORT_PROC GetTcp6Table, 116
M_EXPORT_PROC GetTcpStatistics, 117
M_EXPORT_PROC GetTcpStatisticsEx, 118
M_EXPORT_PROC GetTcpTable2, 119
M_EXPORT_PROC GetTcpTable, 120
M_EXPORT_PROC GetTeredoPort, 121
M_EXPORT_PROC GetUdp6Table, 122
M_EXPORT_PROC GetUdpStatistics, 123
M_EXPORT_PROC GetUdpStatisticsEx, 124
M_EXPORT_PROC GetUdpTable, 125
M_EXPORT_PROC GetUniDirectionalAdapterInfo, 126
M_EXPORT_PROC GetUnicastIpAddressEntry, 127
M_EXPORT_PROC GetUnicastIpAddressTable, 128
M_EXPORT_PROC Icmp6CreateFile, 129
M_EXPORT_PROC Icmp6ParseReplies, 130
M_EXPORT_PROC Icmp6SendEcho2, 131
M_EXPORT_PROC IcmpCloseHandle, 132
M_EXPORT_PROC IcmpCreateFile, 133
M_EXPORT_PROC IcmpParseReplies, 134
M_EXPORT_PROC IcmpSendEcho2, 135
M_EXPORT_PROC IcmpSendEcho2Ex, 136
M_EXPORT_PROC IcmpSendEcho, 137
M_EXPORT_PROC InitializeIpForwardEntry, 138
M_EXPORT_PROC InitializeIpInterfaceEntry, 139
M_EXPORT_PROC InitializeUnicastIpAddressEntry, 140
M_EXPORT_PROC InternalCleanupPersistentStore, 141
M_EXPORT_PROC InternalCreateAnycastIpAddressEntry, 142
M_EXPORT_PROC InternalCreateIpForwardEntry2, 143
M_EXPORT_PROC InternalCreateIpForwardEntry, 144
M_EXPORT_PROC InternalCreateIpNetEntry2, 145
M_EXPORT_PROC InternalCreateIpNetEntry, 146
M_EXPORT_PROC InternalCreateUnicastIpAddressEntry, 147
M_EXPORT_PROC InternalDeleteAnycastIpAddressEntry, 148
M_EXPORT_PROC InternalDeleteIpForwardEntry2, 149
M_EXPORT_PROC InternalDeleteIpForwardEntry, 150
M_EXPORT_PROC InternalDeleteIpNetEntry2, 151
M_EXPORT_PROC InternalDeleteIpNetEntry, 152
M_EXPORT_PROC InternalDeleteUnicastIpAddressEntry, 153
M_EXPORT_PROC InternalFindInterfaceByAddress, 154
M_EXPORT_PROC InternalGetAnycastIpAddressEntry, 155
M_EXPORT_PROC InternalGetAnycastIpAddressTable, 156
M_EXPORT_PROC InternalGetForwardIpTable2, 157
M_EXPORT_PROC InternalGetIfEntry2, 158
M_EXPORT_PROC InternalGetIfTable2, 159
M_EXPORT_PROC InternalGetIfTable, 160
M_EXPORT_PROC InternalGetIpAddrTable, 161
M_EXPORT_PROC InternalGetIpForwardEntry2, 162
M_EXPORT_PROC InternalGetIpForwardTable, 163
M_EXPORT_PROC InternalGetIpInterfaceEntry, 164
M_EXPORT_PROC InternalGetIpInterfaceTable, 165
M_EXPORT_PROC InternalGetIpNetEntry2, 166
M_EXPORT_PROC InternalGetIpNetTable2, 167
M_EXPORT_PROC InternalGetIpNetTable, 168
M_EXPORT_PROC InternalGetMulticastIpAddressEntry, 169
M_EXPORT_PROC InternalGetMulticastIpAddressTable, 170
M_EXPORT_PROC InternalGetTcp6Table2, 171
M_EXPORT_PROC InternalGetTcp6TableWithOwnerModule, 172
M_EXPORT_PROC InternalGetTcp6TableWithOwnerPid, 173
M_EXPORT_PROC InternalGetTcpTable2, 174
M_EXPORT_PROC InternalGetTcpTable, 175
M_EXPORT_PROC InternalGetTcpTableEx, 176
M_EXPORT_PROC InternalGetTcpTableWithOwnerModule, 177
M_EXPORT_PROC InternalGetTcpTableWithOwnerPid, 178
M_EXPORT_PROC InternalGetTunnelPhysicalAdapter, 179
M_EXPORT_PROC InternalGetUdp6TableWithOwnerModule, 180
M_EXPORT_PROC InternalGetUdp6TableWithOwnerPid, 181
M_EXPORT_PROC InternalGetUdpTable, 182
M_EXPORT_PROC InternalGetUdpTableEx, 183
M_EXPORT_PROC InternalGetUdpTableWithOwnerModule, 184
M_EXPORT_PROC InternalGetUdpTableWithOwnerPid, 185
M_EXPORT_PROC InternalGetUnicastIpAddressEntry, 186
M_EXPORT_PROC InternalGetUnicastIpAddressTable, 187
M_EXPORT_PROC InternalSetIfEntry, 188
M_EXPORT_PROC InternalSetIpForwardEntry2, 189
M_EXPORT_PROC InternalSetIpForwardEntry, 190
M_EXPORT_PROC InternalSetIpInterfaceEntry, 191
M_EXPORT_PROC InternalSetIpNetEntry2, 192
M_EXPORT_PROC InternalSetIpNetEntry, 193
M_EXPORT_PROC InternalSetIpStats, 194
M_EXPORT_PROC InternalSetTcpEntry, 195
M_EXPORT_PROC InternalSetTeredoPort, 196
M_EXPORT_PROC InternalSetUnicastIpAddressEntry, 197
M_EXPORT_PROC IpReleaseAddress, 198
M_EXPORT_PROC IpRenewAddress, 199
M_EXPORT_PROC LookupPersistentTcpPortReservation, 200
M_EXPORT_PROC LookupPersistentUdpPortReservation, 201
M_EXPORT_PROC NTPTimeToNTFileTime, 202
M_EXPORT_PROC NTTimeToNTPTime, 203
M_EXPORT_PROC NhGetGuidFromInterfaceName, 204
M_EXPORT_PROC NhGetInterfaceDescriptionFromGuid, 205
M_EXPORT_PROC NhGetInterfaceNameFromDeviceGuid, 206
M_EXPORT_PROC NhGetInterfaceNameFromGuid, 207
M_EXPORT_PROC NhpAllocateAndGetInterfaceInfoFromStack, 208
M_EXPORT_PROC NotifyAddrChange, 209
M_EXPORT_PROC NotifyIpInterfaceChange, 210
M_EXPORT_PROC NotifyRouteChange2, 211
M_EXPORT_PROC NotifyRouteChange, 212
M_EXPORT_PROC NotifyStableUnicastIpAddressTable, 213
M_EXPORT_PROC NotifyTeredoPortChange, 214
M_EXPORT_PROC NotifyUnicastIpAddressChange, 215
M_EXPORT_PROC ParseNetworkString, 216
M_EXPORT_PROC PfAddFiltersToInterface, 217
M_EXPORT_PROC PfAddGlobalFilterToInterface, 218
M_EXPORT_PROC PfBindInterfaceToIPAddress, 219
M_EXPORT_PROC PfBindInterfaceToIndex, 220
M_EXPORT_PROC PfCreateInterface, 221
M_EXPORT_PROC PfDeleteInterface, 222
M_EXPORT_PROC PfDeleteLog, 223
M_EXPORT_PROC PfGetInterfaceStatistics, 224
M_EXPORT_PROC PfMakeLog, 225
M_EXPORT_PROC PfRebindFilters, 226
M_EXPORT_PROC PfRemoveFilterHandles, 227
M_EXPORT_PROC PfRemoveFiltersFromInterface, 228
M_EXPORT_PROC PfRemoveGlobalFilterFromInterface, 229
M_EXPORT_PROC PfSetLogBuffer, 230
M_EXPORT_PROC PfTestPacket, 231
M_EXPORT_PROC PfUnBindInterface, 232
M_EXPORT_PROC ResolveIpNetEntry2, 233
M_EXPORT_PROC ResolveNeighbor, 234
M_EXPORT_PROC RestoreMediaSense, 235
M_EXPORT_PROC SendARP, 236
M_EXPORT_PROC SetAdapterIpAddress, 237
M_EXPORT_PROC SetCurrentThreadCompartmentId, 238
M_EXPORT_PROC SetIfEntry, 239
M_EXPORT_PROC SetIpForwardEntry2, 240
M_EXPORT_PROC SetIpForwardEntry, 241
M_EXPORT_PROC SetIpInterfaceEntry, 242
M_EXPORT_PROC SetIpNetEntry2, 243
M_EXPORT_PROC SetIpNetEntry, 244
M_EXPORT_PROC SetIpStatistics, 245
M_EXPORT_PROC SetIpStatisticsEx, 246
M_EXPORT_PROC SetIpTTL, 247
M_EXPORT_PROC SetNetworkInformation, 248
M_EXPORT_PROC SetPerTcp6ConnectionEStats, 249
M_EXPORT_PROC SetPerTcp6ConnectionStats, 250
M_EXPORT_PROC SetPerTcpConnectionEStats, 251
M_EXPORT_PROC SetPerTcpConnectionStats, 252
M_EXPORT_PROC SetSessionCompartmentId, 253
M_EXPORT_PROC SetTcpEntry, 254
M_EXPORT_PROC SetUnicastIpAddressEntry, 255
M_EXPORT_PROC UnenableRouter, 256
M_EXPORT_PROC do_echo_rep, 257
M_EXPORT_PROC do_echo_req, 258
M_EXPORT_PROC if_indextoname, 259
M_EXPORT_PROC if_nametoindex, 260
M_EXPORT_PROC register_icmp, 261

SEH_handler   proc
        ; empty handler
        ret
SEH_handler   endp

end
