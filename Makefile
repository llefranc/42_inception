# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: llefranc <llefranc@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/13 21:36:01 by lucaslefran       #+#    #+#              #
#    Updated: 2021/04/28 14:43:09 by llefranc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	inception

all		: 	$(NAME)

$(NAME)	:
			docker-compose -f srcs/inception.yml up --build

.PHONY	:	all
