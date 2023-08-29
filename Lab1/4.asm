.MODEL SMALL
.STACK 100H
.DATA
     
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    ;CALCULATING THE DENOMINATOR                          
    MOV AL,1
    SUB AL,4        
    ADD AL,13
    ADD AL,52
    MOV DL,AL        
    MOV AL,4
    MOV BL,2
    MUL BL
    SUB DL,AL
    ;CALCULATING THE NUMERATOR        
    MOV AL,10
    MOV BL,7        
    MUL BL
    ;FINAL CALCULATION
    DIV DL    
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


