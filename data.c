/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

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
    printf("table created sucessfully with name %s \n",Tables[TablesNos].Name); 
    TablesNos++;
}

void CreateColumn(char TableName[], char colName[]){
    for(int i= 0; i<TablesNos; i++){
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
    }
}

void ShowColumns(char TableName[]){
     for(int i= 0; i<TablesNos; i++){
        if(strcmp(Tables[i].Name, TableName) == 0){
            struct Columns* node = NULL;
            node = Tables[i].NextColumn;
            while(node!=NULL){
                printf("->%s",node->Name);
                node = node->NextColumn;
            }
        }
    }
}


int main()
{
    char a[50],c[50];
    int cols,i;
    printf("Table Name?");
    scanf("%s",a);
    CreateTable(a);
    printf(" %d No of Cols?",TablesNos);
    scanf("%d",&cols);
    for(i=0;i<cols;i++){
        printf("enter col%d name -",i);
        scanf("%s",c);
        printf("scanned");
        CreateColumn(a,c);
    }
    
    ShowColumns(a);
    
    return 0;
}


