.model small


.DATA 
   
   ascii db 5, 0, 0, 0, 0, 0;
   
   
   
.CODE


;---------------------------+    
    MOV AX, SEG ascii   ;   | Inicializa segmento 
    MOV DS, AX          ;   |         de 
                        ;   |        Datos
;---------------------------+
                         
                         
                         
    MOV DX, OFFSET ascii 
    MOV AH, 0Ah
    INT 21h


                 
;---------------------------                     
    
      
    MOV BX, 2
      
      
parse:

    
    CMP BX, 6
    JZ fin  
    
    MOV AL, ascii+bx
    SUB AL, 48
    
    INC BL
    JMP PARSE
    
    
fin:
    MOV AH, 4Ch 
    INT 21h


END



