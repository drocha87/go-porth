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
    ;; -- mem --
    push mem
addr_1:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_2:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_3:
    ;; -- push int 97 --
    mov rax, 97
    push rax
addr_4:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_5:
    ;; -- mem --
    push mem
addr_6:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_7:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_8:
    ;; -- push int 98 --
    mov rax, 98
    push rax
addr_9:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_10:
    ;; -- mem --
    push mem
addr_11:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_12:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_13:
    ;; -- push int 99 --
    mov rax, 99
    push rax
addr_14:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_15:
    ;; -- mem --
    push mem
addr_16:
    ;; -- push int 3 --
    mov rax, 3
    push rax
addr_17:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_18:
    ;; -- push int 10 --
    mov rax, 10
    push rax
addr_19:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_20:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_21:
    ;; -- mem --
    push mem
addr_22:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_23:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_24:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_25:
    ;; -- print --
    pop rdi
    call print
addr_26:
    ;; -- mem --
    push mem
addr_27:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_28:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_29:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_30:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_31:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_32:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_33:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_34:
    ;; -- mem --
    push mem
addr_35:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_36:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_37:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_38:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_39:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_40:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_41:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_42:
    ;; -- mem --
    push mem
addr_43:
    ;; -- push int 2 --
    mov rax, 2
    push rax
addr_44:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_45:
    ;; -- dup -- 
    pop rax
    push rax
    push rax
addr_46:
    ;; -- load --
    pop rax
    xor rbx, rbx
    mov bl, [rax]
    push rbx
addr_47:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_48:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_49:
    ;; -- store --
    pop rbx
    pop rax
    mov [rax], bl
addr_50:
    ;; -- push int 4 --
    mov rax, 4
    push rax
addr_51:
    ;; -- mem --
    push mem
addr_52:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_53:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_54:
    ;; -- syscall3 --
    pop rax
    pop rdi
    pop rsi
    pop rdx
    syscall
    push rax
addr_55:
    ;; -- print --
    pop rdi
    call print
addr_56:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
segment .bss
mem: resb 640000
