IFNDEF _M_X64
    .MODEL FLAT
    .SAFESEH SEH_handler
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

EXPORT STDCALL, WINMM_2, 2
EXPORT STDCALL, CloseDriver, 3
EXPORT STDCALL, DefDriverProc, 4
EXPORT STDCALL, DriverCallback, 5
EXPORT STDCALL, DrvGetModuleHandle, 6
EXPORT STDCALL, GetDriverModuleHandle, 7
EXPORT32 STDCALL, NotifyCallbackData, 8
EXPORT STDCALL, OpenDriver, 9, 8
EXPORT STDCALL, PlaySound, 10, 9
EXPORT STDCALL, PlaySoundA, 11, 10
EXPORT STDCALL, PlaySoundW, 12, 11
EXPORT STDCALL, SendDriverMessage, 13, 12
EXPORT32 STDCALL, WOW32DriverCallback, 14
EXPORT32 STDCALL, WOW32ResolveMultiMediaHandle, 15
EXPORT STDCALL, WOWAppExit, 16, 13
EXPORT32 STDCALL, aux32Message, 17
EXPORT STDCALL, auxGetDevCapsA, 18, 14
EXPORT STDCALL, auxGetDevCapsW, 19, 15
EXPORT STDCALL, auxGetNumDevs, 20, 16
EXPORT STDCALL, auxGetVolume, 21, 17
EXPORT STDCALL, auxOutMessage, 22, 18
EXPORT STDCALL, auxSetVolume, 23, 19
EXPORT32 STDCALL, joy32Message, 24
EXPORT STDCALL, joyConfigChanged, 25, 20
EXPORT STDCALL, joyGetDevCapsA, 26, 21
EXPORT STDCALL, joyGetDevCapsW, 27, 22
EXPORT STDCALL, joyGetNumDevs, 28, 23
EXPORT STDCALL, joyGetPos, 29, 24
EXPORT STDCALL, joyGetPosEx, 30, 25
EXPORT STDCALL, joyGetThreshold, 31, 26
EXPORT STDCALL, joyReleaseCapture, 32, 27
EXPORT STDCALL, joySetCapture, 33, 28
EXPORT STDCALL, joySetThreshold, 34, 29
EXPORT32 STDCALL, mci32Message, 35
EXPORT STDCALL, mciDriverNotify, 36, 30
EXPORT STDCALL, mciDriverYield, 37, 31
EXPORT STDCALL, mciExecute, 38, 32
EXPORT STDCALL, mciFreeCommandResource, 39, 33
EXPORT STDCALL, mciGetCreatorTask, 40, 34
EXPORT STDCALL, mciGetDeviceIDA, 41, 35
EXPORT STDCALL, mciGetDeviceIDFromElementIDA, 42, 36
EXPORT STDCALL, mciGetDeviceIDFromElementIDW, 43, 37
EXPORT STDCALL, mciGetDeviceIDW, 44, 38
EXPORT STDCALL, mciGetDriverData, 45, 39
EXPORT STDCALL, mciGetErrorStringA, 46, 40
EXPORT STDCALL, mciGetErrorStringW, 47, 41
EXPORT STDCALL, mciGetYieldProc, 48, 42
EXPORT STDCALL, mciLoadCommandResource, 49, 43
EXPORT STDCALL, mciSendCommandA, 50, 44
EXPORT STDCALL, mciSendCommandW, 51, 45
EXPORT STDCALL, mciSendStringA, 52, 46
EXPORT STDCALL, mciSendStringW, 53, 47
EXPORT STDCALL, mciSetDriverData, 54, 48
EXPORT STDCALL, mciSetYieldProc, 55, 49
EXPORT32 STDCALL, mid32Message, 56
EXPORT STDCALL, midiConnect, 57, 50
EXPORT STDCALL, midiDisconnect, 58, 51
EXPORT STDCALL, midiInAddBuffer, 59, 52
EXPORT STDCALL, midiInClose, 60, 53
EXPORT STDCALL, midiInGetDevCapsA, 61, 54
EXPORT STDCALL, midiInGetDevCapsW, 62, 55
EXPORT STDCALL, midiInGetErrorTextA, 63, 56
EXPORT STDCALL, midiInGetErrorTextW, 64, 57
EXPORT STDCALL, midiInGetID, 65, 58
EXPORT STDCALL, midiInGetNumDevs, 66, 59
EXPORT STDCALL, midiInMessage, 67, 60
EXPORT STDCALL, midiInOpen, 68, 61
EXPORT STDCALL, midiInPrepareHeader, 69, 62
EXPORT STDCALL, midiInReset, 70, 63
EXPORT STDCALL, midiInStart, 71, 64
EXPORT STDCALL, midiInStop, 72, 65
EXPORT STDCALL, midiInUnprepareHeader, 73, 66
EXPORT STDCALL, midiOutCacheDrumPatches, 74, 67
EXPORT STDCALL, midiOutCachePatches, 75, 68
EXPORT STDCALL, midiOutClose, 76, 69
EXPORT STDCALL, midiOutGetDevCapsA, 77, 70
EXPORT STDCALL, midiOutGetDevCapsW, 78, 71
EXPORT STDCALL, midiOutGetErrorTextA, 79, 72
EXPORT STDCALL, midiOutGetErrorTextW, 80, 73
EXPORT STDCALL, midiOutGetID, 81, 74
EXPORT STDCALL, midiOutGetNumDevs, 82, 75
EXPORT STDCALL, midiOutGetVolume, 83, 76
EXPORT STDCALL, midiOutLongMsg, 84, 77
EXPORT STDCALL, midiOutMessage, 85, 78
EXPORT STDCALL, midiOutOpen, 86, 79
EXPORT STDCALL, midiOutPrepareHeader, 87, 80
EXPORT STDCALL, midiOutReset, 88, 81
EXPORT STDCALL, midiOutSetVolume, 89, 82
EXPORT STDCALL, midiOutShortMsg, 90, 83
EXPORT STDCALL, midiOutUnprepareHeader, 91, 84
EXPORT STDCALL, midiStreamClose, 92, 85
EXPORT STDCALL, midiStreamOpen, 93, 86
EXPORT STDCALL, midiStreamOut, 94, 87
EXPORT STDCALL, midiStreamPause, 95, 88
EXPORT STDCALL, midiStreamPosition, 96, 89
EXPORT STDCALL, midiStreamProperty, 97, 90
EXPORT STDCALL, midiStreamRestart, 98, 91
EXPORT STDCALL, midiStreamStop, 99, 92
EXPORT STDCALL, mixerClose, 100, 93
EXPORT STDCALL, mixerGetControlDetailsA, 101, 94
EXPORT STDCALL, mixerGetControlDetailsW, 102, 95
EXPORT STDCALL, mixerGetDevCapsA, 103, 96
EXPORT STDCALL, mixerGetDevCapsW, 104, 97
EXPORT STDCALL, mixerGetID, 105, 98
EXPORT STDCALL, mixerGetLineControlsA, 106, 99
EXPORT STDCALL, mixerGetLineControlsW, 107, 100
EXPORT STDCALL, mixerGetLineInfoA, 108, 101
EXPORT STDCALL, mixerGetLineInfoW, 109, 102
EXPORT STDCALL, mixerGetNumDevs, 110, 103
EXPORT STDCALL, mixerMessage, 111, 104
EXPORT STDCALL, mixerOpen, 112, 105
EXPORT STDCALL, mixerSetControlDetails, 113, 106
EXPORT STDCALL, mmDrvInstall, 114, 107
EXPORT STDCALL, mmGetCurrentTask, 115, 108
EXPORT STDCALL, mmTaskBlock, 116, 109
EXPORT STDCALL, mmTaskCreate, 117, 110
EXPORT STDCALL, mmTaskSignal, 118, 111
EXPORT STDCALL, mmTaskYield, 119, 112
EXPORT STDCALL, mmioAdvance, 120, 113
EXPORT STDCALL, mmioAscend, 121, 114
EXPORT STDCALL, mmioClose, 122, 115
EXPORT STDCALL, mmioCreateChunk, 123, 116
EXPORT STDCALL, mmioDescend, 124, 117
EXPORT STDCALL, mmioFlush, 125, 118
EXPORT STDCALL, mmioGetInfo, 126, 119
EXPORT STDCALL, mmioInstallIOProcA, 127, 120
EXPORT STDCALL, mmioInstallIOProcW, 128, 121
EXPORT STDCALL, mmioOpenA, 129, 122
EXPORT STDCALL, mmioOpenW, 130, 123
EXPORT STDCALL, mmioRead, 131, 124
EXPORT STDCALL, mmioRenameA, 132, 125
EXPORT STDCALL, mmioRenameW, 133, 126
EXPORT STDCALL, mmioSeek, 134, 127
EXPORT STDCALL, mmioSendMessage, 135, 128
EXPORT STDCALL, mmioSetBuffer, 136, 129
EXPORT STDCALL, mmioSetInfo, 137, 130
EXPORT STDCALL, mmioStringToFOURCCA, 138, 131
EXPORT STDCALL, mmioStringToFOURCCW, 139, 132
EXPORT STDCALL, mmioWrite, 140, 133
EXPORT STDCALL, mmsystemGetVersion, 141, 134
EXPORT32 STDCALL, mod32Message, 142
EXPORT32 STDCALL, mxd32Message, 143
EXPORT STDCALL, sndPlaySoundA, 144, 135
EXPORT STDCALL, sndPlaySoundW, 145, 136
EXPORT32 STDCALL, tid32Message, 146
EXPORT STDCALL, timeBeginPeriod, 147, 137
EXPORT STDCALL, timeEndPeriod, 148, 138
EXPORT STDCALL, timeGetDevCaps, 149, 139
EXPORT STDCALL, timeGetSystemTime, 150, 140
EXPORT STDCALL, timeGetTime, 151, 141
EXPORT STDCALL, timeKillEvent, 152, 142
EXPORT STDCALL, timeSetEvent, 153, 143
EXPORT STDCALL, waveInAddBuffer, 154, 144
EXPORT STDCALL, waveInClose, 155, 145
EXPORT STDCALL, waveInGetDevCapsA, 156, 146
EXPORT STDCALL, waveInGetDevCapsW, 157, 147
EXPORT STDCALL, waveInGetErrorTextA, 158, 148
EXPORT STDCALL, waveInGetErrorTextW, 159, 149
EXPORT STDCALL, waveInGetID, 160, 150
EXPORT STDCALL, waveInGetNumDevs, 161, 151
EXPORT STDCALL, waveInGetPosition, 162, 152
EXPORT STDCALL, waveInMessage, 163, 153
EXPORT STDCALL, waveInOpen, 164, 154
EXPORT STDCALL, waveInPrepareHeader, 165, 155
EXPORT STDCALL, waveInReset, 166, 156
EXPORT STDCALL, waveInStart, 167, 157
EXPORT STDCALL, waveInStop, 168, 158
EXPORT STDCALL, waveInUnprepareHeader, 169, 159
EXPORT STDCALL, waveOutBreakLoop, 170, 160
EXPORT STDCALL, waveOutClose, 171, 161
EXPORT STDCALL, waveOutGetDevCapsA, 172, 162
EXPORT STDCALL, waveOutGetDevCapsW, 173, 163
EXPORT STDCALL, waveOutGetErrorTextA, 174, 164
EXPORT STDCALL, waveOutGetErrorTextW, 175, 165
EXPORT STDCALL, waveOutGetID, 176, 166
EXPORT STDCALL, waveOutGetNumDevs, 177, 167
EXPORT STDCALL, waveOutGetPitch, 178, 168
EXPORT STDCALL, waveOutGetPlaybackRate, 179, 169
EXPORT STDCALL, waveOutGetPosition, 180, 170
EXPORT STDCALL, waveOutGetVolume, 181, 171
EXPORT STDCALL, waveOutMessage, 182, 172
EXPORT STDCALL, waveOutOpen, 183, 173
EXPORT STDCALL, waveOutPause, 184, 174
EXPORT STDCALL, waveOutPrepareHeader, 185, 175
EXPORT STDCALL, waveOutReset, 186, 176
EXPORT STDCALL, waveOutRestart, 187, 177
EXPORT STDCALL, waveOutSetPitch, 188, 178
EXPORT STDCALL, waveOutSetPlaybackRate, 189, 179
EXPORT STDCALL, waveOutSetVolume, 190, 180
EXPORT STDCALL, waveOutUnprepareHeader, 191, 181
EXPORT STDCALL, waveOutWrite, 192, 182
EXPORT32 STDCALL, wid32Message, 193
EXPORT32 STDCALL, wod32Message, 194

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
