Algo test
Debut
while(){
    
 while(){
     while(){
         while(){ 
            while(){
                
            }

         }
     }
 }
}
end


// grammaire for know this 
S : MODULE  ID DEBUT INST END;

INST :EXP  |WHILE OOPEN CCLOSE OPEN   CLOSE  ;
EXP  :WHILE OOPEN CCLOSE OPEN INST  CLOSE ;
 
 
