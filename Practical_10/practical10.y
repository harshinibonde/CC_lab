%{
#include <stdio.h>
int yylex();
void yyerror(char *);
%}

%token FOR ID NUMBER RELOP INC DEC
%right '?' ':'
%left '+' '-'
%left '*' '/' '%'

%%

input:stmt { printf("Valid statement\n"); }
;

stmt: FOR '(' assignment ';' condition ';' update ')' stmt
| assignment ';'
| expr ';'
| '{' stmts '}'
;

stmts:stmts stmt
|
;

assignment:ID '=' expr
;

condition:expr RELOP expr
| expr
;

update:ID INC
| ID DEC
| INC ID
| DEC ID
| assignment
;

expr:ID
| NUMBER
| '(' expr ')'
| expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| expr '%' expr
| expr '?' expr ':' expr
;

%%

void yyerror(char *s){
    printf("Invalid statement\n");
}

int main(){
    yyparse();
    return 0;
}
