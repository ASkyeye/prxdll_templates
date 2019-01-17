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

PRX_EXPORT stdcall, RevertToOldImplementation, 1
PRX_EXPORT stdcall, D3D10CompileEffectFromMemory, 2
PRX_EXPORT stdcall, D3D10CompileShader, 3
PRX_EXPORT stdcall, D3D10CreateBlob, 4
PRX_EXPORT stdcall, D3D10CreateDevice, 5
PRX_EXPORT stdcall, D3D10CreateDeviceAndSwapChain, 6
PRX_EXPORT stdcall, D3D10CreateEffectFromMemory, 7
PRX_EXPORT stdcall, D3D10CreateEffectPoolFromMemory, 8
PRX_EXPORT stdcall, D3D10CreateStateBlock, 9
PRX_EXPORT stdcall, D3D10DisassembleEffect, 10
PRX_EXPORT stdcall, D3D10DisassembleShader, 11
PRX_EXPORT stdcall, D3D10GetGeometryShaderProfile, 12
PRX_EXPORT stdcall, D3D10GetInputAndOutputSignatureBlob, 13
PRX_EXPORT stdcall, D3D10GetInputSignatureBlob, 14
PRX_EXPORT stdcall, D3D10GetOutputSignatureBlob, 15
PRX_EXPORT stdcall, D3D10GetPixelShaderProfile, 16
PRX_EXPORT stdcall, D3D10GetShaderDebugInfo, 17
PRX_EXPORT stdcall, D3D10GetVersion, 18
PRX_EXPORT stdcall, D3D10GetVertexShaderProfile, 19
PRX_EXPORT stdcall, D3D10PreprocessShader, 20
PRX_EXPORT stdcall, D3D10ReflectShader, 21
PRX_EXPORT stdcall, D3D10RegisterLayers, 22
PRX_EXPORT stdcall, D3D10StateBlockMaskDifference, 23
PRX_EXPORT stdcall, D3D10StateBlockMaskDisableAll, 24
PRX_EXPORT stdcall, D3D10StateBlockMaskDisableCapture, 25
PRX_EXPORT stdcall, D3D10StateBlockMaskEnableAll, 26
PRX_EXPORT stdcall, D3D10StateBlockMaskEnableCapture, 27
PRX_EXPORT stdcall, D3D10StateBlockMaskGetSetting, 28
PRX_EXPORT stdcall, D3D10StateBlockMaskIntersect, 29
PRX_EXPORT stdcall, D3D10StateBlockMaskUnion, 30

end
