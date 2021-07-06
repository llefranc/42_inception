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

$(NAME)		:
				sed -i 's/INSTALL=1/INSTALL=0/g' srcs/.env
				docker-compose -f srcs/docker-compose.yaml up --build

install		:
				sed -i 's/INSTALL=0/INSTALL=1/g' srcs/.env
				docker-compose -f srcs/docker-compose.yaml up --build

clean		:	
				docker-compose -f srcs/docker-compose.yaml down 

fclean		:	clean
				rm -rf /home/llefranc/data/wordpress/* /home/llefranc/data/mariaDB/*
				docker volume rm srcs_mariaDB-data srcs_website-pages

.PHONY		:	all clean_host clean fclean
