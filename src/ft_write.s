
; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

section .text
        global  _ft_write

    _ft_write:
        mov     rax, 0x2000004  ; write
        syscall
        ret
