
#include "libfts.h"

#include <stdint.h>
#include <stdlib.h>
#include <strings.h> // bzero()
#include <assert.h>
#include <stdio.h>
#include <ctype.h>
#include <unistd.h>

int main(void) {

    /* void ft_bzero(void *s, size_t n); */
    {
        {
            char control[10] = {0};
            char subject[] = "123456789";

            ft_bzero(subject, 10);

            assert(memcmp(control, subject, 10) == 0);
        }

        {
            char control[] = "123456789";
            char subject[] = "123456789";

            bzero(control, 10);
            ft_bzero(subject, 10);
            
            assert(memcmp(control, subject, 10) == 0);
        }

        {
            char    control[] = "123456789";
            char    subject[] = "123456789";

            bzero(control, 3);
            ft_bzero(subject, 3);

            assert(memcmp(subject, control, 10) == 0);
        }

        {
            char    control[] = "123456789";
            char    subject[] = "123456789";

            bzero(control, 0);
            ft_bzero(subject, 0);
            assert(memcmp(subject, control, 10) == 0);
        }

        printf("ft_bzero   SUCCESS\n");
    }

    /* char *ft_strcat(char *s1, const char *s2); */
    {
        {
            char    control[10] = {0};
        
            ft_strcat(control, "");
            ft_strcat(control, "1");
            ft_strcat(control, "23");
            ft_strcat(control, "456");
            ft_strcat(control, "789");
            ft_strcat(control, "");
            assert(strcmp(control, "123456789") == 0);
            assert(control == ft_strcat(control, ""));
        }

        printf("ft_strcat  SUCCESS\n");
    }

    /* int ft_isalpha(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_isalpha(i), isalpha(i));
            assert(ft_isalpha(i) == isalpha(i));
        }

        printf("ft_isalpha SUCCESS\n");
    }

    /* int ft_isdigit(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_isdigit(i), isdigit(i));
            assert(ft_isdigit(i) == isdigit(i));
        }

        printf("ft_isdigit SUCCESS\n");
    }

    /* int ft_isalnum(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_isalnum(i), isalnum(i));
            assert(ft_isalnum(i) == isalnum(i));
        }

        printf("ft_isalnum SUCCESS\n");
    }

    /* int ft_isascii(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_isascii(i), isascii(i));
            assert(ft_isascii(i) == isascii(i));
        }

        printf("ft_isascii SUCCESS\n");
    }

    /* int ft_isprint(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_isprint(i), isprint(i));
            assert(ft_isprint(i) == isprint(i));
        }

        printf("ft_isprint SUCCESS\n");
    }

    /* int ft_toupper(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_toupper(i), toupper(i));
            assert(ft_toupper(i) == toupper(i));
        }

        printf("ft_toupper SUCCESS\n");
    }

    /* int ft_tolower(int c); */
    {
        for(int i = INT16_MIN; i <= INT16_MAX; i++) {
            // printf("%d, %d, %d\n", i, ft_tolower(i), tolower(i));
            assert(ft_tolower(i) == tolower(i));
        }

        printf("ft_tolower SUCCESS\n");
    }

    /* int ft_puts(const char *s); */
    {
        int     ret;
        int     out;
        int     p[2];
        char    buf[256];

        out = dup(1);
        pipe(p);
        dup2(p[1], 1);
        assert(ft_puts("aaa") > 0);
        assert(ft_puts(NULL)  > 0);
        assert(ft_puts("")    > 0);
        dup2(out, 1);
        ret = read(p[0], buf, 256);
        buf[ret] = 0;
        close(p[0]);
        close(p[1]);
        close(out);
        assert(strcmp(buf, "aaa\n"
                           "(null)\n"
                           "\n") == 0);

        printf("ft_puts    SUCCESS\n");
    }

    printf("TOTAL ---> SUCCESS\n");

    return (EXIT_SUCCESS);
}
