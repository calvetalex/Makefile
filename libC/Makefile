##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## compile
##

##
## ===============
##	COLOR & SHELL
## ===============
##

DEFAULT		=	"\033[00m"
GREEN		=	"\033[1;32m"
TEAL		=	"\033[1;36m"
YELLOW		=	"\033[1;184m"
MAGENTA		=	"\033[1;95m"
ERROR		=	"\033[5;7;1;31m"
ERRORMSG	=	"\033[1;7;31m"

ECHO	=	echo -e

RM		=	rm -rf

##
## ===============
##	VARS
## ===============
##

LIB	=	./

##
## ===============
##	OBJ
## ===============
##

OBJ	=	$(LIB:.c=.o)

##
## ===============
##	LIB NAME
## ===============
##

NAME	=	libmy.a

##
## ===============
##	CFLAGS
## ===============
##
cflags.common	:=	-W -Wall -Wextra -I./include/ -pedantic
cflags.debug	:=	-g -g3
cflags.release	:=
cflags.tests	:=


CFLAGS	:=	${cflags.release} ${cflags.common}

##
## ===============
##	RULES
## ===============
##

all:	$(NAME)

%.o	:	%.c
		@$(CC) $(CFLAGS) -c $< -o $@ && \
		$(ECHO) $(GREEN) "[OBJ] " $(TEAL) $@ "\thas been created from\t" $@ $(DEFAULT) || \
		$(ECHO) $(ERROR) " [ERROR] " $(ERRORMSG) " can't find " $^ $(DEFAULT)


$(NAME):	$(OBJ)
	@ar rc $(NAME) $(OBJ) && \
	$(ECHO) $(GREEN) "["$@"] lib is ready. To use it with gcc use -L and -l options." $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(ERRORMSG) $(NAME) $(DEFAULT)

set_rule_debug:
	$(eval CFLAGS=${cflags.debug} $(cflags.common))

debug:	set_rule_debug $(OBJ)
	@ar rc $(NAME) $(OBJ) && \
	$(ECHO) $(GREEN) "["$@"] lib was created with DEBUG FLAGS." $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(ERRORMSG) $(NAME) $(DEFAULT)

clean:
	@$(foreach i, $(OBJ), $(shell rm -rf $(i)) echo -e $(MAGENTA) "Deleting...\t\t$(i)" $(DEFAULT);)
	@$(RM) *~ && \
	$(ECHO) $(GREEN) "[OK] clean rule success msg" $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(ERRORMSG) $(NAME) $(DEFAULT)

fclean:	clean
	@rm -f $(NAME) && \
	$(ECHO) $(GREEN) "[OK]"$(TEAL)" clean done and lib removed." $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(ERRORMSG) $(NAME) $(DEFAULT)

re:	fclean all

.PHONY: $(NAME) clean fclean re
