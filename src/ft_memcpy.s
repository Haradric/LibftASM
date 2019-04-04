
; void   *ft_memcpy(void *dst, const void *src, size_t n);

section .text
        global _ft_memcpy

    _ft_memcpy:
        enter   0, 0
        push    rdi
        mov     rcx, rdx    ; counter
        cld                 ; clear the direction flag
        rep     movsb       ; copy string until rcx != 0
        pop     rax
        leave
        ret
