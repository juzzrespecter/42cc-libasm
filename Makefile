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

OBJS		= $(patsubst)

OBJS_BONUS	=

OBJS_DIR	= objs/

NAME		= libasm.a

all:		$(NAME)

$(NAME):	$(OBJS)
		ar rc 
