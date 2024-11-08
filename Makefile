# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sperron <sperron@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 12:43:23 by sperron           #+#    #+#              #
#    Updated: 2024/11/08 12:45:20 by sperron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
NAME = libgarbage_descriptor.a
CC = cc -g3
CFLAGS = -Wall -Wextra -Werror

SRC = src/gd_add.c \
	src/gd_init.c \
	src/gd_clear.c \
	src/gd_utils.c

OBJECTS = $(SRC:.c=.o)

#################################################################################

# Couleurs pour l'affichage
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
CYAN = \033[0;36m
NC = \033[0m

#################################################################################

OBJ = $(SRC:.c=.o)

# Règle par défaut
all: $(NAME)

# Animation de chargement
loading_animation:
	@echo "$(CYAN)🚀 Initializing garbage descriptor...$(NC)"
	@sleep 1; echo -n "$(YELLOW)🗑️  Collecting garbage"; sleep 0.5
	@for i in $(shell seq 1 5); do \
		echo -n ". "; sleep 0.5; \
	done; \
	echo "\n$(GREEN)✅ Garbage collected!$(NC)$(NL)"
	@sleep 1; echo -n "$(CYAN)♻️  Optimizing descriptor"; sleep 0.5
	@for i in $(shell seq 1 5); do \
		echo -n ". "; sleep 0.5; \
	done; \
	echo "\n$(GREEN)✅ Descriptor optimized!$(NC)"

# Compilation des fichiers objets
%.o: %.c
	@echo "$(YELLOW)🔨 Compiling $<...$(NC)"
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(GREEN)✅ $< compiled!$(NC)"

# Création de l'exécutable
$(NAME): $(OBJ)
	@$(MAKE) -s loading_animation
	@echo "$(BLUE)🔗 Creating static library...$(NC)"
	@ar rcs $(NAME) $(OBJ)
	@echo "$(GREEN)✅ $@ created!$(NC)"

clean:
	@echo "$(YELLOW)🗑️ Cleaning up object files...$(NC)"
	@$(MAKE) -s trash_animation
	@rm -f $(OBJECTS)
	@echo "$(YELLOW)🗑️ $(OBJECTS) deleted!$(NC)"



# Animation de la poubelle
trash_animation:
	@echo "$(YELLOW)🗑️  Starting garbage descriptor...$(NC)"
	@sleep 1
	@echo -n "$(CYAN)🔄 Collecting garbage"
	@for i in $(shell seq 1 5); do \
		echo -n ". "; sleep 0.5; \
	done; \
	echo -n "\n$(GREEN)✅ Garbage collected! $(NC)"
	@echo
	@sleep 1
	@echo "$(GREEN)♻️  Optimizing descriptor...$(NC)"
	@for i in $(shell seq 1 5); do \
		echo -n "🌱 "; sleep 0.5; \
	done; \
	echo "\n$(GREEN)✅ Descriptor optimized!$(NC)"

fclean: clean
	@echo "$(RED)🗑️ Removing executable...$(NC)"
	@rm -rf $(NAME)
	@echo "$(GREEN)🗑️ $(NAME) deleted!$(NC)"

# Recompile tout
re: fclean all

.PHONY: re all clean fclean trash_animation loading_animation