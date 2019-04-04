
; void ft_exit(int status);

section .text
        global  _ft_exit

    _ft_exit:
        mov     rax, 0x2000001  ; write
        syscall
        ret
