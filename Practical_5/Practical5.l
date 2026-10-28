%{
#include<stdio.h>

char changeCase(char a){
	if(a>='a' && a<='z'){
		return a-32;
	}else if(a>='A' && a<='Z'){
		return a+32;
	}
}
%}

%%
[A-Za-z] {putchar(changeCase(yytext[0]));}
. {putchar(yytext[0]);}
%%

int main(){
	printf("Enter a Character: ");
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
