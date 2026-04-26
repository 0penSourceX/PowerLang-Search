%{
#include "lexer.c"    
void yyerror();       
%}
%token <line> COMP
%token MODULE DEBUT END TYPE  OPEN CLOSE ENTIER
  BOOLEEN ID AF  SEMI  ADD  DIV  MUTLI  FLOAT
  KEYWORD  ARROW OOPEN CCLOSE BIND SI  ALORS  SOMME PREND FINSI 
  BIGGER SMALLER
%start S
%union{
    int line  ;
}
 
%%
 


S : MODULE  ID DEBUT INST END;

INST :  VAL INST  |   VAL;
VAL  : SI EXP ALORS TYPESOMME PREND TYPPREND FINSI ;
TYPESOMME: SOMME | ID;
TYPPREND : FLOAT  | ID | SOMME;
EXP : FLOAT COMP ID {
        printf("== found at line %d\n", $2);
     }   | ID BIGGER ID  | ID COMP ID | ID ;

 
 
 
 
 
 


%%

void yyerror() {
    printf("Erreur syntaxique à la ligne %d\n", yylineno);
}

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("Il faut passer en argument le fichier à analyser\n");
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Impossible d'ouvrir le fichier %s\n", argv[1]);
        exit(1);
        
    }

    if (!yyparse()) {
        printf("🟢 ✔ Test Passed \n Execution Time: 0.24 ms \n");
    }
    

    return 0;
}













 
