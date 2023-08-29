.MODEL CONV_CAP
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    MyArr1 DW 3 DUP(?)
    X DB "Enter Three numbers: $"
    Y DB "Largest Number: $"
    
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;INPUT YOUR CODE HERE
    
    ;PRINTING THE FIRST MESSAGE
    LEA DX, X
    MOV AH, 9
    INT 21H 
    
    ;TAKING ARRAY TO THE SI REGISTER
    LEA SI, MyArr1 
    
    ;INITIALIZING INPUT LOOP
    MOV CX, 3
    INPUT:
    MOV AH, 1    
    INT 21H

    ;PUTTING INPUT TO THE ARRAY
    MOV [SI], AL 
    
    ;PUTTING AN SPACE
    MOV AH, 2
    MOV DL, 020H
    INT 21H 
        
    ;CONTINUING THE LOOP
    INC SI
    LOOP INPUT  
    
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
    
    ;TAKING ARRAY TO THE SI REGISTER AGAIN
    LEA SI, MyArr1 
            
    ;INITIALIZING COMPARE LOOP 
    MOV CX, 3 
    MOV DL, 00H
    COMPARE:    
    ;TAKIING ELEMENTS FROM THE ARRAY
    MOV BL, [SI]
    
    ;COMPARING THE MAXIMUM NUMBER
    CMP BL, DL
    JG MAXIMUM
    
    ;CONTINUING THE LOOP
    INC SI
    LOOP COMPARE
    JMP MAX
    
    ;MOVING THE MAXIMUM NUMBER TO DL REGISTER
    MAXIMUM:
    MOV DL, BL
    
    ;CONTINUING THE LOOP
    INC SI
    LOOP COMPARE
    
    ;PRINTING THE MAXIMUM NUMBER
    MAX:
    MOV AH, 2
    INT 21H
    
    

    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


