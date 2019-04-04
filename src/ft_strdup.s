
; char *ft_strdup(const char *s1);

        extern  _malloc
        extern  _ft_strlen
        extern  _ft_memcpy

section .text
        global  _ft_strdup

    _ft_strdup:
        enter   0, 0
        cmp     rdi, 0
        je      .null
        push    rdi
        call    _ft_strlen

        push    rax
        mov     rdi, rax
        call    _malloc
        cmp     rax, 0
        je      .null

        mov     rdi, rax
        pop     rdx
        pop     rsi
        call    _ft_memcpy
        leave
        ret

    .null:
        mov     rax, 0
        leave
        ret
