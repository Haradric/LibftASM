
; void ft_putendl(char const *s);

        extern  _ft_strlen

section .text
        global  _ft_putendl

    _ft_putendl:
        push    rdi
        call    _ft_strlen
        mov     rdi, 1
        pop     rsi
        mov     rdx, rax
        mov     rax, 0x2000004  ; write
        syscall
        mov     rax, 0x2000004 ; write
        mov     rdi, 0x01      ; stdout
        lea     rsi, [rel .lbr]; linebreak
        mov     rdx, 0x01
        syscall
        ret

section .data
.lbr:   db      0x0a