/*lex code to accept a valid email */
%{
int flag = 0;
%}
%%
[a-zA-Z0-9_.]+@[a-zA-Z]+\.(com|in)  { flag = 1; }
%%
int yywrap(){
    return 1;
}
int main() {
    yylex();
    if (flag == 1)
        printf("Accepted\n");
    else
        printf("Not Accepted\n");
    return 0;
}