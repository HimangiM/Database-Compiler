%{
#include<stdio.h>
%}
%token ID COMA INT CHAR FLOAT MAKE
%%
stmt:type {printf("valid\n");}
;
type:MAKE ID data st
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