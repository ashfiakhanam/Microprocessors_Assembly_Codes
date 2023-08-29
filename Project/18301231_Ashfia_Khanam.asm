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

    ;INITIALIZING THE ROWS LOOP
    MOV CL, 030H
    ROWS:
    
    ;JUMPING TO NEXT LINE
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ;LOOP WILL STOP WHEN IT IS GREATER THAN INPUT
    INC CL
    CMP CL, BL
    JG EXIT
    
    ;INITIALIZING THE COLUMNS LOOP
    MOV CH, 031H
    COLS:
    ;LOOP WILL STOP WHEN IT IS GREATER THAN INPUT
    CMP CH, BL
    JG ROWS
    
    ;IF THE ROW NUMBER IS 1, 
    ;IT WILL PRINT FROM FIRST TO THE LAST NUM
    CMP CL, 031H
    JE PRINT
    
    ;IF THE ROW NUMBER IS THE LAST NUMBER, 
    ;IT WILL PRINT FROM FIRST TO THE LAST NUMBER
    CMP CL, BL
    JE PRINT
    
    ;IF THE COLUMN NUMBER IS 1, 
    ;IT WILL PRINT 1
    CMP CH, 031H
    JE PRINT
    
    ;IF THE COLUMN NUMBER IS LESS THAN EQUAL THE LAST NUMBER, 
    ;IT WILL PRINT SPACE AND FOR THE LAST NUMBER IT WILL PRINT THE NUMBER
    CMP CH, BL
    JLE PRINT2
    
    ;INCREMENTING COLUMN LOOP
    INC CH
    JMP COLS
    
    ;PRINTING THE NUM
    PRINT:
    MOV AH, 2        
    MOV DL, CH
    INT 21H
    
    INC CH
    JMP COLS 
    
    ;PRINTING THE NUM
    PRINT2:
    ;IF THE NUM IS LAST NUM IT WILL DIRECTLY PRINT
    CMP CH, BL
    JE PRINT
    
    ;ELSE IT WILL PRINT SPACE
    MOV AH, 2        
    MOV DL, 020H
    INT 21H
    
    INC CH
    JMP COLS 
    
   
    
   
    ;EXIT TO DOS
    EXIT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


