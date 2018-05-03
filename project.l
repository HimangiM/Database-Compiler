%{
#include "y.tab.h"
extern yylval;	
extern char* yytext;
#include <string.h>
#include <stdlib.h>
%}
%%
[0-9]+ {yylval=atoi(yytext); 
		return DIGIT;}
[","] {return COMA;}
create {return CREATE;}
table {return TABLE;}
[a-zA-Z]+ {printf("Values:%s", yytext);
		   char *str = malloc(strlen(yytext)+1);
		   strcpy(str, yytext);
		   return str;}
\n {return '\n';}
%%
int yywrap(){
	return 0;
}