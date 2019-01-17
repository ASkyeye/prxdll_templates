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

PRX_EXPORT stdcall, AddIPAddress, 1
PRX_EXPORT stdcall, AllocateAndGetInterfaceInfoFromStack, 2
PRX_EXPORT stdcall, AllocateAndGetIpAddrTableFromStack, 3
PRX_EXPORT stdcall, CPNatfwtCreateProviderInstance, 4
PRX_EXPORT stdcall, CPNatfwtDeregisterProviderInstance, 5
PRX_EXPORT stdcall, CPNatfwtDestroyProviderInstance, 6
PRX_EXPORT stdcall, CPNatfwtIndicateReceivedBuffers, 7
PRX_EXPORT stdcall, CPNatfwtRegisterProviderInstance, 8
PRX_EXPORT stdcall, CancelIPChangeNotify, 9
PRX_EXPORT stdcall, CancelMibChangeNotify2, 10
PRX_EXPORT stdcall, ConvertGuidToStringA, 11
PRX_EXPORT stdcall, ConvertGuidToStringW, 12
PRX_EXPORT stdcall, ConvertInterfaceAliasToLuid, 13
PRX_EXPORT stdcall, ConvertInterfaceGuidToLuid, 14
PRX_EXPORT stdcall, ConvertInterfaceIndexToLuid, 15
PRX_EXPORT stdcall, ConvertInterfaceLuidToAlias, 16
PRX_EXPORT stdcall, ConvertInterfaceLuidToGuid, 17
PRX_EXPORT stdcall, ConvertInterfaceLuidToIndex, 18
PRX_EXPORT stdcall, ConvertInterfaceLuidToNameA, 19
PRX_EXPORT stdcall, ConvertInterfaceLuidToNameW, 20
PRX_EXPORT stdcall, ConvertInterfaceNameToLuidA, 21
PRX_EXPORT stdcall, ConvertInterfaceNameToLuidW, 22
PRX_EXPORT stdcall, ConvertInterfacePhysicalAddressToLuid, 23
PRX_EXPORT stdcall, ConvertIpv4MaskToLength, 24
PRX_EXPORT stdcall, ConvertLengthToIpv4Mask, 25
PRX_EXPORT stdcall, ConvertRemoteInterfaceAliasToLuid, 26
PRX_EXPORT stdcall, ConvertRemoteInterfaceGuidToLuid, 27
PRX_EXPORT stdcall, ConvertRemoteInterfaceIndexToLuid, 28
PRX_EXPORT stdcall, ConvertRemoteInterfaceLuidToAlias, 29
PRX_EXPORT stdcall, ConvertRemoteInterfaceLuidToGuid, 30
PRX_EXPORT stdcall, ConvertRemoteInterfaceLuidToIndex, 31
PRX_EXPORT stdcall, ConvertStringToGuidA, 32
PRX_EXPORT stdcall, ConvertStringToGuidW, 33
PRX_EXPORT stdcall, ConvertStringToInterfacePhysicalAddress, 34
PRX_EXPORT stdcall, CreateAnycastIpAddressEntry, 35
PRX_EXPORT stdcall, CreateIpForwardEntry2, 36
PRX_EXPORT stdcall, CreateIpForwardEntry, 37
PRX_EXPORT stdcall, CreateIpNetEntry2, 38
PRX_EXPORT stdcall, CreateIpNetEntry, 39
PRX_EXPORT stdcall, CreatePersistentTcpPortReservation, 40
PRX_EXPORT stdcall, CreatePersistentUdpPortReservation, 41
PRX_EXPORT stdcall, CreateProxyArpEntry, 42
PRX_EXPORT stdcall, CreateSortedAddressPairs, 43
PRX_EXPORT stdcall, CreateUnicastIpAddressEntry, 44
PRX_EXPORT stdcall, DeleteAnycastIpAddressEntry, 45
PRX_EXPORT stdcall, DeleteIPAddress, 46
PRX_EXPORT stdcall, DeleteIpForwardEntry2, 47
PRX_EXPORT stdcall, DeleteIpForwardEntry, 48
PRX_EXPORT stdcall, DeleteIpNetEntry2, 49
PRX_EXPORT stdcall, DeleteIpNetEntry, 50
PRX_EXPORT stdcall, DeletePersistentTcpPortReservation, 51
PRX_EXPORT stdcall, DeletePersistentUdpPortReservation, 52
PRX_EXPORT stdcall, DeleteProxyArpEntry, 53
PRX_EXPORT stdcall, DeleteUnicastIpAddressEntry, 54
PRX_EXPORT stdcall, DisableMediaSense, 55
PRX_EXPORT stdcall, EnableRouter, 56
PRX_EXPORT stdcall, FlushIpNetTable2, 57
PRX_EXPORT stdcall, FlushIpNetTable, 58
PRX_EXPORT stdcall, FlushIpPathTable, 59
PRX_EXPORT stdcall, FreeMibTable, 60
PRX_EXPORT stdcall, GetAdapterIndex, 61
PRX_EXPORT stdcall, GetAdapterOrderMap, 62
PRX_EXPORT stdcall, GetAdaptersAddresses, 63
PRX_EXPORT stdcall, GetAdaptersInfo, 64
PRX_EXPORT stdcall, GetAnycastIpAddressEntry, 65
PRX_EXPORT stdcall, GetAnycastIpAddressTable, 66
PRX_EXPORT stdcall, GetBestInterface, 67
PRX_EXPORT stdcall, GetBestInterfaceEx, 68
PRX_EXPORT stdcall, GetBestRoute2, 69
PRX_EXPORT stdcall, GetBestRoute, 70
PRX_EXPORT stdcall, GetCurrentThreadCompartmentId, 71
PRX_EXPORT stdcall, GetExtendedTcpTable, 72
PRX_EXPORT stdcall, GetExtendedUdpTable, 73
PRX_EXPORT stdcall, GetFriendlyIfIndex, 74
PRX_EXPORT stdcall, GetIcmpStatistics, 75
PRX_EXPORT stdcall, GetIcmpStatisticsEx, 76
PRX_EXPORT stdcall, GetIfEntry2, 77
PRX_EXPORT stdcall, GetIfEntry, 78
PRX_EXPORT stdcall, GetIfStackTable, 79
PRX_EXPORT stdcall, GetIfTable2, 80
PRX_EXPORT stdcall, GetIfTable2Ex, 81
PRX_EXPORT stdcall, GetIfTable, 82
PRX_EXPORT stdcall, GetInterfaceInfo, 83
PRX_EXPORT stdcall, GetInvertedIfStackTable, 84
PRX_EXPORT stdcall, GetIpAddrTable, 85
PRX_EXPORT stdcall, GetIpErrorString, 86
PRX_EXPORT stdcall, GetIpForwardEntry2, 87
PRX_EXPORT stdcall, GetIpForwardTable2, 88
PRX_EXPORT stdcall, GetIpForwardTable, 89
PRX_EXPORT stdcall, GetIpInterfaceEntry, 90
PRX_EXPORT stdcall, GetIpInterfaceTable, 91
PRX_EXPORT stdcall, GetIpNetEntry2, 92
PRX_EXPORT stdcall, GetIpNetTable2, 93
PRX_EXPORT stdcall, GetIpNetTable, 94
PRX_EXPORT stdcall, GetIpPathEntry, 95
PRX_EXPORT stdcall, GetIpPathTable, 96
PRX_EXPORT stdcall, GetIpStatistics, 97
PRX_EXPORT stdcall, GetIpStatisticsEx, 98
PRX_EXPORT stdcall, GetMulticastIpAddressEntry, 99
PRX_EXPORT stdcall, GetMulticastIpAddressTable, 100
PRX_EXPORT stdcall, GetNetworkInformation, 101
PRX_EXPORT stdcall, GetNetworkParams, 102
PRX_EXPORT stdcall, GetNumberOfInterfaces, 103
PRX_EXPORT stdcall, GetOwnerModuleFromPidAndInfo, 104
PRX_EXPORT stdcall, GetOwnerModuleFromTcp6Entry, 105
PRX_EXPORT stdcall, GetOwnerModuleFromTcpEntry, 106
PRX_EXPORT stdcall, GetOwnerModuleFromUdp6Entry, 107
PRX_EXPORT stdcall, GetOwnerModuleFromUdpEntry, 108
PRX_EXPORT stdcall, GetPerAdapterInfo, 109
PRX_EXPORT stdcall, GetPerTcp6ConnectionEStats, 110
PRX_EXPORT stdcall, GetPerTcp6ConnectionStats, 111
PRX_EXPORT stdcall, GetPerTcpConnectionEStats, 112
PRX_EXPORT stdcall, GetPerTcpConnectionStats, 113
PRX_EXPORT stdcall, GetRTTAndHopCount, 114
PRX_EXPORT stdcall, GetSessionCompartmentId, 115
PRX_EXPORT stdcall, GetTcp6Table2, 116
PRX_EXPORT stdcall, GetTcp6Table, 117
PRX_EXPORT stdcall, GetTcpStatistics, 118
PRX_EXPORT stdcall, GetTcpStatisticsEx, 119
PRX_EXPORT stdcall, GetTcpTable2, 120
PRX_EXPORT stdcall, GetTcpTable, 121
PRX_EXPORT stdcall, GetTeredoPort, 122
PRX_EXPORT stdcall, GetUdp6Table, 123
PRX_EXPORT stdcall, GetUdpStatistics, 124
PRX_EXPORT stdcall, GetUdpStatisticsEx, 125
PRX_EXPORT stdcall, GetUdpTable, 126
PRX_EXPORT stdcall, GetUniDirectionalAdapterInfo, 127
PRX_EXPORT stdcall, GetUnicastIpAddressEntry, 128
PRX_EXPORT stdcall, GetUnicastIpAddressTable, 129
PRX_EXPORT stdcall, Icmp6CreateFile, 130
PRX_EXPORT stdcall, Icmp6ParseReplies, 131
PRX_EXPORT stdcall, Icmp6SendEcho2, 132
PRX_EXPORT stdcall, IcmpCloseHandle, 133
PRX_EXPORT stdcall, IcmpCreateFile, 134
PRX_EXPORT stdcall, IcmpParseReplies, 135
PRX_EXPORT stdcall, IcmpSendEcho2, 136
PRX_EXPORT stdcall, IcmpSendEcho2Ex, 137
PRX_EXPORT stdcall, IcmpSendEcho, 138
PRX_EXPORT stdcall, InitializeIpForwardEntry, 139
PRX_EXPORT stdcall, InitializeIpInterfaceEntry, 140
PRX_EXPORT stdcall, InitializeUnicastIpAddressEntry, 141
PRX_EXPORT stdcall, InternalCleanupPersistentStore, 142
PRX_EXPORT stdcall, InternalCreateAnycastIpAddressEntry, 143
PRX_EXPORT stdcall, InternalCreateIpForwardEntry2, 144
PRX_EXPORT stdcall, InternalCreateIpForwardEntry, 145
PRX_EXPORT stdcall, InternalCreateIpNetEntry2, 146
PRX_EXPORT stdcall, InternalCreateIpNetEntry, 147
PRX_EXPORT stdcall, InternalCreateUnicastIpAddressEntry, 148
PRX_EXPORT stdcall, InternalDeleteAnycastIpAddressEntry, 149
PRX_EXPORT stdcall, InternalDeleteIpForwardEntry2, 150
PRX_EXPORT stdcall, InternalDeleteIpForwardEntry, 151
PRX_EXPORT stdcall, InternalDeleteIpNetEntry2, 152
PRX_EXPORT stdcall, InternalDeleteIpNetEntry, 153
PRX_EXPORT stdcall, InternalDeleteUnicastIpAddressEntry, 154
PRX_EXPORT stdcall, InternalFindInterfaceByAddress, 155
PRX_EXPORT stdcall, InternalGetAnycastIpAddressEntry, 156
PRX_EXPORT stdcall, InternalGetAnycastIpAddressTable, 157
PRX_EXPORT stdcall, InternalGetForwardIpTable2, 158
PRX_EXPORT stdcall, InternalGetIfEntry2, 159
PRX_EXPORT stdcall, InternalGetIfTable2, 160
PRX_EXPORT stdcall, InternalGetIfTable, 161
PRX_EXPORT stdcall, InternalGetIpAddrTable, 162
PRX_EXPORT stdcall, InternalGetIpForwardEntry2, 163
PRX_EXPORT stdcall, InternalGetIpForwardTable, 164
PRX_EXPORT stdcall, InternalGetIpInterfaceEntry, 165
PRX_EXPORT stdcall, InternalGetIpInterfaceTable, 166
PRX_EXPORT stdcall, InternalGetIpNetEntry2, 167
PRX_EXPORT stdcall, InternalGetIpNetTable2, 168
PRX_EXPORT stdcall, InternalGetIpNetTable, 169
PRX_EXPORT stdcall, InternalGetMulticastIpAddressEntry, 170
PRX_EXPORT stdcall, InternalGetMulticastIpAddressTable, 171
PRX_EXPORT stdcall, InternalGetTcp6Table2, 172
PRX_EXPORT stdcall, InternalGetTcp6TableWithOwnerModule, 173
PRX_EXPORT stdcall, InternalGetTcp6TableWithOwnerPid, 174
PRX_EXPORT stdcall, InternalGetTcpTable2, 175
PRX_EXPORT stdcall, InternalGetTcpTable, 176
PRX_EXPORT stdcall, InternalGetTcpTableEx, 177
PRX_EXPORT stdcall, InternalGetTcpTableWithOwnerModule, 178
PRX_EXPORT stdcall, InternalGetTcpTableWithOwnerPid, 179
PRX_EXPORT stdcall, InternalGetTunnelPhysicalAdapter, 180
PRX_EXPORT stdcall, InternalGetUdp6TableWithOwnerModule, 181
PRX_EXPORT stdcall, InternalGetUdp6TableWithOwnerPid, 182
PRX_EXPORT stdcall, InternalGetUdpTable, 183
PRX_EXPORT stdcall, InternalGetUdpTableEx, 184
PRX_EXPORT stdcall, InternalGetUdpTableWithOwnerModule, 185
PRX_EXPORT stdcall, InternalGetUdpTableWithOwnerPid, 186
PRX_EXPORT stdcall, InternalGetUnicastIpAddressEntry, 187
PRX_EXPORT stdcall, InternalGetUnicastIpAddressTable, 188
PRX_EXPORT stdcall, InternalSetIfEntry, 189
PRX_EXPORT stdcall, InternalSetIpForwardEntry2, 190
PRX_EXPORT stdcall, InternalSetIpForwardEntry, 191
PRX_EXPORT stdcall, InternalSetIpInterfaceEntry, 192
PRX_EXPORT stdcall, InternalSetIpNetEntry2, 193
PRX_EXPORT stdcall, InternalSetIpNetEntry, 194
PRX_EXPORT stdcall, InternalSetIpStats, 195
PRX_EXPORT stdcall, InternalSetTcpEntry, 196
PRX_EXPORT stdcall, InternalSetTeredoPort, 197
PRX_EXPORT stdcall, InternalSetUnicastIpAddressEntry, 198
PRX_EXPORT stdcall, IpReleaseAddress, 199
PRX_EXPORT stdcall, IpRenewAddress, 200
PRX_EXPORT stdcall, LookupPersistentTcpPortReservation, 201
PRX_EXPORT stdcall, LookupPersistentUdpPortReservation, 202
PRX_EXPORT stdcall, NTPTimeToNTFileTime, 203
PRX_EXPORT stdcall, NTTimeToNTPTime, 204
PRX_EXPORT stdcall, NhGetGuidFromInterfaceName, 205
PRX_EXPORT stdcall, NhGetInterfaceDescriptionFromGuid, 206
PRX_EXPORT stdcall, NhGetInterfaceNameFromDeviceGuid, 207
PRX_EXPORT stdcall, NhGetInterfaceNameFromGuid, 208
PRX_EXPORT stdcall, NhpAllocateAndGetInterfaceInfoFromStack, 209
PRX_EXPORT stdcall, NotifyAddrChange, 210
PRX_EXPORT stdcall, NotifyIpInterfaceChange, 211
PRX_EXPORT stdcall, NotifyRouteChange2, 212
PRX_EXPORT stdcall, NotifyRouteChange, 213
PRX_EXPORT stdcall, NotifyStableUnicastIpAddressTable, 214
PRX_EXPORT stdcall, NotifyTeredoPortChange, 215
PRX_EXPORT stdcall, NotifyUnicastIpAddressChange, 216
PRX_EXPORT stdcall, ParseNetworkString, 217
PRX_EXPORT stdcall, PfAddFiltersToInterface, 218
PRX_EXPORT stdcall, PfAddGlobalFilterToInterface, 219
PRX_EXPORT stdcall, PfBindInterfaceToIPAddress, 220
PRX_EXPORT stdcall, PfBindInterfaceToIndex, 221
PRX_EXPORT stdcall, PfCreateInterface, 222
PRX_EXPORT stdcall, PfDeleteInterface, 223
PRX_EXPORT stdcall, PfDeleteLog, 224
PRX_EXPORT stdcall, PfGetInterfaceStatistics, 225
PRX_EXPORT stdcall, PfMakeLog, 226
PRX_EXPORT stdcall, PfRebindFilters, 227
PRX_EXPORT stdcall, PfRemoveFilterHandles, 228
PRX_EXPORT stdcall, PfRemoveFiltersFromInterface, 229
PRX_EXPORT stdcall, PfRemoveGlobalFilterFromInterface, 230
PRX_EXPORT stdcall, PfSetLogBuffer, 231
PRX_EXPORT stdcall, PfTestPacket, 232
PRX_EXPORT stdcall, PfUnBindInterface, 233
PRX_EXPORT stdcall, ResolveIpNetEntry2, 234
PRX_EXPORT stdcall, ResolveNeighbor, 235
PRX_EXPORT stdcall, RestoreMediaSense, 236
PRX_EXPORT stdcall, SendARP, 237
PRX_EXPORT stdcall, SetAdapterIpAddress, 238
PRX_EXPORT stdcall, SetCurrentThreadCompartmentId, 239
PRX_EXPORT stdcall, SetIfEntry, 240
PRX_EXPORT stdcall, SetIpForwardEntry2, 241
PRX_EXPORT stdcall, SetIpForwardEntry, 242
PRX_EXPORT stdcall, SetIpInterfaceEntry, 243
PRX_EXPORT stdcall, SetIpNetEntry2, 244
PRX_EXPORT stdcall, SetIpNetEntry, 245
PRX_EXPORT stdcall, SetIpStatistics, 246
PRX_EXPORT stdcall, SetIpStatisticsEx, 247
PRX_EXPORT stdcall, SetIpTTL, 248
PRX_EXPORT stdcall, SetNetworkInformation, 249
PRX_EXPORT stdcall, SetPerTcp6ConnectionEStats, 250
PRX_EXPORT stdcall, SetPerTcp6ConnectionStats, 251
PRX_EXPORT stdcall, SetPerTcpConnectionEStats, 252
PRX_EXPORT stdcall, SetPerTcpConnectionStats, 253
PRX_EXPORT stdcall, SetSessionCompartmentId, 254
PRX_EXPORT stdcall, SetTcpEntry, 255
PRX_EXPORT stdcall, SetUnicastIpAddressEntry, 256
PRX_EXPORT stdcall, UnenableRouter, 257
PRX_EXPORT stdcall, do_echo_rep, 258
PRX_EXPORT stdcall, do_echo_req, 259
PRX_EXPORT stdcall, if_indextoname, 260
PRX_EXPORT stdcall, if_nametoindex, 261
PRX_EXPORT stdcall, register_icmp, 262

end
