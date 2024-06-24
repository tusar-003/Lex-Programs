/*lex program to implement 
		- a simple calculator.*/

%{ 
int op = 0,i; 
float a, b; 
void digi(); // Declare the digi function to avoid implicit declaration warning
%}

dig [0-9]+|([0-9]*)"."([0-9]+) 
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n 
%% 

{dig} {digi();} 
{add} {op=1;} 
{sub} {op=2;} 
{mul} {op=3;} 
{div} {op=4;} 
{pow} {op=5;} 
{ln} {printf("\n The Answer :%f\n\n",a);} 

%% 
void digi() // Specify return type as void since it does not return a value
{ 
if(op==0) 

/* atof() is used to convert 
	- the ASCII input to float */
a=atof(yytext); 

else
{ 
b=atof(yytext); 

switch(op) 
{ 
case 1:a=a+b; 
	break; 

case 2:a=a-b; 
break; 

case 3:a=a*b; 
break; 

case 4:a=a/b; 
break; 

case 5:for(i=a;b>1;b--) 
a=a*i; 
break; 
} 
op=0; 
} 
} 

int main(int argv, char *argc[]) // Explicitly specify return type as int
{ 
yylex(); 
return 0; // Return a value to match the int return type
} 

int yywrap() // Explicitly specify return type as int
{ 
return 1; 
} 
