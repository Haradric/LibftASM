
; int ft_puts(const char *s);

section .text
        global  _ft_puts

    _ft_puts:
        cmp     rdi, 0x00
        je      .null
        push    rdi
        xor     rdx, rdx

    .count:
        cmp     byte [rdi], 0x00
        je      .print
        inc     rdi
        inc     rdx
        jmp     .count

    .print:
        mov     rax, 0x2000004 ; write
        mov     rdi, 0x01      ; stdout
        pop     rsi            ; string
                               ; rdx already contains length
        syscall
        mov     rax, 0x2000004 ; write
        mov     rdi, 0x01      ; stdout
        lea     rsi, [rel .lbr]; linebreak
        mov     rdx, 0x01
        syscall

    .return:
        mov     rax, 0x0a
        ret

    .null:
        mov     rax, 0x2000004
        mov     rdi, 1
        lea     rsi, [rel .nulls]
        mov     rdx, 7
        syscall
        jmp     .return

section .data
.lbr:   db      0x0a
.nulls: db      "(null)", 0x0a
