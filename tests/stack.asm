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
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_1:
    ;; -- push int 20 --
    mov rax, 20
    push rax
addr_2:
    ;; -- push int 30 --
    mov rax, 30
    push rax
addr_3:
    ;; -- print --
    pop rdi
    call print
addr_4:
    ;; -- print --
    pop rdi
    call print
addr_5:
    ;; -- print --
    pop rdi
    call print
addr_6:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_7:
    ;; -- print --
    pop rdi
    call print
addr_8:
    ;; -- push int 20 --
    mov rax, 20
    push rax
addr_9:
    ;; -- print --
    pop rdi
    call print
addr_10:
    ;; -- push int 30 --
    mov rax, 30
    push rax
addr_11:
    ;; -- print --
    pop rdi
    call print
addr_12:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_0
addr_13:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_14:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_15:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_16:
    ;; -- push str --
    mov rax, 13
    push rax
    push str_1
addr_17:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_18:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_19:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_20:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_2
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
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_26:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_27:
    ;; -- print --
    pop rdi
    call print
addr_28:
    ;; -- print --
    pop rdi
    call print
addr_29:
    ;; -- print --
    pop rdi
    call print
addr_30:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_31:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_32:
    ;; -- print --
    pop rdi
    call print
addr_33:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_34:
    ;; -- print --
    pop rdi
    call print
addr_35:
    ;; -- print --
    pop rdi
    call print
addr_36:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_3
addr_37:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_38:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_39:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_40:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_41:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_42:
    ;; -- 2dup -- 
    pop rbx
    pop rax
    push rax
    push rbx
    push rax
    push rbx
addr_43:
    ;; -- print --
    pop rdi
    call print
addr_44:
    ;; -- print --
    pop rdi
    call print
addr_45:
    ;; -- print --
    pop rdi
    call print
addr_46:
    ;; -- print --
    pop rdi
    call print
addr_47:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_4
addr_48:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_49:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_50:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_51:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_52:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_53:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_54:
    ;; -- print --
    pop rdi
    call print
addr_55:
    ;; -- print --
    pop rdi
    call print
addr_56:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_5
addr_57:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_58:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_59:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_60:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_61:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_62:
    ;; -- drop --
    pop rax
addr_63:
    ;; -- print --
    pop rdi
    call print
addr_64:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_6
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
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_70:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_71:
    ;; -- print --
    pop rdi
    call print
addr_72:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_7
addr_73:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_74:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_75:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_76:
    ;; -- push int 1234567890987654321 --
    mov rax, 1234567890987654321
    push rax
addr_77:
    ;; -- print --
    pop rdi
    call print
addr_78:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_1: db 0x48,0x65,0x6c,0x6c,0x6f,0x2c,0x20,0x57,0x6f,0x72,0x6c,0x64,0xa
str_2: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_3: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_4: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_5: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_6: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_7: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
segment .bss
mem: resb 640000
