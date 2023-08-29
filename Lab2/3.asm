.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    X DB "Enter First Initial: $"
    Y DB "Enter Second Initial: $"
    Z DB "Enter Third Initial: $"     
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
    
    ;PRINTING THE THIRD MESSAGE
    LEA DX, Z
    MOV AH, 9
    INT 21H
    
    ;TAKING INPUT
    MOV AH, 1
    INT 21H
    MOV CL, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;PRINTING THE LAST INPUT
    MOV DL, CL
    MOV AH, 2
    INT 21H
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H  
    
    ;PRINTING THE MIDDLE INPUT
    MOV DL, BH
    MOV AH, 2
    INT 21H
    
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
    
    ;PRINTING THE FIRST INPUT
    MOV DL, BL
    MOV AH, 2
    INT 21H
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


