compile:
	@flex ./projeto.flex
	@gcc lex.yy.c
	@./a.out
