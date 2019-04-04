
; int ft_cat(int fd);

section .text
        global  _ft_cat
    
    _ft_cat:
        enter   0, 0

    .read:
        mov     rax, 0x2000003  ; read
        push    rdi
        lea     rsi, [rel buff]
        mov     rdx, sbuff
        syscall
        jc      .error

        cmp     rax, 0
        je      .return

    .write:
        mov     rdi, 1
        mov     rdx, rax
        mov     rax, 0x2000004 ; write
        syscall
        jc      .error

        pop     rdi
        jmp     .read

    .error:
        pop     rdi
        mov     rax, -1

    .return:
        leave
        ret

section .data

        buff    times 255 db 0
        sbuff   equ $ - buff
