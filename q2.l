/* Definition Section */

%{
#include <stdio.h>
%}


/* Rule Section */ 


articles a|A|an|An|AN|the|The|THE
verbs run|walk|eat|dive|swim|play|chew
words [a-zA-Z]+
others .|\n
spaces [\t ]+
%%
{articles} printf("Article found: %s\n", yytext);     /*yytext= pointer to matched string.*/
{verbs}  printf("Verbs found are: %s\n", yytext);
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

