/* 4. Lex program to count the number of identifiers. */

%{
#include <stdio.h>
int identifier_count = 0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { identifier_count++; }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of identifiers: %d\n", identifier_count);
    return 0;
}