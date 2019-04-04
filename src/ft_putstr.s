
; void ft_putstr(char const *s);

        extern  _ft_strlen

section .text
        global  _ft_putstr

    _ft_putstr:
        push    rdi
        call    _ft_strlen
        mov     rdi, 1
        pop     rsi
        mov     rdx, rax
        mov     rax, 0x2000004  ; write
        syscall
        ret
