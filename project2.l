%{
#include "y.tab.h"
%}
%%
"," {return COMA;}
"int" {return INT;}
"char" {return CHAR;}
"float" {return FLOAT;}
make {return MAKE;}
[a-zA-Z]+ {return ID;}
; {return ';';}
\n {return -1;}
. {;}
%%
int yywrap()
{
return 0;
}