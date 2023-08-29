.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    X DB "1st input: $"
    Y DB "2nd input: $"
    A DB "Divisible$"
    B DB "Not Divisible$"
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    
    ;PRINTING THE FIRST MESSAGE
    LEA DX, X
    MOV AH, 9
    INT 21H
    
    ;TAKING INPUT
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;PRINTING THE SECOND MESSAGE
    LEA DX, Y
    MOV AH, 9
    INT 21H
    
    ;TAKING INPUT
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;CHECKING IF THE SUM VALUE IS DIVISIBLE BY 2
    MOV AH, 00H
    SUB BL, 030H
    SUB BH, 030H
    ADD BH, BL
    MOV AL, BH
    MOV DL, 02H
    DIV DL
    CMP AH, 00H
    JE DIVISIBLE
    
    ;CHECKING IF THE SUM VALUE IS DIVISIBLE BY 3
    MOV AH, 00H
    MOV AL, BH
    MOV DL, 03H
    DIV DL
    CMP AH, 00H
    JE DIVISIBLE
    JMP NOT_DIVISIBLE
    
    ;PRINTING DIVISIBLE
    DIVISIBLE:
    LEA DX, A
    MOV AH, 9
    INT 21H
    JMP EXIT         
    
    ;PRINTING NOT DIVISIBLE
    NOT_DIVISIBLE: 
    LEA DX, B
    MOV AH, 9
    INT 21H 
    JMP EXIT
    
    EXIT:
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


