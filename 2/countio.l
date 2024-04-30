/* 2. Lex program to count the number of printf and scanf statements */

%{
#include <stdio.h>
int p = 0, s = 0;
%}

%%
printf {fprintf(yyout,"writef"); p++;}
scanf {fprintf(yyout,"readf"); s++;}
%%

int yywrap() {
    return 1;
}

int main(int argc, char* argv[])
{
    FILE *f1, *f2;
    if(argc > 2)
    {
        f1 = fopen(argv[1], "r");
        f2 = fopen(argv[2], "w");
        if(!f1 || !f2)
        {
            printf("Error opening files\n");
            return 1;
        }
        yyin = f1;
        yyout = f2;
        yylex();
        printf("Number of printf: %d\n", p);
        printf("Number of scanf: %d\n", s);
        fclose(f1);
        fclose(f2);
    }
    else
    {
        printf("Usage: %s <input_file> <output_file>\n", argv[0]);
        return 1;
    }
    return 0;
}
