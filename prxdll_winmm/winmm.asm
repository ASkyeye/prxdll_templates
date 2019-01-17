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

PRX_EXPORT stdcall, WINMM_2, 2
PRX_EXPORT stdcall, CloseDriver, 3
PRX_EXPORT stdcall, DefDriverProc, 4
PRX_EXPORT stdcall, DriverCallback, 5
PRX_EXPORT stdcall, DrvGetModuleHandle, 6
PRX_EXPORT stdcall, GetDriverModuleHandle, 7
PRX_EXPORT32 STDCALL, NotifyCallbackData, 8
PRX_EXPORT stdcall, OpenDriver, 9, 8
PRX_EXPORT stdcall, PlaySound, 10, 9
PRX_EXPORT stdcall, PlaySoundA, 11, 10
PRX_EXPORT stdcall, PlaySoundW, 12, 11
PRX_EXPORT stdcall, SendDriverMessage, 13, 12
PRX_EXPORT32 STDCALL, WOW32DriverCallback, 14
PRX_EXPORT32 STDCALL, WOW32ResolveMultiMediaHandle, 15
PRX_EXPORT stdcall, WOWAppExit, 16, 13
PRX_EXPORT32 STDCALL, aux32Message, 17
PRX_EXPORT stdcall, auxGetDevCapsA, 18, 14
PRX_EXPORT stdcall, auxGetDevCapsW, 19, 15
PRX_EXPORT stdcall, auxGetNumDevs, 20, 16
PRX_EXPORT stdcall, auxGetVolume, 21, 17
PRX_EXPORT stdcall, auxOutMessage, 22, 18
PRX_EXPORT stdcall, auxSetVolume, 23, 19
PRX_EXPORT32 STDCALL, joy32Message, 24
PRX_EXPORT stdcall, joyConfigChanged, 25, 20
PRX_EXPORT stdcall, joyGetDevCapsA, 26, 21
PRX_EXPORT stdcall, joyGetDevCapsW, 27, 22
PRX_EXPORT stdcall, joyGetNumDevs, 28, 23
PRX_EXPORT stdcall, joyGetPos, 29, 24
PRX_EXPORT stdcall, joyGetPosEx, 30, 25
PRX_EXPORT stdcall, joyGetThreshold, 31, 26
PRX_EXPORT stdcall, joyReleaseCapture, 32, 27
PRX_EXPORT stdcall, joySetCapture, 33, 28
PRX_EXPORT stdcall, joySetThreshold, 34, 29
PRX_EXPORT32 STDCALL, mci32Message, 35
PRX_EXPORT stdcall, mciDriverNotify, 36, 30
PRX_EXPORT stdcall, mciDriverYield, 37, 31
PRX_EXPORT stdcall, mciExecute, 38, 32
PRX_EXPORT stdcall, mciFreeCommandResource, 39, 33
PRX_EXPORT stdcall, mciGetCreatorTask, 40, 34
PRX_EXPORT stdcall, mciGetDeviceIDA, 41, 35
PRX_EXPORT stdcall, mciGetDeviceIDFromElementIDA, 42, 36
PRX_EXPORT stdcall, mciGetDeviceIDFromElementIDW, 43, 37
PRX_EXPORT stdcall, mciGetDeviceIDW, 44, 38
PRX_EXPORT stdcall, mciGetDriverData, 45, 39
PRX_EXPORT stdcall, mciGetErrorStringA, 46, 40
PRX_EXPORT stdcall, mciGetErrorStringW, 47, 41
PRX_EXPORT stdcall, mciGetYieldProc, 48, 42
PRX_EXPORT stdcall, mciLoadCommandResource, 49, 43
PRX_EXPORT stdcall, mciSendCommandA, 50, 44
PRX_EXPORT stdcall, mciSendCommandW, 51, 45
PRX_EXPORT stdcall, mciSendStringA, 52, 46
PRX_EXPORT stdcall, mciSendStringW, 53, 47
PRX_EXPORT stdcall, mciSetDriverData, 54, 48
PRX_EXPORT stdcall, mciSetYieldProc, 55, 49
PRX_EXPORT32 STDCALL, mid32Message, 56
PRX_EXPORT stdcall, midiConnect, 57, 50
PRX_EXPORT stdcall, midiDisconnect, 58, 51
PRX_EXPORT stdcall, midiInAddBuffer, 59, 52
PRX_EXPORT stdcall, midiInClose, 60, 53
PRX_EXPORT stdcall, midiInGetDevCapsA, 61, 54
PRX_EXPORT stdcall, midiInGetDevCapsW, 62, 55
PRX_EXPORT stdcall, midiInGetErrorTextA, 63, 56
PRX_EXPORT stdcall, midiInGetErrorTextW, 64, 57
PRX_EXPORT stdcall, midiInGetID, 65, 58
PRX_EXPORT stdcall, midiInGetNumDevs, 66, 59
PRX_EXPORT stdcall, midiInMessage, 67, 60
PRX_EXPORT stdcall, midiInOpen, 68, 61
PRX_EXPORT stdcall, midiInPrepareHeader, 69, 62
PRX_EXPORT stdcall, midiInReset, 70, 63
PRX_EXPORT stdcall, midiInStart, 71, 64
PRX_EXPORT stdcall, midiInStop, 72, 65
PRX_EXPORT stdcall, midiInUnprepareHeader, 73, 66
PRX_EXPORT stdcall, midiOutCacheDrumPatches, 74, 67
PRX_EXPORT stdcall, midiOutCachePatches, 75, 68
PRX_EXPORT stdcall, midiOutClose, 76, 69
PRX_EXPORT stdcall, midiOutGetDevCapsA, 77, 70
PRX_EXPORT stdcall, midiOutGetDevCapsW, 78, 71
PRX_EXPORT stdcall, midiOutGetErrorTextA, 79, 72
PRX_EXPORT stdcall, midiOutGetErrorTextW, 80, 73
PRX_EXPORT stdcall, midiOutGetID, 81, 74
PRX_EXPORT stdcall, midiOutGetNumDevs, 82, 75
PRX_EXPORT stdcall, midiOutGetVolume, 83, 76
PRX_EXPORT stdcall, midiOutLongMsg, 84, 77
PRX_EXPORT stdcall, midiOutMessage, 85, 78
PRX_EXPORT stdcall, midiOutOpen, 86, 79
PRX_EXPORT stdcall, midiOutPrepareHeader, 87, 80
PRX_EXPORT stdcall, midiOutReset, 88, 81
PRX_EXPORT stdcall, midiOutSetVolume, 89, 82
PRX_EXPORT stdcall, midiOutShortMsg, 90, 83
PRX_EXPORT stdcall, midiOutUnprepareHeader, 91, 84
PRX_EXPORT stdcall, midiStreamClose, 92, 85
PRX_EXPORT stdcall, midiStreamOpen, 93, 86
PRX_EXPORT stdcall, midiStreamOut, 94, 87
PRX_EXPORT stdcall, midiStreamPause, 95, 88
PRX_EXPORT stdcall, midiStreamPosition, 96, 89
PRX_EXPORT stdcall, midiStreamProperty, 97, 90
PRX_EXPORT stdcall, midiStreamRestart, 98, 91
PRX_EXPORT stdcall, midiStreamStop, 99, 92
PRX_EXPORT stdcall, mixerClose, 100, 93
PRX_EXPORT stdcall, mixerGetControlDetailsA, 101, 94
PRX_EXPORT stdcall, mixerGetControlDetailsW, 102, 95
PRX_EXPORT stdcall, mixerGetDevCapsA, 103, 96
PRX_EXPORT stdcall, mixerGetDevCapsW, 104, 97
PRX_EXPORT stdcall, mixerGetID, 105, 98
PRX_EXPORT stdcall, mixerGetLineControlsA, 106, 99
PRX_EXPORT stdcall, mixerGetLineControlsW, 107, 100
PRX_EXPORT stdcall, mixerGetLineInfoA, 108, 101
PRX_EXPORT stdcall, mixerGetLineInfoW, 109, 102
PRX_EXPORT stdcall, mixerGetNumDevs, 110, 103
PRX_EXPORT stdcall, mixerMessage, 111, 104
PRX_EXPORT stdcall, mixerOpen, 112, 105
PRX_EXPORT stdcall, mixerSetControlDetails, 113, 106
PRX_EXPORT stdcall, mmDrvInstall, 114, 107
PRX_EXPORT stdcall, mmGetCurrentTask, 115, 108
PRX_EXPORT stdcall, mmTaskBlock, 116, 109
PRX_EXPORT stdcall, mmTaskCreate, 117, 110
PRX_EXPORT stdcall, mmTaskSignal, 118, 111
PRX_EXPORT stdcall, mmTaskYield, 119, 112
PRX_EXPORT stdcall, mmioAdvance, 120, 113
PRX_EXPORT stdcall, mmioAscend, 121, 114
PRX_EXPORT stdcall, mmioClose, 122, 115
PRX_EXPORT stdcall, mmioCreateChunk, 123, 116
PRX_EXPORT stdcall, mmioDescend, 124, 117
PRX_EXPORT stdcall, mmioFlush, 125, 118
PRX_EXPORT stdcall, mmioGetInfo, 126, 119
PRX_EXPORT stdcall, mmioInstallIOProcA, 127, 120
PRX_EXPORT stdcall, mmioInstallIOProcW, 128, 121
PRX_EXPORT stdcall, mmioOpenA, 129, 122
PRX_EXPORT stdcall, mmioOpenW, 130, 123
PRX_EXPORT stdcall, mmioRead, 131, 124
PRX_EXPORT stdcall, mmioRenameA, 132, 125
PRX_EXPORT stdcall, mmioRenameW, 133, 126
PRX_EXPORT stdcall, mmioSeek, 134, 127
PRX_EXPORT stdcall, mmioSendMessage, 135, 128
PRX_EXPORT stdcall, mmioSetBuffer, 136, 129
PRX_EXPORT stdcall, mmioSetInfo, 137, 130
PRX_EXPORT stdcall, mmioStringToFOURCCA, 138, 131
PRX_EXPORT stdcall, mmioStringToFOURCCW, 139, 132
PRX_EXPORT stdcall, mmioWrite, 140, 133
PRX_EXPORT stdcall, mmsystemGetVersion, 141, 134
PRX_EXPORT32 STDCALL, mod32Message, 142
PRX_EXPORT32 STDCALL, mxd32Message, 143
PRX_EXPORT stdcall, sndPlaySoundA, 144, 135
PRX_EXPORT stdcall, sndPlaySoundW, 145, 136
PRX_EXPORT32 STDCALL, tid32Message, 146
PRX_EXPORT stdcall, timeBeginPeriod, 147, 137
PRX_EXPORT stdcall, timeEndPeriod, 148, 138
PRX_EXPORT stdcall, timeGetDevCaps, 149, 139
PRX_EXPORT stdcall, timeGetSystemTime, 150, 140
PRX_EXPORT stdcall, timeGetTime, 151, 141
PRX_EXPORT stdcall, timeKillEvent, 152, 142
PRX_EXPORT stdcall, timeSetEvent, 153, 143
PRX_EXPORT stdcall, waveInAddBuffer, 154, 144
PRX_EXPORT stdcall, waveInClose, 155, 145
PRX_EXPORT stdcall, waveInGetDevCapsA, 156, 146
PRX_EXPORT stdcall, waveInGetDevCapsW, 157, 147
PRX_EXPORT stdcall, waveInGetErrorTextA, 158, 148
PRX_EXPORT stdcall, waveInGetErrorTextW, 159, 149
PRX_EXPORT stdcall, waveInGetID, 160, 150
PRX_EXPORT stdcall, waveInGetNumDevs, 161, 151
PRX_EXPORT stdcall, waveInGetPosition, 162, 152
PRX_EXPORT stdcall, waveInMessage, 163, 153
PRX_EXPORT stdcall, waveInOpen, 164, 154
PRX_EXPORT stdcall, waveInPrepareHeader, 165, 155
PRX_EXPORT stdcall, waveInReset, 166, 156
PRX_EXPORT stdcall, waveInStart, 167, 157
PRX_EXPORT stdcall, waveInStop, 168, 158
PRX_EXPORT stdcall, waveInUnprepareHeader, 169, 159
PRX_EXPORT stdcall, waveOutBreakLoop, 170, 160
PRX_EXPORT stdcall, waveOutClose, 171, 161
PRX_EXPORT stdcall, waveOutGetDevCapsA, 172, 162
PRX_EXPORT stdcall, waveOutGetDevCapsW, 173, 163
PRX_EXPORT stdcall, waveOutGetErrorTextA, 174, 164
PRX_EXPORT stdcall, waveOutGetErrorTextW, 175, 165
PRX_EXPORT stdcall, waveOutGetID, 176, 166
PRX_EXPORT stdcall, waveOutGetNumDevs, 177, 167
PRX_EXPORT stdcall, waveOutGetPitch, 178, 168
PRX_EXPORT stdcall, waveOutGetPlaybackRate, 179, 169
PRX_EXPORT stdcall, waveOutGetPosition, 180, 170
PRX_EXPORT stdcall, waveOutGetVolume, 181, 171
PRX_EXPORT stdcall, waveOutMessage, 182, 172
PRX_EXPORT stdcall, waveOutOpen, 183, 173
PRX_EXPORT stdcall, waveOutPause, 184, 174
PRX_EXPORT stdcall, waveOutPrepareHeader, 185, 175
PRX_EXPORT stdcall, waveOutReset, 186, 176
PRX_EXPORT stdcall, waveOutRestart, 187, 177
PRX_EXPORT stdcall, waveOutSetPitch, 188, 178
PRX_EXPORT stdcall, waveOutSetPlaybackRate, 189, 179
PRX_EXPORT stdcall, waveOutSetVolume, 190, 180
PRX_EXPORT stdcall, waveOutUnprepareHeader, 191, 181
PRX_EXPORT stdcall, waveOutWrite, 192, 182
PRX_EXPORT32 STDCALL, wid32Message, 193
PRX_EXPORT32 STDCALL, wod32Message, 194

end
