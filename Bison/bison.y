%{
#include "tp2ex2.c"    
void yyerror();       
%}

%token MODULE START END TYPE  OPEN CLOSE ENTIER BOOLEEN ID AF  SEMI  ADD  DIV  MUTLI  FLOAT KEYWORD  ARROW OOPEN CCLOSE BIND 
%start S

%%
 


S : MODULE  ID OPEN  START rec END CLOSE  ;

rec : DEC rec | DEC ;
DEC :TYPE  ID AF VAL SEMI;

 
NUMBER : ENTIER | FLOAT;
PARAMS  : ID | ID BIND PARAMS | ;

VAL : FNTYPE  
|ID MUTLI NUMBER
|ID ADD NUMBER
|ID DIV NUMBER 
|ID DIV ID 
|NUMBER ADD NUMBER   
|NUMBER DIV NUMBER
|ID ADD ID ;


FNTYPE : OOPEN PARAMS CCLOSE ARROW VAL;


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
