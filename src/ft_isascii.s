
; int ft_isascii(int c);

section .text
        global  _ft_isascii

    _ft_isascii:
        cmp     rdi, 0x0
        jl      .false
        cmp     rdi, 0x7f
        jle     .true

    .false:
        xor     rax, rax
        ret

    .true:
        mov     rax, 0x1
        ret
