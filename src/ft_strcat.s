
; char *ft_strcat(char *s1, const char *s2);

section .text
        global  _ft_strcat

    _ft_strcat:
        push    rdi

    .loop:
        cmp     byte [rdi], 0
        je      .loop_copy
        inc     rdi
        jmp     .loop

    .loop_copy:
        cmp     byte [rsi], 0
        je      .return
        mov     al, [rsi]
        mov     [rdi], al
        inc     rdi
        inc     rsi
        jmp     .loop_copy

    .return:
        mov     byte [rdi], 0
        pop     rax
        ret
