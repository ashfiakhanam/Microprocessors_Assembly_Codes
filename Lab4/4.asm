.MODEL SMALL
.STACK 100H
.DATA

    W DB "ENTER A HEX DIGIT: $"
    X DB "IN DECIMAL IT IS $"
    Y DB "DO YOU WANT TO DO IT AGAIN?: $"
    Z DB "ILLEGAL CHARACTER, INSERT AGAIN: $" 
    
    A DB "10$"
    B DB "11$"
    C DB "12$"
    D DB "13$"
    E DB "14$"
    F DB "15$"
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    
    ;STARTING THE LOOP
    START: 
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;PRINTING THE STRING STORED IN W
    LEA DX, W
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
    
    ;CHECKING IF IT'S HEX NUMBER OR NOT 
    HEX_CHK:
    CMP BL, 030H
    JGE HEX_CHK2
    JMP NOT_HEX
    
    HEX_CHK2:    
    CMP BL, 039H
    JLE NUM_HEX
    
    CMP BL, 041H
    JGE CHR_HEX_CHK
    JMP NOT_HEX
    
    CHR_HEX_CHK:
    CMP BL, 046H
    JLE CHR_HEX
    JMP NOT_HEX
    
    ;IF THE HEX NUMBER IS FROM 1-9 AND PRINTING IT
    NUM_HEX:
    LEA DX, X
    MOV AH, 9
    INT 21H
    
    MOV DL, BL 
    MOV AH, 2
    INT 21H
        
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP AGAIN 
    
    
    ;IF THE HEX NUMBER IS FROM A-F
    CHR_HEX:
    LEA DX, X
    MOV AH, 9
    INT 21H
    
    ;CHECKING THE CHARACTER FROM A-F
    CMP BL, 041H
    JE CHR_A
    CMP BL, 042H
    JE CHR_B
    CMP BL, 043H
    JE CHR_C
    CMP BL, 044H
    JE CHR_D
    CMP BL, 045H
    JE CHR_E
    CMP BL, 046H
    JE CHR_F
    
    ;PRINTING A
    CHR_A:
    LEA DX, A
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;PRINTING B
    CHR_B:
    LEA DX, B
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;PRINTING C
    CHR_C:
    LEA DX, C
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;PRINTING D
    CHR_D:
    LEA DX, D
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;PRINTING E
    CHR_E:
    LEA DX, E
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;PRINTING F
    CHR_F:
    LEA DX, F
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    JMP AGAIN
    
    ;IF USER WANTS TO DO IT AGAIN FROM THE FIRST PLACE
    AGAIN:
    LEA DX, Y
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H        
    MOV CL, AL
    
    ;CHECKING Y-N
    YN_CHK:
    CMP CL, 059H
    JE START
    CMP CL, 079H
    JE START
    CMP CL, 04EH
    JE EXIT
    CMP CL, 06EH
    JE EXIT
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    ;IF THE Y-N INPUT IS INVALID
    JMP AGAIN
    
    ;IF THE INPUT IS NOT HEX
    NOT_HEX:
    LEA DX, Z
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
    JMP HEX_CHK
    
    
   
    ;EXIT TO DOS
    EXIT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


