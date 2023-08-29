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
    
    ;TAKING LAST INPUT
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
        
    ;CALCULATING THE END POINT
    SUB BL, 030H 
    SUB BH, 030H
    MOV AH, 00H
    MOV AL, BL
    MUL BH
    MOV BH, AL
    
    ;INITIALIZING THE LOOP FOR MULTIPLICATION TABLE
    MOV DH, BL    
    START:
    
    ;CHECKING IF ENDPOINT IS REACHED
    CMP BL, BH
    JG EXIT
    
    ;PRINTING THE MULTIPLICATION TABLE
    MOV AH, 2
    MOV DL, BL
    ADD DL, 030H
    INT 21H 
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;PREPARING FOR NEXT LOOP
    ADD BL, DH    
    JMP START
    
   
    ;EXIT TO DOS
    EXIT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


