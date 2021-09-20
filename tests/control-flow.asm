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
    ;; -- push int 34 --
    mov rax, 34
    push rax
addr_1:
    ;; -- push int 35 --
    mov rax, 35
    push rax
addr_2:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_3:
    ;; -- push int 70 --
    mov rax, 70
    push rax
addr_4:
    ;; -- equal -- 
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_5:
    ;; -- if --
    pop rax
    test rax, rax
    jz addr_9
addr_6:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_7:
    ;; -- print --
    pop rdi
    call print
addr_8:
    ;; -- else --
    jmp addr_11
addr_9:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_10:
    ;; -- print --
    pop rdi
    call print
addr_11:
    ;; -- end --
addr_12:
    ;; -- push int 34 --
    mov rax, 34
    push rax
addr_13:
    ;; -- push int 35 --
    mov rax, 35
    push rax
addr_14:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_15:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_16:
    ;; -- equal -- 
    mov rcx, 0
    mov rdx, 1
    pop rax
    pop rbx
    cmp rax, rbx
    cmove rcx, rdx
    push rcx
addr_17:
    ;; -- if --
    pop rax
    test rax, rax
    jz addr_21
addr_18:
    ;; -- push int 69 --
    mov rax, 69
    push rax
addr_19:
    ;; -- print --
    pop rdi
    call print
addr_20:
    ;; -- else --
    jmp addr_23
addr_21:
    ;; -- push int 420 --
    mov rax, 420
    push rax
addr_22:
    ;; -- print --
    pop rdi
    call print
addr_23:
    ;; -- end --
addr_24:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_0
addr_25:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_26:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_27:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_28:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_29:
    ;; -- while --
addr_30:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_31:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_32:
    ;; -- gt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovg rcx, rdx
    push rcx
addr_33:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_39
addr_34:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_35:
    ;; -- print --
    pop rdi
    call print
addr_36:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_37:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_38:
    ;; -- end --
    jmp addr_29
addr_39:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
segment .bss
mem: resb 640000
