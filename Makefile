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

SRCS_DIR	= srcs

OBJS_DIR	= objs

OBJS		= $(SRCS=$(SRCS_DIR)/%.s:$(OBJS_DIR)/%.o)

NAME		= libasm.a

all:		$(NAME)

$(NAME):	$(OBJS)
		echo $(OBJS)
		ar rcs $(NAME) $(OBJS)

BONUS:		$(OBJS) $(OBJS_BONUS)
		ar rcs $(NAME) $(addprefix $(OBJS_DIR), $(OBJS))

$(OBJS):	$(OBJS_DIR)/%.o : $(SRCS_DIR)/%.s
		mkdir -p $(OBJS_DIR)
		nasm -f macho64 /$<
		mv $(@F) $(OBJS_DIR)
		echo $(OBJS)

clean:
		rm -rf $(OBJS_DIR)

fclean:		clean
		rm -f $(NAME)

re:		fclean all


##	fix relink
