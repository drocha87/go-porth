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
    ;; -- print --
    pop rdi
    call print
addr_4:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_0
addr_5:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_6:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_7:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_8:
    ;; -- push int 500 --
    mov rax, 500
    push rax
addr_9:
    ;; -- push int 80 --
    mov rax, 80
    push rax
addr_10:
    ;; -- minus --
    pop rax
    pop rbx
    sub rbx, rax
    push rbx
addr_11:
    ;; -- print --
    pop rdi
    call print
addr_12:
    ;; -- push str --
    mov rax, 31
    push rax
    push str_1
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
    ;; -- push int 5 --
    mov rax, 5
    push rax
addr_17:
    ;; -- push int 100 --
    mov rax, 100
    push rax
addr_18:
    ;; -- mod --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
addr_19:
    ;; -- print --
    pop rdi
    call print
addr_20:
    ;; -- push int 104 --
    mov rax, 104
    push rax
addr_21:
    ;; -- push int 100 --
    mov rax, 100
    push rax
addr_22:
    ;; -- mod --
    xor rdx, rdx
    pop rbx
    pop rax
    div rbx
    push rdx
addr_23:
    ;; -- print --
    pop rdi
    call print
addr_24:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
str_0: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
str_1: db 0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0x2d,0xa
segment .bss
mem: resb 640000
