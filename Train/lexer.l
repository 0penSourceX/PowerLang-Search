%{
#include "tp2ex2.tab.h"    
%}

%option noyywrap
%option yylineno

type    ("int"|"bool"|"mut"|"let"|"const")
entier   [0-9]+
booleen  ("true"|"false")
id       [a-zA-Z_][a-zA-Z0-9_]*
float    [0-9]+"."[0-9]+
%%
 
"Algo"       { return MODULE; }
"Debut"        { return DEBUT; }
"end"          { return END; }
"Si"           {return SI;}
"Alors"        {return ALORS;}
"somme"        {return SOMME;}
"Prend"        {return PREND;}
"FinSi"        {return FINSI;}
{type}         {return TYPE;}
{float}        { return FLOAT; }
{entier}       { return ENTIER; }
{booleen}      { return BOOLEEN; }
{id}           { return ID; }
 
"+"            {return ADD;}
"/"            {return DIV;}
"*"            {return MUTLI;}
"==" {
    yylval.line = yylineno;
    return COMP;
}
"="            { return AF; }
";"            { return SEMI; }
"=>"           { return ARROW; }
"{"            { return OPEN; }
"}"            { return CLOSE; }
"("            {return OOPEN;}
")"            {return CCLOSE;}
","            {return BIND;}
">"            {return BIGGER;}
"<"            {return SMALLER;}
[ \t\n]+       { /* ignore whitespace */ }

.              {
                   printf("Erreur lexicale (%s) à la ligne %d\n", yytext, yylineno);
                   exit(0);
                }

 


%%
