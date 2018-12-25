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

export WINMM_2, 2, 2
export CloseDriver, 3, 3
export DefDriverProc, 4, 4
export DriverCallback, 5, 5
export DrvGetModuleHandle, 6, 6
export GetDriverModuleHandle, 7, 7
export NotifyCallbackData, 8, 0
export OpenDriver, 9, 8
export PlaySound, 10, 9
export PlaySoundA, 11, 10
export PlaySoundW, 12, 11
export SendDriverMessage, 13, 12
export WOW32DriverCallback, 14, 0
export WOW32ResolveMultiMediaHandle, 15, 0
export WOWAppExit, 16, 13
export aux32Message, 17, 0
export auxGetDevCapsA, 18, 14
export auxGetDevCapsW, 19, 15
export auxGetNumDevs, 20, 16
export auxGetVolume, 21, 17
export auxOutMessage, 22, 18
export auxSetVolume, 23, 19
export joy32Message, 24, 0
export joyConfigChanged, 25, 20
export joyGetDevCapsA, 26, 21
export joyGetDevCapsW, 27, 22
export joyGetNumDevs, 28, 23
export joyGetPos, 29, 24
export joyGetPosEx, 30, 25
export joyGetThreshold, 31, 26
export joyReleaseCapture, 32, 27
export joySetCapture, 33, 28
export joySetThreshold, 34, 29
export mci32Message, 35, 0
export mciDriverNotify, 36, 30
export mciDriverYield, 37, 31
export mciExecute, 38, 32
export mciFreeCommandResource, 39, 33
export mciGetCreatorTask, 40, 34
export mciGetDeviceIDA, 41, 35
export mciGetDeviceIDFromElementIDA, 42, 36
export mciGetDeviceIDFromElementIDW, 43, 37
export mciGetDeviceIDW, 44, 38
export mciGetDriverData, 45, 39
export mciGetErrorStringA, 46, 40
export mciGetErrorStringW, 47, 41
export mciGetYieldProc, 48, 42
export mciLoadCommandResource, 49, 43
export mciSendCommandA, 50, 44
export mciSendCommandW, 51, 45
export mciSendStringA, 52, 46
export mciSendStringW, 53, 47
export mciSetDriverData, 54, 48
export mciSetYieldProc, 55, 49
export mid32Message, 56, 0
export midiConnect, 57, 50
export midiDisconnect, 58, 51
export midiInAddBuffer, 59, 52
export midiInClose, 60, 53
export midiInGetDevCapsA, 61, 54
export midiInGetDevCapsW, 62, 55
export midiInGetErrorTextA, 63, 56
export midiInGetErrorTextW, 64, 57
export midiInGetID, 65, 58
export midiInGetNumDevs, 66, 59
export midiInMessage, 67, 60
export midiInOpen, 68, 61
export midiInPrepareHeader, 69, 62
export midiInReset, 70, 63
export midiInStart, 71, 64
export midiInStop, 72, 65
export midiInUnprepareHeader, 73, 66
export midiOutCacheDrumPatches, 74, 67
export midiOutCachePatches, 75, 68
export midiOutClose, 76, 69
export midiOutGetDevCapsA, 77, 70
export midiOutGetDevCapsW, 78, 71
export midiOutGetErrorTextA, 79, 72
export midiOutGetErrorTextW, 80, 73
export midiOutGetID, 81, 74
export midiOutGetNumDevs, 82, 75
export midiOutGetVolume, 83, 76
export midiOutLongMsg, 84, 77
export midiOutMessage, 85, 78
export midiOutOpen, 86, 79
export midiOutPrepareHeader, 87, 80
export midiOutReset, 88, 81
export midiOutSetVolume, 89, 82
export midiOutShortMsg, 90, 83
export midiOutUnprepareHeader, 91, 84
export midiStreamClose, 92, 85
export midiStreamOpen, 93, 86
export midiStreamOut, 94, 87
export midiStreamPause, 95, 88
export midiStreamPosition, 96, 89
export midiStreamProperty, 97, 90
export midiStreamRestart, 98, 91
export midiStreamStop, 99, 92
export mixerClose, 100, 93
export mixerGetControlDetailsA, 101, 94
export mixerGetControlDetailsW, 102, 95
export mixerGetDevCapsA, 103, 96
export mixerGetDevCapsW, 104, 97
export mixerGetID, 105, 98
export mixerGetLineControlsA, 106, 99
export mixerGetLineControlsW, 107, 100
export mixerGetLineInfoA, 108, 101
export mixerGetLineInfoW, 109, 102
export mixerGetNumDevs, 110, 103
export mixerMessage, 111, 104
export mixerOpen, 112, 105
export mixerSetControlDetails, 113, 106
export mmDrvInstall, 114, 107
export mmGetCurrentTask, 115, 108
export mmTaskBlock, 116, 109
export mmTaskCreate, 117, 110
export mmTaskSignal, 118, 111
export mmTaskYield, 119, 112
export mmioAdvance, 120, 113
export mmioAscend, 121, 114
export mmioClose, 122, 115
export mmioCreateChunk, 123, 116
export mmioDescend, 124, 117
export mmioFlush, 125, 118
export mmioGetInfo, 126, 119
export mmioInstallIOProcA, 127, 120
export mmioInstallIOProcW, 128, 121
export mmioOpenA, 129, 122
export mmioOpenW, 130, 123
export mmioRead, 131, 124
export mmioRenameA, 132, 125
export mmioRenameW, 133, 126
export mmioSeek, 134, 127
export mmioSendMessage, 135, 128
export mmioSetBuffer, 136, 129
export mmioSetInfo, 137, 130
export mmioStringToFOURCCA, 138, 131
export mmioStringToFOURCCW, 139, 132
export mmioWrite, 140, 133
export mmsystemGetVersion, 141, 134
export mod32Message, 142, 0
export mxd32Message, 143, 0
export sndPlaySoundA, 144, 135
export sndPlaySoundW, 145, 136
export tid32Message, 146, 0
export timeBeginPeriod, 147, 137
export timeEndPeriod, 148, 138
export timeGetDevCaps, 149, 139
export timeGetSystemTime, 150, 140
export timeGetTime, 151, 141
export timeKillEvent, 152, 142
export timeSetEvent, 153, 143
export waveInAddBuffer, 154, 144
export waveInClose, 155, 145
export waveInGetDevCapsA, 156, 146
export waveInGetDevCapsW, 157, 147
export waveInGetErrorTextA, 158, 148
export waveInGetErrorTextW, 159, 149
export waveInGetID, 160, 150
export waveInGetNumDevs, 161, 151
export waveInGetPosition, 162, 152
export waveInMessage, 163, 153
export waveInOpen, 164, 154
export waveInPrepareHeader, 165, 155
export waveInReset, 166, 156
export waveInStart, 167, 157
export waveInStop, 168, 158
export waveInUnprepareHeader, 169, 159
export waveOutBreakLoop, 170, 160
export waveOutClose, 171, 161
export waveOutGetDevCapsA, 172, 162
export waveOutGetDevCapsW, 173, 163
export waveOutGetErrorTextA, 174, 164
export waveOutGetErrorTextW, 175, 165
export waveOutGetID, 176, 166
export waveOutGetNumDevs, 177, 167
export waveOutGetPitch, 178, 168
export waveOutGetPlaybackRate, 179, 169
export waveOutGetPosition, 180, 170
export waveOutGetVolume, 181, 171
export waveOutMessage, 182, 172
export waveOutOpen, 183, 173
export waveOutPause, 184, 174
export waveOutPrepareHeader, 185, 175
export waveOutReset, 186, 176
export waveOutRestart, 187, 177
export waveOutSetPitch, 188, 178
export waveOutSetPlaybackRate, 189, 179
export waveOutSetVolume, 190, 180
export waveOutUnprepareHeader, 191, 181
export waveOutWrite, 192, 182
export wid32Message, 193, 0
export wod32Message, 194, 0

SEH_handler PROC
        ; empty handler
        ret
SEH_handler ENDP

END
