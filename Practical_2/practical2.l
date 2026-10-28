%{
#include <stdio.h>
int comments = 0;
int keywords = 0;
int identifiers = 0;
int words = 0;
int spaces = 0;
int lines = 0;
%}

%%
"//".*	  {comments++;}
(int|char|float|for|while|if|else|break|return|main|long|short|void)	{keywords++; words++;}
[a-zA-Z_][a-zA-Z0-9_]*	 {identifiers++; words++;}
[a-zA-Z]+	         {words++;}
" "	                 {spaces++;}
\t	                 {spaces+=4;}
\n	                 {lines++;}
.	                                        ;
%%

int main(){
	printf("Enter the program:\n");
	yylex();
	printf("Total Comments count:    %d\n", comments);
	printf("Total Keywords count:    %d\n", keywords);
	printf("Total Identifiers count: %d\n", identifiers);	
	printf("Total Words count:       %d\n", words);
	printf("Total Spaces count:      %d\n", spaces);
	printf("Total Lines count:       %d\n", lines);
	return(0);
}


int yywrap(){
	return (1);
}


