%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap yylineno

 
type        "int"|"bool"
entier      [0-9]+
booleen     "true"|"false"
id          [a-zA-Z_][a-zA-Z0-9_]*

%%
 
"module"    { printf("(%s) : Mot clé à la ligne %d\n", yytext, yylineno); }
"start"         { printf("(%s) : Mot clé à la ligne %d\n", yytext, yylineno); }
"end"           { printf("(%s) : Mot clé à la ligne %d\n", yytext, yylineno); }

{type}          { printf("(%s) : Type à la ligne %d\n", yytext, yylineno); }

{entier}        { printf("(%s) : Valeur entière à la ligne %d\n", yytext, yylineno); }

{booleen}       { printf("(%s) : Valeur booléenne à la ligne %d\n", yytext, yylineno); }

{id}            { printf("(%s) : Identificateur à la ligne %d\n", yytext, yylineno); }

"="            { printf("(%s) : Affectation à la ligne %d\n", yytext, yylineno); }

[ \t\n]         { /* ignore spaces */ }

.               { printf("Erreur lexicale (%s) à la ligne %d\n", yytext, yylineno); }

%%

int main(int argc, char **argv) {
    if(argc == 1) {
        printf("Donne le fichier en argument\n");
        return 1;
    }

 
    yyin = fopen(argv[1], "r");

    if(!yyin) {
        printf("Impossible d'ouvrir le fichier\n");
        return 1;
    }

    yylex();

    return 0;
}
