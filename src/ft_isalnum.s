
; int ft_isalnum(int c);

section .text
        global  _ft_isalnum

    _ft_isalnum:
        cmp     rdi, 0x30
        jl      .false
        cmp     rdi, 0x39
        jle     .true
        cmp     rdi, 0x41
        jl      .false
        cmp     rdi, 0x5a
        jle     .true
        cmp     rdi, 0x61
        jl      .false
        cmp     rdi, 0x7a
        jle     .true

    .false:
        xor     rax, rax
        ret

    .true:
        mov     rax, 0x1
        ret
