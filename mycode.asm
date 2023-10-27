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
                              
                              
               
               
               
               
    SUB ascii+2, 48
    SUB ascii+3, 48
    SUB ascii+4, 48
    SUB ascii+5, 48
    
                         
    MOV CX, 0
    MOV BX, 0
    
parse:
    
    CMP BX, 4
    JZ get_ascii                  
                         
    MOV AL, ascii[BX+2]
    MUL pesos[bx]
    ADD CL, AL
    
    INC BX
    JMP parse
                              
    
    

get_ascii:
             
    
    
    MOV AL, cl
    NOT AL
    ADD AL, 1
    MOV BL, 10
    DIV BL
                    

    MOV DX, AX
    
                               
print:    
                              
    MOV AL, 03h
    MOV AH, 00h
    INT 10H
    
    MOV AX, 0b800h
    mov ES, AX
    
    MOV DI, 0
                   

signo_menos:               
    
    ADD DH, 48
    MOV ES:[DI+2], DH
                               
                               
fin:
    MOV AH, 4Ch 
    INT 21h


END



