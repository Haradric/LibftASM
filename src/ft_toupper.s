
; int ft_toupper(int c);

section .text
        global  _ft_toupper

    _ft_toupper:
        mov     rax, rdi
        cmp     rdi, 0x61
        jl      .return
        cmp     rdi, 0x7a
        jg      .return
        sub     rax, 0x20

    .return:
        ret
