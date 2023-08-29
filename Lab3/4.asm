.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    X DB "1st side: $"
    Y DB "2nd side: $"
    Z DB "3rd side: $"
    A DB "Y$"
    B DB "N$"
    
    
         
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
    SUB AL, 030H
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
    SUB AL, 030H
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
    SUB AL, 030H
    MOV CL, AL
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;CHECKING a^2+b^2=c^2
    MOV AH, 00H
    MOV AL, BL
    MUL BL
    MOV DX, AX
    
    MOV AH, 00H
    MOV AL, BH
    MUL BH
    ADD DX, AX 
    
    MOV AH, 00H
    MOV AL, CL
    MUL CL
    
    CMP DX, AX
    JG NEXT1
    JMP NO
    
    ;CHECKING b^2+c^2=a^2
    NEXT1:
    MOV AH, 00H
    MOV AL, BH
    MUL BH
    MOV DX, AX
    
    MOV AH, 00H
    MOV AL, CL
    MUL CL
    ADD DX, AX 
    
    MOV AH, 00H
    MOV AL, BL
    MUL BL
    
    CMP DX, AX
    JG NEXT2
    JMP NO
    
    ;CHECKING c^2+a^2=b^2
    NEXT2:
    MOV AH, 00H
    MOV AL, CL
    MUL CL
    MOV DX, AX
    
    MOV AH, 00H
    MOV AL, BL
    MUL BL
    ADD DX, AX 
    
    MOV AH, 00H
    MOV AL, BH
    MUL BH
    
    CMP DX, AX
    JG YES
    JMP NO
    
    ;PRINTING Y
    YES:
    LEA DX, A
    MOV AH, 9
    INT 21H
    JMP EXIT 
    
    ;PRINTING N
    NO:
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


