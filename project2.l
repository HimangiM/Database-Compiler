%{
#include "y.tab.h"
%}
%%
"," {return COMA;}
"int" {return INT;}
"char" {return CHAR;}
"float" {return FLOAT;}
show {return SHOW;}
select {return SELECT;}
insert {return INSERT;}
make {return MAKE;}
[a-zA-Z]+ {return ID;}
; {return ';';}
[()] {return *yytext;}
\n {return -1;}
. {;}
%%
int yywrap()
{
return 0;
}
