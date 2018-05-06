%{
#include<stdio.h>
%}
%token ID COMA INT CHAR FLOAT MAKE INSERT
%%
stmt:create {printf("valid2\n");}
|feed {printf("valid\n");}
;
create:MAKE ID data st
;
feed: INSERT ID '('ID feedst')'
;
feedst:COMA ID|' '
;
st:COMA data
|';'
;
data:ID INT|ID FLOAT|ID CHAR
;
%%
main()
{
printf("Enter declaration\n");
while(1){
yyparse();
}
}
int yyerror()
{
return 1;
}
