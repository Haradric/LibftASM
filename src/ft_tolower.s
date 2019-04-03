
; int ft_tolower(int c);

section .text
        global  _ft_tolower

    _ft_tolower:
        mov     rax, rdi
        cmp     rdi, 0x41
        jl      .return
        cmp     rdi, 0x5a
        jg      .return
        add     rax, 0x20

    .return:
        ret
