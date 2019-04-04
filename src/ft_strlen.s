
; size_t ft_strlen(const char *s);

section .text
        global _ft_strlen

    _ft_strlen:
        enter   0, 0
        mov     rcx, -1     ; counter
        xor     rax, rax    ; the symbol we are looking for
        cld                 ; clear the direction flag
        repne   scasb       ; scan string until rcx != 0 or rdi != rax
        mov     rax, -2
        sub     rax, rcx    ; len
        leave
        ret
