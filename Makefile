.PHONY:		all re clean fclean bonus

SRCS		= ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s

SRCS_BONUS	= ft_atoi_base.s \
			  	ft_list_push_front.s \
				ft_list_size.s \
				ft_list_sort.s \
				ft_list_remove_if.s

SRCS_DIR	= srcs/

OBJS		= $(SRCS:.s=.o)

OBJS_BONUS	= $(patsubst %.s, $(OBJS_DIR)%.o, $(SRCS_BONUS))

OBJS_DIR	= objs/

NAME		= libasm.a

all:		$(NAME)

$(NAME):	$(OBJS)
		ar rcs $(NAME) $(addprefix $(OBJS_DIR), $(OBJS))

BONUS:		$(OBJS) $(OBJS_BONUS)
		ar rcs $(NAME) $(addprefix $(OBJS_DIR), $(OBJS))

%.o:		$(SRCS_DIR)%.s
		nasm -f macho64 $<
		mkdir -p $(OBJS_DIR)
		mv $(SRCS_DIR)$(@F) $(OBJS_DIR)

clean:
		rm -rf $(OBJS_DIR)

fclean:		clean
		rm -f $(NAME)

re:		fclean all


##	fix relink
