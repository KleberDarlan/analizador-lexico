%{
  /* need this for the call to atof() below */
  #include <math.h>
%}

%option noyywrap


DIGIT [0-9]
BINARY [0-1]
OCTAL [0-7]
HEXADECIMAL [0-9A-Fa-f]
KEYWORD  "and"|"as"|"assert"|"break"|"class"|"continue"|"def"|"del"|"elif"|"else"|"except"|"exec"|"finally"|"for"|"from"|"global"|"if"|"import"|"in"|"is"|"lambda"|"not"|"or"|"pass"|"print"|"raise"|"return"|"try"|"while"|"with"|"yield"
ID  [_|$|a-z][a-z0-9_]*
SPACE [" "]

%x COMMENT
%x COMMENT_LINES

%%

"#" { BEGIN(COMMENT); }
<COMMENT>\n { BEGIN(INITIAL); }
<COMMENT>. { }

"'''" { BEGIN(COMMENT_LINES); }
<COMMENT_LINES>"'''"  { BEGIN(INITIAL); }
<COMMENT_LINES>\n { }
<COMMENT_LINES>. { }

{KEYWORD} {
  printf("Palavra Chave \n");
}

{DIGIT}+"."{DIGIT}* {
 printf("Decimal \n");
}

"b"{BINARY}+ {
  printf("Binario \n");
}

"o"{OCTAL}+ {
  printf("Octal \n");
}

"h"{HEXADECIMAL}+ {
  printf("Hexadecimal \n");
}

"+" {
  printf("Soma \n");
}

"-" {
  printf("Subtração \n");
}

"*"  {
  printf("Multiplicação \n");
}

"/" {
  printf("Divisão \n");
}

"^" {
  printf("Potência \n");
}

"!" {
  printf("Ponto de Esclamação \n");
}

"@" {
  printf("Arroba \n");
}

"%" {
  printf("Porcentagem \n");
}

"&" {
  printf("E Lógico \n");
}

"(" {
  printf("Abertura de Parênteses \n");
}

")" {
  printf("Fechamento de Parênteses \n");
}

"{" {
  printf("Abertura de Chaves \n");
}

"}" {
  printf("Fechamento de Chaves \n");
}

"[" {
  printf("Abertura de Couchetes \n");
}

"]" {
  printf("Fechamento de Couchetes \n");
}

"?" {
  printf("Ponto de Interrogação \n");
}

"=" {
  printf("Igualdade \n");
}

">" {
  printf("Maior que \n");
}

"<" {
  printf("Menor que \n");
}

{ID}{1} {
  printf("Identificador \n");
}

{SPACE} {
  printf("Espaço em branco \n");
}

%%

int main(void) {
  yylex();

  return 0;
}
