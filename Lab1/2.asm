.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    A DB 3
    B DB 5
    C DB 7     
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
    MOV AL, A
    MOV BL, B
    MOV CL, C
    ;CALCULATING
    SUB BL, AL
    ADD CL, BL
    SUB CL, 2
    ;ASSIGNING VALUE TO VARIABLE A
    MOV A, CL
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN

