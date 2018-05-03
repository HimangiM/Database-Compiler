%{
#include <stdio.h>	
#include <string.h>
extern char* yytext;
%}
%token LETTER DIGIT COMA CREATE TABLE
%%
stmts:type {printf("Valid");}
;
type:CREATE TABLE LETTER {printf("Table: %d", $3);}
;
%%
main(){
	yyparse();
	return 0;
}
int yyerror(char *s){
	printf("N");
}