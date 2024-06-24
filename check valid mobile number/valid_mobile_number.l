/* 12. Lex program to check valid Mobile Number */

%{
	#include<stdio.h>
%}

/* Rule Section */
%%

[1-9][0-9]{9} {printf("\nMobile Number Valid\n");}

.+ {printf("\nMobile Number Invalid\n");}

%%

int yywrap(){}

// driver code 
int main()
{
	printf("\nEnter Mobile Number : ");
	yylex();
	printf("\n");
	return 0;
}
