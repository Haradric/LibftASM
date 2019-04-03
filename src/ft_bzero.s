
; void ft_bzero(void *s, size_t n);

section .text
        global  _ft_bzero

    _ft_bzero:
    .loop:
        cmp     rsi, 0
        je      .return
        mov     byte [rdi], 0
        inc     rdi
        dec     rsi
        jmp     .loop

    .return:
        ret
