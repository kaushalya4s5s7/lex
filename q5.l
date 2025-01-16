%{
#include <stdio.h>
#include <stdlib.h>

// Function to validate a date
int is_valid_date(int day, int month, int year) {
    int days_in_month[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // Check for leap year
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        days_in_month[2] = 29;
    }

    // Validate day, month, and year
    if (month < 1 || month > 12) return 0;
    if (day < 1 || day > days_in_month[month]) return 0;
    return 1;
}
%}

%%

[0-9]{2}/[0-9]{2}/[0-9][0-9]{4} {
    int day, month, year;
    sscanf(yytext, "%d/%d/%d", &day, &month, &year);
    if (is_valid_date(day, month, year)) {
        printf("Valid ");
    } else {
        printf("Invalid ");
    }
}

[ \t\n]+ { /* Ignore whitespace */ }

. { /* Ignore invalid input */ }

%%

int main() {
    printf("Enter dates separated by spaces (format: dd/mm/YYYY):\n");
    yylex();
    printf("\n");  // Print a newline after processing the input
    return 0;
}

