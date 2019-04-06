##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## make / clena / fclean / re
##

## --------- COLOR ------##

DEFAULT	=	"\033[00m"
GREEN	=	"\033[1;32m"
TEAL	=	"\033[1;36m"
YELLOW	=	"\033[1;7;25;33m"
MAGENTA	=	"\033[1;3;4;35m"
ERROR	=	"\033[5;7;1;31m"

ECHO	=	echo -e

## -------- COMPIL ----##

CC	=	gcc

## ------- DIR --------##
SRCDIR	=	./src

TESTDIR	=	./tests

## -------- SRC -------##

SRCTEST	=	$(TESTDIR)/ \

MAIN	=	$(SRCDIR)/main.c

SRC	=	$(SRCDIR)/	\

OBJ	=	$(SRC:.c=.o)

OBJ_MAIN	=	$(MAIN:.c=.o)

OBJ_TEST	=	$(SRCTEST:.c=.o)

## ------- FLAGS --------##

cflags.common	:=	-W -Wall -Wextra -I./include/ -pedantic
cflags.debug	:=	-g -g3
cflags.release	:=
cflags.tests	:=

ldflags.common	:=	-L./lib/ -lmy
ldflags.debug	:=
ldflags.release	:=
ldflags.tests	:=	-lcriterion -lgcov  --coverage

CFLAGS	:=	${cflags.${BUILD}} ${cflags.common}
LDFLAGS	:=	${ldflags.${BUILD}} ${ldflags.common}

## ------- BIN ----------##

BINNAME	=	

TEST_BIN	=	$(BINNAME)_test

## ------- BUILD ----------##

BUILD   =   release

## --------- RULES --------##

all:
	@make -s $(BINNAME)
	@make -s clean && \
	$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)

$(BINNAME)	:	$(OBJ) $(OBJ_MAIN)
				@make -s -C ./lib/
				@$(CC) -o $(BINNAME) $(OBJ) $(OBJ_MAIN) $(CFLAGS) $(LDFLAGS)

%.o	:	%.c
		@$(CC)  $(CFLAGS) -c $< -o $@ && \
		$(ECHO) $(GREEN) "[OK] " $(DEFAULT) $(TEAL) $<  $(DEFAULT)  " -----> " $(GREEN) $@ $(DEFAULT) || \
		$(ECHO) $(ERROR) " [ERROR] doesn't exist " $(YELLOW) $^ $(DEFAULT)


set_rules	:
			$(eval BUILD=tests)
			$(eval CFLAGS=${cflags.tests} $(cflags.common))
			$(eval LDFLAGS=${ldflags.tests} $(ldflags.common))


$(TEST_BIN)	:	set_rules $(OBJ_TEST) $(OBJ)
			@make -s -C ./lib/
			@$(CC) -o $(TEST_BIN) $(OBJ_TEST) $(OBJ) $(CFLAGS) $(LDFLAGS)

tests_run	:	set_rules $(TEST_BIN)
			@./$(TEST_BIN) && \
			$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
			$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)

set_rules_debug	:	
			$(eval BUILD=debug)
			$(eval CFLAGS=${cflags.debug} $(cflags.common))
			$(eval LDFLAGS=${ldflags.debug} $(ldflags.common))

debug		:	 set_rules_debug $(OBJ) $(OBJ_MAIN)
			@$(CC) -o $(BINNAME) $(OBJ) $(OBJ_MAIN) $(CFLAGS) $(LDFLAGS) && \
		        $(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
			$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)


clean:
	@make -s clean -C ./lib/
	@$(foreach i, $(OBJ), $(shell rm -rf $(i)) echo -e $(MAGENTA) "\tRemoved:  $(i)" $(DEFAULT);)
	@echo -e $(MAGENTA) "\tRemoved: $(OBJ_MAIN)" $(DEFAULT)
	@rm -rf $(OBJ_MAIN)
	@$(foreach k, $(OBJ_TEST), $(shell rm -rf $(i)) echo -e $(MAGENTA) "\tRemoved:  $(k)" $(DEFAULT);) 
	@find -name "*.gcda" -delete
	@find -name "*.gcno" -delete
	@find -name "*.gcov" -delete && \
        $(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
        $(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)


fclean:	clean
	@make -s fclean -C ./lib/
	@rm -rf $(BINNAME)
	@rm -rf $(TEST_BIN) && \
        $(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
        $(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)


re:	fclean all
