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

EXPORT STDCALL, AddIPAddress, 1
EXPORT STDCALL, AllocateAndGetInterfaceInfoFromStack, 2
EXPORT STDCALL, AllocateAndGetIpAddrTableFromStack, 3
EXPORT STDCALL, CPNatfwtCreateProviderInstance, 4
EXPORT STDCALL, CPNatfwtDeregisterProviderInstance, 5
EXPORT STDCALL, CPNatfwtDestroyProviderInstance, 6
EXPORT STDCALL, CPNatfwtIndicateReceivedBuffers, 7
EXPORT STDCALL, CPNatfwtRegisterProviderInstance, 8
EXPORT STDCALL, CancelIPChangeNotify, 9
EXPORT STDCALL, CancelMibChangeNotify2, 10
EXPORT STDCALL, ConvertGuidToStringA, 11
EXPORT STDCALL, ConvertGuidToStringW, 12
EXPORT STDCALL, ConvertInterfaceAliasToLuid, 13
EXPORT STDCALL, ConvertInterfaceGuidToLuid, 14
EXPORT STDCALL, ConvertInterfaceIndexToLuid, 15
EXPORT STDCALL, ConvertInterfaceLuidToAlias, 16
EXPORT STDCALL, ConvertInterfaceLuidToGuid, 17
EXPORT STDCALL, ConvertInterfaceLuidToIndex, 18
EXPORT STDCALL, ConvertInterfaceLuidToNameA, 19
EXPORT STDCALL, ConvertInterfaceLuidToNameW, 20
EXPORT STDCALL, ConvertInterfaceNameToLuidA, 21
EXPORT STDCALL, ConvertInterfaceNameToLuidW, 22
EXPORT STDCALL, ConvertInterfacePhysicalAddressToLuid, 23
EXPORT STDCALL, ConvertIpv4MaskToLength, 24
EXPORT STDCALL, ConvertLengthToIpv4Mask, 25
EXPORT STDCALL, ConvertRemoteInterfaceAliasToLuid, 26
EXPORT STDCALL, ConvertRemoteInterfaceGuidToLuid, 27
EXPORT STDCALL, ConvertRemoteInterfaceIndexToLuid, 28
EXPORT STDCALL, ConvertRemoteInterfaceLuidToAlias, 29
EXPORT STDCALL, ConvertRemoteInterfaceLuidToGuid, 30
EXPORT STDCALL, ConvertRemoteInterfaceLuidToIndex, 31
EXPORT STDCALL, ConvertStringToGuidA, 32
EXPORT STDCALL, ConvertStringToGuidW, 33
EXPORT STDCALL, ConvertStringToInterfacePhysicalAddress, 34
EXPORT STDCALL, CreateAnycastIpAddressEntry, 35
EXPORT STDCALL, CreateIpForwardEntry2, 36
EXPORT STDCALL, CreateIpForwardEntry, 37
EXPORT STDCALL, CreateIpNetEntry2, 38
EXPORT STDCALL, CreateIpNetEntry, 39
EXPORT STDCALL, CreatePersistentTcpPortReservation, 40
EXPORT STDCALL, CreatePersistentUdpPortReservation, 41
EXPORT STDCALL, CreateProxyArpEntry, 42
EXPORT STDCALL, CreateSortedAddressPairs, 43
EXPORT STDCALL, CreateUnicastIpAddressEntry, 44
EXPORT STDCALL, DeleteAnycastIpAddressEntry, 45
EXPORT STDCALL, DeleteIPAddress, 46
EXPORT STDCALL, DeleteIpForwardEntry2, 47
EXPORT STDCALL, DeleteIpForwardEntry, 48
EXPORT STDCALL, DeleteIpNetEntry2, 49
EXPORT STDCALL, DeleteIpNetEntry, 50
EXPORT STDCALL, DeletePersistentTcpPortReservation, 51
EXPORT STDCALL, DeletePersistentUdpPortReservation, 52
EXPORT STDCALL, DeleteProxyArpEntry, 53
EXPORT STDCALL, DeleteUnicastIpAddressEntry, 54
EXPORT STDCALL, DisableMediaSense, 55
EXPORT STDCALL, EnableRouter, 56
EXPORT STDCALL, FlushIpNetTable2, 57
EXPORT STDCALL, FlushIpNetTable, 58
EXPORT STDCALL, FlushIpPathTable, 59
EXPORT STDCALL, FreeMibTable, 60
EXPORT STDCALL, GetAdapterIndex, 61
EXPORT STDCALL, GetAdapterOrderMap, 62
EXPORT STDCALL, GetAdaptersAddresses, 63
EXPORT STDCALL, GetAdaptersInfo, 64
EXPORT STDCALL, GetAnycastIpAddressEntry, 65
EXPORT STDCALL, GetAnycastIpAddressTable, 66
EXPORT STDCALL, GetBestInterface, 67
EXPORT STDCALL, GetBestInterfaceEx, 68
EXPORT STDCALL, GetBestRoute2, 69
EXPORT STDCALL, GetBestRoute, 70
EXPORT STDCALL, GetCurrentThreadCompartmentId, 71
EXPORT STDCALL, GetExtendedTcpTable, 72
EXPORT STDCALL, GetExtendedUdpTable, 73
EXPORT STDCALL, GetFriendlyIfIndex, 74
EXPORT STDCALL, GetIcmpStatistics, 75
EXPORT STDCALL, GetIcmpStatisticsEx, 76
EXPORT STDCALL, GetIfEntry2, 77
EXPORT STDCALL, GetIfEntry, 78
EXPORT STDCALL, GetIfStackTable, 79
EXPORT STDCALL, GetIfTable2, 80
EXPORT STDCALL, GetIfTable2Ex, 81
EXPORT STDCALL, GetIfTable, 82
EXPORT STDCALL, GetInterfaceInfo, 83
EXPORT STDCALL, GetInvertedIfStackTable, 84
EXPORT STDCALL, GetIpAddrTable, 85
EXPORT STDCALL, GetIpErrorString, 86
EXPORT STDCALL, GetIpForwardEntry2, 87
EXPORT STDCALL, GetIpForwardTable2, 88
EXPORT STDCALL, GetIpForwardTable, 89
EXPORT STDCALL, GetIpInterfaceEntry, 90
EXPORT STDCALL, GetIpInterfaceTable, 91
EXPORT STDCALL, GetIpNetEntry2, 92
EXPORT STDCALL, GetIpNetTable2, 93
EXPORT STDCALL, GetIpNetTable, 94
EXPORT STDCALL, GetIpPathEntry, 95
EXPORT STDCALL, GetIpPathTable, 96
EXPORT STDCALL, GetIpStatistics, 97
EXPORT STDCALL, GetIpStatisticsEx, 98
EXPORT STDCALL, GetMulticastIpAddressEntry, 99
EXPORT STDCALL, GetMulticastIpAddressTable, 100
EXPORT STDCALL, GetNetworkInformation, 101
EXPORT STDCALL, GetNetworkParams, 102
EXPORT STDCALL, GetNumberOfInterfaces, 103
EXPORT STDCALL, GetOwnerModuleFromPidAndInfo, 104
EXPORT STDCALL, GetOwnerModuleFromTcp6Entry, 105
EXPORT STDCALL, GetOwnerModuleFromTcpEntry, 106
EXPORT STDCALL, GetOwnerModuleFromUdp6Entry, 107
EXPORT STDCALL, GetOwnerModuleFromUdpEntry, 108
EXPORT STDCALL, GetPerAdapterInfo, 109
EXPORT STDCALL, GetPerTcp6ConnectionEStats, 110
EXPORT STDCALL, GetPerTcp6ConnectionStats, 111
EXPORT STDCALL, GetPerTcpConnectionEStats, 112
EXPORT STDCALL, GetPerTcpConnectionStats, 113
EXPORT STDCALL, GetRTTAndHopCount, 114
EXPORT STDCALL, GetSessionCompartmentId, 115
EXPORT STDCALL, GetTcp6Table2, 116
EXPORT STDCALL, GetTcp6Table, 117
EXPORT STDCALL, GetTcpStatistics, 118
EXPORT STDCALL, GetTcpStatisticsEx, 119
EXPORT STDCALL, GetTcpTable2, 120
EXPORT STDCALL, GetTcpTable, 121
EXPORT STDCALL, GetTeredoPort, 122
EXPORT STDCALL, GetUdp6Table, 123
EXPORT STDCALL, GetUdpStatistics, 124
EXPORT STDCALL, GetUdpStatisticsEx, 125
EXPORT STDCALL, GetUdpTable, 126
EXPORT STDCALL, GetUniDirectionalAdapterInfo, 127
EXPORT STDCALL, GetUnicastIpAddressEntry, 128
EXPORT STDCALL, GetUnicastIpAddressTable, 129
EXPORT STDCALL, Icmp6CreateFile, 130
EXPORT STDCALL, Icmp6ParseReplies, 131
EXPORT STDCALL, Icmp6SendEcho2, 132
EXPORT STDCALL, IcmpCloseHandle, 133
EXPORT STDCALL, IcmpCreateFile, 134
EXPORT STDCALL, IcmpParseReplies, 135
EXPORT STDCALL, IcmpSendEcho2, 136
EXPORT STDCALL, IcmpSendEcho2Ex, 137
EXPORT STDCALL, IcmpSendEcho, 138
EXPORT STDCALL, InitializeIpForwardEntry, 139
EXPORT STDCALL, InitializeIpInterfaceEntry, 140
EXPORT STDCALL, InitializeUnicastIpAddressEntry, 141
EXPORT STDCALL, InternalCleanupPersistentStore, 142
EXPORT STDCALL, InternalCreateAnycastIpAddressEntry, 143
EXPORT STDCALL, InternalCreateIpForwardEntry2, 144
EXPORT STDCALL, InternalCreateIpForwardEntry, 145
EXPORT STDCALL, InternalCreateIpNetEntry2, 146
EXPORT STDCALL, InternalCreateIpNetEntry, 147
EXPORT STDCALL, InternalCreateUnicastIpAddressEntry, 148
EXPORT STDCALL, InternalDeleteAnycastIpAddressEntry, 149
EXPORT STDCALL, InternalDeleteIpForwardEntry2, 150
EXPORT STDCALL, InternalDeleteIpForwardEntry, 151
EXPORT STDCALL, InternalDeleteIpNetEntry2, 152
EXPORT STDCALL, InternalDeleteIpNetEntry, 153
EXPORT STDCALL, InternalDeleteUnicastIpAddressEntry, 154
EXPORT STDCALL, InternalFindInterfaceByAddress, 155
EXPORT STDCALL, InternalGetAnycastIpAddressEntry, 156
EXPORT STDCALL, InternalGetAnycastIpAddressTable, 157
EXPORT STDCALL, InternalGetForwardIpTable2, 158
EXPORT STDCALL, InternalGetIfEntry2, 159
EXPORT STDCALL, InternalGetIfTable2, 160
EXPORT STDCALL, InternalGetIfTable, 161
EXPORT STDCALL, InternalGetIpAddrTable, 162
EXPORT STDCALL, InternalGetIpForwardEntry2, 163
EXPORT STDCALL, InternalGetIpForwardTable, 164
EXPORT STDCALL, InternalGetIpInterfaceEntry, 165
EXPORT STDCALL, InternalGetIpInterfaceTable, 166
EXPORT STDCALL, InternalGetIpNetEntry2, 167
EXPORT STDCALL, InternalGetIpNetTable2, 168
EXPORT STDCALL, InternalGetIpNetTable, 169
EXPORT STDCALL, InternalGetMulticastIpAddressEntry, 170
EXPORT STDCALL, InternalGetMulticastIpAddressTable, 171
EXPORT STDCALL, InternalGetTcp6Table2, 172
EXPORT STDCALL, InternalGetTcp6TableWithOwnerModule, 173
EXPORT STDCALL, InternalGetTcp6TableWithOwnerPid, 174
EXPORT STDCALL, InternalGetTcpTable2, 175
EXPORT STDCALL, InternalGetTcpTable, 176
EXPORT STDCALL, InternalGetTcpTableEx, 177
EXPORT STDCALL, InternalGetTcpTableWithOwnerModule, 178
EXPORT STDCALL, InternalGetTcpTableWithOwnerPid, 179
EXPORT STDCALL, InternalGetTunnelPhysicalAdapter, 180
EXPORT STDCALL, InternalGetUdp6TableWithOwnerModule, 181
EXPORT STDCALL, InternalGetUdp6TableWithOwnerPid, 182
EXPORT STDCALL, InternalGetUdpTable, 183
EXPORT STDCALL, InternalGetUdpTableEx, 184
EXPORT STDCALL, InternalGetUdpTableWithOwnerModule, 185
EXPORT STDCALL, InternalGetUdpTableWithOwnerPid, 186
EXPORT STDCALL, InternalGetUnicastIpAddressEntry, 187
EXPORT STDCALL, InternalGetUnicastIpAddressTable, 188
EXPORT STDCALL, InternalSetIfEntry, 189
EXPORT STDCALL, InternalSetIpForwardEntry2, 190
EXPORT STDCALL, InternalSetIpForwardEntry, 191
EXPORT STDCALL, InternalSetIpInterfaceEntry, 192
EXPORT STDCALL, InternalSetIpNetEntry2, 193
EXPORT STDCALL, InternalSetIpNetEntry, 194
EXPORT STDCALL, InternalSetIpStats, 195
EXPORT STDCALL, InternalSetTcpEntry, 196
EXPORT STDCALL, InternalSetTeredoPort, 197
EXPORT STDCALL, InternalSetUnicastIpAddressEntry, 198
EXPORT STDCALL, IpReleaseAddress, 199
EXPORT STDCALL, IpRenewAddress, 200
EXPORT STDCALL, LookupPersistentTcpPortReservation, 201
EXPORT STDCALL, LookupPersistentUdpPortReservation, 202
EXPORT STDCALL, NTPTimeToNTFileTime, 203
EXPORT STDCALL, NTTimeToNTPTime, 204
EXPORT STDCALL, NhGetGuidFromInterfaceName, 205
EXPORT STDCALL, NhGetInterfaceDescriptionFromGuid, 206
EXPORT STDCALL, NhGetInterfaceNameFromDeviceGuid, 207
EXPORT STDCALL, NhGetInterfaceNameFromGuid, 208
EXPORT STDCALL, NhpAllocateAndGetInterfaceInfoFromStack, 209
EXPORT STDCALL, NotifyAddrChange, 210
EXPORT STDCALL, NotifyIpInterfaceChange, 211
EXPORT STDCALL, NotifyRouteChange2, 212
EXPORT STDCALL, NotifyRouteChange, 213
EXPORT STDCALL, NotifyStableUnicastIpAddressTable, 214
EXPORT STDCALL, NotifyTeredoPortChange, 215
EXPORT STDCALL, NotifyUnicastIpAddressChange, 216
EXPORT STDCALL, ParseNetworkString, 217
EXPORT STDCALL, PfAddFiltersToInterface, 218
EXPORT STDCALL, PfAddGlobalFilterToInterface, 219
EXPORT STDCALL, PfBindInterfaceToIPAddress, 220
EXPORT STDCALL, PfBindInterfaceToIndex, 221
EXPORT STDCALL, PfCreateInterface, 222
EXPORT STDCALL, PfDeleteInterface, 223
EXPORT STDCALL, PfDeleteLog, 224
EXPORT STDCALL, PfGetInterfaceStatistics, 225
EXPORT STDCALL, PfMakeLog, 226
EXPORT STDCALL, PfRebindFilters, 227
EXPORT STDCALL, PfRemoveFilterHandles, 228
EXPORT STDCALL, PfRemoveFiltersFromInterface, 229
EXPORT STDCALL, PfRemoveGlobalFilterFromInterface, 230
EXPORT STDCALL, PfSetLogBuffer, 231
EXPORT STDCALL, PfTestPacket, 232
EXPORT STDCALL, PfUnBindInterface, 233
EXPORT STDCALL, ResolveIpNetEntry2, 234
EXPORT STDCALL, ResolveNeighbor, 235
EXPORT STDCALL, RestoreMediaSense, 236
EXPORT STDCALL, SendARP, 237
EXPORT STDCALL, SetAdapterIpAddress, 238
EXPORT STDCALL, SetCurrentThreadCompartmentId, 239
EXPORT STDCALL, SetIfEntry, 240
EXPORT STDCALL, SetIpForwardEntry2, 241
EXPORT STDCALL, SetIpForwardEntry, 242
EXPORT STDCALL, SetIpInterfaceEntry, 243
EXPORT STDCALL, SetIpNetEntry2, 244
EXPORT STDCALL, SetIpNetEntry, 245
EXPORT STDCALL, SetIpStatistics, 246
EXPORT STDCALL, SetIpStatisticsEx, 247
EXPORT STDCALL, SetIpTTL, 248
EXPORT STDCALL, SetNetworkInformation, 249
EXPORT STDCALL, SetPerTcp6ConnectionEStats, 250
EXPORT STDCALL, SetPerTcp6ConnectionStats, 251
EXPORT STDCALL, SetPerTcpConnectionEStats, 252
EXPORT STDCALL, SetPerTcpConnectionStats, 253
EXPORT STDCALL, SetSessionCompartmentId, 254
EXPORT STDCALL, SetTcpEntry, 255
EXPORT STDCALL, SetUnicastIpAddressEntry, 256
EXPORT STDCALL, UnenableRouter, 257
EXPORT STDCALL, do_echo_rep, 258
EXPORT STDCALL, do_echo_req, 259
EXPORT STDCALL, if_indextoname, 260
EXPORT STDCALL, if_nametoindex, 261
EXPORT STDCALL, register_icmp, 262

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
