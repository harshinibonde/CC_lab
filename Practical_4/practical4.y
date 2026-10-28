%{
#include <stdio.h>
#include <stdlib.h>

int yywrap(void);
int yyerror(char *s);
int yylex(void);
%}

%token NUM

%%
E : E '+' T| E '-' T| T;
T : T '*' F| T '/' F| F;
F : '(' E ')'| NUM;
%%

int yyerror(char *s)
{
    printf("Invalid Expression");
    exit(0);
}

int main()
{
    printf("Enter an Expression: ");
    yyparse();
    printf("Valid Expression");
    return 0;
}
