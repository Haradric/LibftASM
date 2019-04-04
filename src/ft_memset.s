
; void *ft_memset(void *b, int c, size_t len);

section .text
        global _ft_memset

    _ft_memset:
        enter   0, 0
        push    rdi
        mov     rcx, rdx    ; counter
        mov     rax, rsi    ; filler
        cld                 ; clear the direction flag
        rep     stosb       ; fill string until rcx != 0
        pop     rax
        leave
        ret
