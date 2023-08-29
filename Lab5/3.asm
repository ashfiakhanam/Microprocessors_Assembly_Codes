.MODEL CONV_CAP
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    MyArr1 DB 5 DUP(?)
    
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;INPUT YOUR CODE HERE
    
    ;TAKING ARRAY TO THE SI REGISTER
    LEA SI, MyArr1 
    
    ;INITIALIZING INPUT LOOP
    MOV CX, 5
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
    
    ;JUMPING TO PROCEED LINE 
    MOV AH, 2        
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    ;INITIALIZING FIRST LOOP
    MOV SI, 0         
    SORT1:
    CMP SI, 5
    JGE SORTED
    
    ;INITIALIZING SECOND LOOP
    MOV BX, SI
    ADD BX, 1
    SORT2:
    CMP BX, 5
    JGE PROCEED
    
    ;PUTTING CERTAIN INDEX ELEMENTS TO REGISTER
    MOV CH, MyArr1[SI]
    MOV CL, MyArr1[BX] 
    
    ;COMPARING THOSE TWO ELEMENTS
    CMP CH, CL
    JG CHANGE
    
    ;CONTINUING SECOND LOOP
    INC BX
    JMP SORT2
    
    ;CONTINUING FIRST LOOP
    PROCEED:
    INC SI
    JMP SORT1
    
    ;SORTING THOSE ELEMENTS
    CHANGE:
    MOV MyArr1[SI], CL
    MOV MyArr1[BX], CH
    
    ;CONTINUING SECOND LOOP
    INC BX
    JMP SORT2
    
    ;PREPARING TO PRINT THE SORTED ARRAY
    SORTED:
    LEA SI, MyArr1 
    MOV CX, 5
    
    ;PRINTING THE SORTED ARRAY
    PRINT:
    MOV DL, [SI]
    INT 21H
    MOV AH, 2
    MOV DL, 020H
    INT 21H    
    INC SI
    LOOP PRINT 
    
     
    ;EXIT TO DOS
    EXIT:
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


