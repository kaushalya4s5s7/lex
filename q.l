%{
#include <stdio.h>
%}

%%

a|A|an|An|The|the|THE { printf("Article found: %s\n", yytext); }

[a-zA-Z]+ ;              
.|\n;
[\t]+ ; 
             

%%

int main() {
    printf("Enter the input:\n");
    yylex();
    return 0;
}

int yywrap() {                                        /*called when input is exhausted and return 0.*/
    return 1;
}


