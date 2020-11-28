.PHONY:		all re clean fclean bonus

SRCDIR		= srcs

SRC		= srcs/ft_strlen.s \
			srcs/ft_strcmp.s \
			srcs/ft_strcpy.s \
			srcs/ft_write.s \
			srcs/ft_read.s \
			srcs/ft_strdup.s

SRCBONUS	= srcs/ft_atoi_base.s \
			srcs/ft_list_size.s \
			srcs/ft_list_push_front.s \
			srcs/ft_list_sort.s \
			srcs/ft_list_remove_if.s

OBJDIR		= objs

OBJ		= $(patsubst $(SRCDIR)/%.s, $(OBJDIR)/%.o, $(SRC))

OBJBONUS	= $(patsubst $(SRCDIR)/%.s, $(OBJDIR)/%.o, $(SRCBONUS))

INC		= -I ./inc

LIB		= -L. -lasm

NAME		= libasm.a

all:		$(NAME)

$(NAME):	$(OBJ)
		ar rcs $(NAME) $(OBJ)

$(OBJDIR)/%.o:	$(SRCDIR)/%.s
		mkdir -p $(OBJDIR)
		nasm -f macho64 $< -o $@

bonus:		$(OBJ) $(OBJBONUS)
		ar rcs $(NAME) $(OBJBONUS)

exec:		$(NAME)
		gcc $(SRCDIR)/main.c -o test $(INC) $(LIB)
		./test

exec_bonus:	bonus
		gcc $(SRCDIR)/main.c -o test $(INC) $(LIB)
		./test
		gcc $(SRCDIR)/main_bonus.c -o test_bonus $(INC) $(LIB)
		./test_bonus
clean:
		rm -rf $(OBJDIR)

fclean:		clean
		rm -f $(NAME)

re:		fclean all
