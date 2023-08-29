.MODEL SMALL
.STACK 100H
.DATA
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    
    ;TAKING FIRST INPUT
    MOV AH, 1 
    INT 21H
    MOV BL, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;TAKING SECOND INPUT
    MOV AH, 1 
    INT 21H
    MOV BH, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;SUBSTRACTING TO ACTUAL VALUE
    SUB BL, 030H
    SUB BH, 030H 
      
    ;MAKING LOOP     
    DIV_CHK:
    ;LOOPING FROM FIRST INPUT TO LAST INPUT  
    CMP BL, BH
    JG EXIT
    
    ;DIVIDING NUMBERS BY 3 
    MOV AH, 00H
    MOV AL, BL
    MOV CL, 03H
    DIV CL
    
    ;CHECKING IF NUMBERS ARE DIVISIBLE BY 3
    CMP AH, 00H
    JE DIVISIBLE
    INC BL
    JMP DIV_CHK
    
    ;PRINTING THE DIVISIBLE NUBERS
    DIVISIBLE:
    MOV AH, 2
    MOV DL, BL
    ADD DL, 030H
    INT 21H
    INC BL
     
    ;JUMPING TO NEXT LINE AND THEN TO THE DIV_CHK OF THE LOOP
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP DIV_CHK
    
    EXIT:
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


