/* 1. Write a lex program to count the number of comment lines in a given c program. Also eliminate them and copy that program into separate file. */

%{
#include <stdio.h>
int comment_count = 0;
FILE *output; // Declare output file pointer
%}

COMMENT_LINE "//".*\n
BLOCK_COMMENT "\/\*".*"\*\/"

%%

{COMMENT_LINE}    { comment_count++; }
{BLOCK_COMMENT}   { /* do nothing, just ignore block comments */ }
[^\/\n]+          { fprintf(output, "%s\n", yytext); }

%%

int yywrap() {
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input = fopen(argv[1], "r");
    if (!input) {
        printf("Error opening file %s\n", argv[1]);
        return 1;
    }

    yyin = input;

    // Open a new file for writing without comments
    output = fopen("output.c", "w"); // Assign output file pointer
    if (!output) {
        printf("Error creating output file\n");
        fclose(input);
        return 1;
    }

    // Process the input, eliminating comments and copying to output
    yylex();

    printf("\nNumber of comment lines: %d\n", comment_count);

    fclose(input);
    fclose(output);

    return 0;
}
