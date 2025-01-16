%{
#include <stdio.h>

// Declare counters
int count_numbers = 0;    // To count numeric sequences
int count_alphabets = 0;  // To count alphabetic sequences
int count_space = 0;      // To count spaces
int count_lines = 0;      // To count new lines
%}

%%
[0-9]+      { count_numbers++; }       // Count numbers
[a-zA-Z]+   { count_alphabets++; }     // Count alphabetic sequences
[ \t]+      { count_space++; }         // Count spaces and tabs
\n          { count_lines++; }         // Count new lines
.           ;                          // Ignore other characters
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;  // Set the input file for LEX
    yylex();      // Call the lexical analyzer
    fclose(file); // Close the file

    // Print results
    printf("Numbers: %d\n", count_numbers);
    printf("Alphabets: %d\n", count_alphabets);
    printf("Spaces: %d\n", count_space);
    printf("Lines: %d\n", count_lines);

    return 0;
}

