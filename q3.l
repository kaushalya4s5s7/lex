/* Definition Section */

%{
#include <stdio.h>
%}


/* Rule Section */ 

smallLetters [a-z]+
words [a-zA-Z]+
others .|\n
spaces [\t ]+
%%
{smallLetters}    printf("small Letters found: %s\n", yytext);     /*yytext= pointer to matched string.*/
{words}		;										  /* Ignore other characters */
{others}	;
{spaces}	;	
%%



int main() {
    printf("Enter an English sentence:\n");
    yylex();    									  /*call to invoke lexer, returns token.*/
    return 0;
}

int yywrap() {                                        /*called when input is exhausted and return 0.*/
    return 1;
}

