%{
#include <stdio.h>
#include <string.h>

 
char *keywords[] = {
    "if","else","while","for","return",
    "debut","fin","int","float","print"
};
 
 

int isKeyword(char *word) {
    for(int i = 0; i < 10; i++) {
        if(strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

[0-9]+ {
    printf("NUMBER %s\n", yytext);
}

[a-zA-Z]+ {
    if(isKeyword(yytext))
        printf("KEYWORD %s\n", yytext);
    else
        printf("IDENTIFIER %s\n", yytext);
}

"=" {
    printf("EQUAL\n");
}

"*" {
    printf("MUL\n");
}

[ \t\n]+ { }

%%

int main() {
    yylex();
    return 0;
}
