.model small


.DATA 
   
   ascii db 5, 0, 0, 0, 0, 0, 0;
   pesos db 8, 4, 2, 1;
   
   
.CODE


;---------------------------+    
    MOV AX, SEG ascii   ;   | Inicializa segmento 
    MOV DS, AX          ;   |         de 
                        ;   |        Datos
;---------------------------+
                         
    MOV AX, 0                        
    MOV AL, 15d
    MOV BL, 10d
    DIV BL
 
                            
                            
                            
;----------------------------+
    MOV DX, OFFSET ascii   ; |
    MOV AH, 0Ah            ; | 
    INT 21h                ; |
;----------------------------+                     
                              
    MOV DI, 0                                
               
               
               
               
    SUB ascii+2, 48
    SUB ascii+3, 48
    SUB ascii+4, 48
    SUB ascii+5, 48
    
                         
    MOV CX, 0
    MOV BX, 0
    
parse:
    
    CMP BX, 4
    JZ init_video                  
    
                         
    MOV AL, ascii[BX+2]
    MUL pesos[BX]
    ADD CL, AL
    
    INC BX
    JMP parse
                              
    
    
init_video:
    MOV AL, 03h
    MOV AH, 00h
    INT 10H
    
    MOV AX, 0b800h
    mov ES, AX    
    

c1: 
    MOV AX, 0
    MOV AL, CL 
    NOT AL
    MOV BL, 10
    DIV BL
    MOV DX, AX
    MOV BX, AX
    
    AND BL, 1000b
    CMP BL, 0
    JE signo
    

signo:
   
    
              
    MOV ES:[DI+2], 45
    ADD DI, 2    
                               
print:    
    ADD DH, 48
    MOV ES:[DI+2], DH



    MOV DI, 160
c2:        
    MOV AX, 0
    MOV AL, CL 
    NOT AL
    INC AL   
    MOV BL, 10
    DIV BL
    MOV DX, AX
    MOV BX, AX
    
    AND BX, 1000b
    CMP BH, 0
    JE signo2
    

signo2:
        
              
    MOV ES:[DI+2], 45
    ADD DI, 2    
                               
    ADD DH, 48
    MOV ES:[DI+2], DH  
                               
                               
fin:
    MOV AH, 4Ch 
    INT 21h


END



