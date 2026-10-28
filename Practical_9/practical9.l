%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+      {yylval = atoi(yytext); return NUMBER;}
[+\-*/%^]   {return yytext[0];}
"++"        {return INC;}
"--"        {return DEC;}
[ \t]       {;}
\n          {return '\n';}
.           {return ("ErrorL");}
%%

int yywrap(){
    return 1;
}
