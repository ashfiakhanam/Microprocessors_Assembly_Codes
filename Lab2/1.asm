.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    X DB "The result is$"
     
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    
    ;TAKING A VALUE UPTO 3 AS INPUT
    MOV AH, 1
    INT 21H
    MOV BL, 30H
    SUB AL, BL
    MOV CL, AL
    MUL CL
    MOV BL, AL                      
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;PRINTING THE MESSAGE
    LEA DX, X  
    MOV AH, 9     
    INT 21H
     
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    ;PRINTING THE MULTIPLIED VALUE
    MOV DL, BL
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


