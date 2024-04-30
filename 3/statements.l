/* 3. Lex program to find simple and compound statements */

%{
#include <stdio.h>
int simple_count = 0;
int compound_count = 0;
%}

%%
";"     { simple_count++; }
"{"     { compound_count++; }
%%

int yywrap() {
    return 1;
}

int main(int argc, char* argv[])
{
    FILE *f1;
    if(argc > 1)
    {
        f1 = fopen(argv[1], "r");
        if(!f1)
        {
            printf("Error opening file\n");
            return 1;
        }
        yyin = f1;
        yylex();
        printf("Number of simple statements: %d\n", simple_count);
        printf("Number of compound statements: %d\n", compound_count);
        fclose(f1);
    }
    else
    {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    return 0;
}
