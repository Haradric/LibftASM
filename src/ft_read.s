
; ssize_t ft_read(int fildes, void *buf, size_t nbyte);

section .text
        global  _ft_read

    _ft_read:
        mov     rax, 0x2000003  ; read
        syscall
        ret
