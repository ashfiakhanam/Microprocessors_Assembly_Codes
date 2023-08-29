.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    X DB "1st input: $"
    Y DB "2nd input: $"
    Z DB "3rd input: $"     
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    
    ;PRINTING THE MED_1ST MESSAGE
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
    
    ;PRINTING THE MED_2ND MESSAGE
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
    
    ;PRINTING THE MED_3RD MESSAGE
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
    
    ;CHECKING MEDIAN NUMBER
    CMP BL, BH
    JL NEXT1
    CMP CL, BH
    JL NEXT1
    JMP NEXT2     
    
    NEXT1: CMP BH, CL
    JL MED_2ND 
    CMP BH, BL
    JL MED_2ND
    JMP NEXT2
    
    NEXT2: CMP BH, BL
    JL NEXT3
    CMP CL, BL
    JL NEXT3
    JMP MED_3RD
    
    NEXT3: CMP BL, CL
    JL MED_1ST
    CMP BL, BH
    JL MED_1ST
    JMP MED_3RD
    
    ;PRINTING 1ST INPUT IS MEDIAN
    MED_1ST:
    MOV DL, BL
    MOV AH, 2
    INT 21H
    JMP EXIT
    
    ;PRINTING 2ND INPUT IS MEDIAN
    MED_2ND:
    MOV DL, BH
    MOV AH, 2
    INT 21H
    JMP EXIT
    
    ;PRINTING 3RD INPUT IS MEDIAN
    MED_3RD:
    MOV DL, CL
    MOV AH, 2
    INT 21H
    JMP EXIT
    
    EXIT:
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


