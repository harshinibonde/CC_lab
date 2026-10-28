%{
#include <stdio.h>
int count = 0;
%}

%%
.*(COM|com)$ {printf("Ends with com/COM\n"); count++;}

.* {printf("Does not end with com/COM\n");}

\n ;
%%

int main() {
    printf("Enter the input:\n");
    yylex();
    printf("\nTotal lines ending with com/COM: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
