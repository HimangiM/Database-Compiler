%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int TablesNos = 0;

struct Data{
    char data[50];
    struct Data* nextData;
};

struct Columns {
    char Name[50];
    struct Columns* NextColumn;
    struct Data* nextData;
};

struct Table{
    int columns;
    char Name[50];
    struct Columns* NextColumn;
}Tables[10];

void CreateTable(char TableName[]){
   // Tables[TablesNos] = (struct Table)malloc(sizeof(struct Table));
    strcpy(Tables[TablesNos].Name, TableName);
    Tables[TablesNos].columns = 0;
    Tables[TablesNos].NextColumn = NULL;
    printf("Table created sucessfully with name %s \n",Tables[TablesNos].Name); 
    TablesNos++;
}

void CreateColumn(char TableName[], char colName[]){
	int i=0;
    while(i<TablesNos){
        printf("inx");
        if(strcmp(Tables[i].Name, TableName) == 0){
            printf("in");
            struct Columns* col = (struct Columns*)malloc(sizeof(struct Columns));
            //assign Columns attributes
            strcpy(col->Name,colName);
            col->NextColumn  = NULL;
            col->nextData = NULL;
            printf("in2");
            //give add of col to the last col of table
            struct Columns* node =Tables[i].NextColumn;
            while(node->NextColumn!=NULL){
                node = node->NextColumn;
            }
            printf("in3");
            node->NextColumn = col;
            printf("in4");
        }
        ++i;
    }
}

void ShowColumns(char TableName[]){
	int i=0;
    while(i<TablesNos){
        if(strcmp(Tables[i].Name, TableName) == 0){
            struct Columns* node = NULL;
            node = Tables[i].NextColumn;
            while(node!=NULL){
                printf("->%s",node->Name);
                node = node->NextColumn;
            }
        }
      	++i;
    }
}
void enter_details(){
	char id[50], name[50], gender[10];
	FILE *fptr;
    fptr = fopen("table.txt","a");

    if(fptr == NULL){
    	printf("Error!");                
    }

    scanf("%s",id);
    strcat(id," ");
    fprintf(fptr,"%s",id);

	scanf("%s",name);
    strcat(name," ");
    fprintf(fptr,"%s",name);

	scanf("%s",gender);
    strcat(gender," ");
	fprintf(fptr,"%s",gender);

    fclose(fptr);
}
void display_details(){
	char c;
	FILE *fptr;
    fptr = fopen("table.txt","r");

    c = fgetc(fptr);
    while (c != EOF)
    {
        printf ("%c", c);
        c = fgetc(fptr);
    }
 
    fclose(fptr);
}
void select_details(){
	int i;
	char column[50], c;   
    scanf("%s", column);

    FILE *fptr;
    fptr = fopen("table.txt","r");
    
    if (!(strcmp(column,"id"))){
    	printf("ID");
    	i = fgetc(fptr);
	    while (i != EOF)
	    {
	        if (isdigit(i)){
	        	printf ("%d\n", i-48);
	        }
	        i = fgetc(fptr);
	    }
    }else if(!(strcmp(column, "name"))) {
    	int flag = 0;
    	c = fgetc(fptr);
    	while(c!=EOF){
    		if (c == '\n'){
    			flag = 1;
    		}
    		if (isspace(c) && flag==0){
    			flag = 1;
    		}else if(isspace(c) && flag==1){
    			flag = 0;
    			printf("\n");
    		}
    		if (flag==1 && !(isspace(c))){
    			printf("%c", c);
    		}
    		c = fgetc(fptr);
    	}

    }else if(!(strcmp(column, "gender"))){
    	char c;
    	int flag = 0;
    	c = fgetc(fptr);
    	while(c!=EOF){
    		if (c == '\n')
    			flag = 0;
    		else if (isspace(c) && flag ==0){
    			flag = 1;
    		}else if (isspace(c) && flag == 1){
    			flag = 2;
    		}
    		if(flag == 2){
    			printf("%c", c);
    		}
    		c = fgetc(fptr);
    	}
    }   
}
%}
%token ID COMA NUM INT CHAR FLOAT MAKE INSERT SHOW SELECT
%%
stmt:create {printf("Table created\n"); CreateTable("table");}
|feed {enter_details(); printf("Inserting into table\n");}
|display {display_details(); printf("\nDisplayed Results\n");}
|choose {select_details(); printf("\nSelected Results\n"); }
;
create:MAKE ID data st
;
feed:INSERT ID';'
;
display:SHOW ID';'
;
choose:SELECT ID';'
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
