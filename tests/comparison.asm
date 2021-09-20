BITS 64
segment .text
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
.L2:
    mov     rax, rdi
    lea     r8, [rsp+32]
    mul     r9
    mov     rax, rdi
    sub     r8, rcx
    shr     rdx, 3
    lea     rsi, [rdx+rdx*4]
    add     rsi, rsi
    sub     rax, rsi
    add     eax, 48
    mov     BYTE [rcx], al
    mov     rax, rdi
    mov     rdi, rdx
    mov     rdx, rcx
    sub     rcx, 1
    cmp     rax, 9
    ja      .L2
    lea     rax, [rsp+32]
    mov     edi, 1
    sub     rdx, rax
    xor     eax, eax
    lea     rsi, [rsp+32+rdx]
    mov     rdx, r8
    mov     rax, 1
    syscall
    add     rsp, 40
    ret
global _start
_start:
addr_0:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_1:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_2:
    ;; -- equal -- 
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_3:
    ;; -- print --
    pop rdi
    call print
addr_4:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_5:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_6:
    ;; -- equal -- 
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_7:
    ;; -- print --
    pop rdi
    call print
addr_8:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_0
addr_9:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_10:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_11:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_12:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_13:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_14:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_15:
    ;; -- print --
    pop rdi
    call print
addr_16:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_17:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_18:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_19:
    ;; -- print --
    pop rdi
    call print
addr_20:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_1
addr_21:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_22:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_23:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_24:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_25:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_26:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_27:
    ;; -- print --
    pop rdi
    call print
addr_28:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_29:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_30:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_31:
    ;; -- print --
    pop rdi
    call print
addr_32:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_2
addr_33:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_34:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_35:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_36:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_37:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_38:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
addr_39:
    ;; -- print --
    pop rdi
    call print
addr_40:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_41:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_42:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
addr_43:
    ;; -- print --
    pop rdi
    call print
addr_44:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_45:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_46:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovge rcx, rdx
    push rcx
addr_47:
    ;; -- print --
    pop rdi
    call print
addr_48:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_3
addr_49:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_50:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_51:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_52:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_53:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_54:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
addr_55:
    ;; -- print --
    pop rdi
    call print
addr_56:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_57:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_58:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
addr_59:
    ;; -- print --
    pop rdi
    call print
addr_60:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_61:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_62:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovle rcx, rdx
    push rcx
addr_63:
    ;; -- print --
    pop rdi
    call print
addr_64:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_4
addr_65:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_66:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_67:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_68:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_69:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_70:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_71:
    ;; -- print --
    pop rdi
    call print
addr_72:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_73:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_74:
    ;; -- ne --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovne rcx, rdx
    push rcx
addr_75:
    ;; -- print --
    pop rdi
    call print
addr_76:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_1: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_2: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_3: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_4: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
segment .bss
mem: resb 640000
