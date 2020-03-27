##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## make / clean / fclean / re
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

XX	=	g++

## ------- DIR --------##
SRCDIR	=	./src

TESTDIR	=	./tests

## -------- SRC -------##

SRCTEST	=	$(TESTDIR)/ \

MAIN	=	$(SRCDIR)/main.cpp

SRC	=	$(SRCDIR)/	\

OBJ	=	$(SRC:.cpp=.o)

OBJ_MAIN	=	$(MAIN:.cpp=.o)

OBJ_TEST	=	$(SRCTEST:.cpp=.o)

## ------- FLAGS --------##

cxxflags.common	:=	-W -Wall -Wextra -I./include/ -pedantic
cxxflags.debug	:=	-g -g3
cxxflags.release	:=
cxxflags.tests	:=

ldflags.common	:=
ldflags.debug	:=
ldflags.release	:=
ldflags.tests	:=	-lcriterion -lgcov  --coverage

CXXFLAGS	:=	${cxxflags.release} ${cxxflags.common}
LDFLAGS	:=	${ldflags.release} ${ldflags.common}

## ------- BIN ----------##

BINNAME	=

TEST_BIN	=	$(BINNAME)_test

## --------- RULES --------##

all:
	@make -s $(BINNAME) && \
	$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)

$(BINNAME)	:	$(OBJ) $(OBJ_MAIN)
			@$(XX) -o $(BINNAME) $(OBJ) $(OBJ_MAIN) $(CXXFLAGS) $(LDFLAGS)

%.o	:	%.cpp
		@$(XX) $(CXXFLAGS) -c $< -o $@ && \
		$(ECHO) $(GREEN) "[OK] " $(DEFAULT) $(TEAL) $<  $(DEFAULT)  " -----> " $(GREEN) $@ $(DEFAULT) || \
		$(ECHO) $(ERROR) " [ERROR] can't find " $(YELLOW) $^ $(DEFAULT)


set_rules	:
			$(eval CXXFLAGS=${cxxflags.tests} $(cxxflags.common))
			$(eval LDFLAGS=${ldflags.tests} $(ldflags.common))


$(TEST_BIN)	:	set_rules $(OBJ_TEST) $(OBJ)
			@$(XX) -o $(TEST_BIN) $(OBJ_TEST) $(OBJ) $(CXXFLAGS) $(LDFLAGS)

tests_run	:	set_rules $(TEST_BIN)
			@./$(TEST_BIN) && \
			$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
			$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)

set_rules_debug	:
			$(eval CXXFLAGS=${cxxflags.debug} $(cxxflags.common))
			$(eval LDFLAGS=${ldflags.debug} $(ldflags.common))

debug		:	 set_rules_debug $(OBJ) $(OBJ_MAIN)
			@$(XX) -o $(BINNAME) $(OBJ) $(OBJ_MAIN) $(CXXFLAGS) $(LDFLAGS) && \
		        $(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
			$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)


clean:
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
	@rm -rf $(BINNAME)
	@rm -rf $(TEST_BIN) && \
        $(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
        $(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINNAME) $(DEFAULT)


re:	fclean all
