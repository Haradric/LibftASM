
ASM = nasm
CC  = gcc

override CFLAGS_ASM  += -g -O0 -f macho64
override LDFLAGS_ASM +=
override CFLAGS      += -g -O0 -std=c11 -Wall -Wextra -Wpedantic -Werror -Wno-suspicious-bzero -march=native -Iinclude
override LDFLAGS     +=

SOURCE_ASM = src/ft_bzero.s   \
             src/ft_strcat.s  \
             src/ft_isalpha.s \
             src/ft_isdigit.s \
             src/ft_isalnum.s \
             src/ft_isascii.s \
             src/ft_isprint.s \
             src/ft_toupper.s \
             src/ft_tolower.s \
             src/ft_puts.s    \
             src/ft_strlen.s  \
             src/ft_memset.s  \
             src/ft_memcpy.s  \
             src/ft_strdup.s  \
             src/ft_cat.s     \
             src/ft_exit.s    \
             src/ft_read.s    \
             src/ft_write.s   \
             src/ft_putstr.s  \
             src/ft_putendl.s
OBJECT_ASM = $(SOURCE_ASM:.s=.o)

SOURCE = src/main.c
OBJECT = $(SOURCE:.c=.o)

NAME = libfts.a

all: $(NAME) test

$(NAME): $(OBJECT_ASM)
	@echo "\033[34mcreating $(NAME)\033[39m"
	@libtool -static -o $@ $(OBJECT_ASM)

test: $(OBJECT)
	$(CC) $(LDFLAGS) -o $@ $(NAME) $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	$(ASM) $(CFLAGS_ASM) -o $@ $<

clean:
	@echo "\033[34mremoving object files of $(NAME)\033[39m"
	rm -f $(OBJECT_ASM) $(OBJECT)

fclean: clean
	@echo "\033[34mremoving $(NAME)\033[39m"
	rm -f $(NAME) test

re: fclean all
