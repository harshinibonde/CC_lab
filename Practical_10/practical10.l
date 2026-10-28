%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

"for"  { return FOR; }
"++"   { return INC; }
"--"   { return DEC; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
[0-9]+  { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n] ;
. { return yytext[0]; }

%%

int yywrap(){
    return 1;
}
