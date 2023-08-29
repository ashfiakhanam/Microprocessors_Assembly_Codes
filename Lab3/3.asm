.MODEL SMALL
.STACK 100H
.DATA
    ;DECLARE VARIABLES HERE
    SUN DB "Sunday$"
    MON DB "Monday$"
    TUE DB "Tuesday$"
    WED DB "Wednesday$"
    THU DB "Thursday$"
    FRI DB "Friday$"
    SAT DB "Saturday$"
    
         
.CODE
MAIN PROC
    ;INITIALYZING DS
    MOV AX,@DATA
    MOV DS,AX
    ;ENTER YOUR CODE HERE
   
    
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
    
    ;CHECKING THE NUMBER ACCORDING TO THE DAY OF THE WEEK NAME
    CMP BL, 1
    JE SUNDAY
    CMP BL, 2
    JE MONDAY
    CMP BL, 3
    JE TUESDAY
    CMP BL, 4
    JE WEDNESDAY
    CMP BL, 5
    JE THURSDAY
    CMP BL, 6
    JE FRIDAY
    CMP BL, 7
    JE SATURDAY
    JMP EXIT
    
    ;PRINTING ACCORDING TO THE WEEK
    SUNDAY:
    LEA DX, SUN
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    MONDAY:
    LEA DX, MON
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    TUESDAY:
    LEA DX, TUE
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    WEDNESDAY:
    LEA DX, WED
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    THURSDAY:
    LEA DX, THU
    MOV AH, 9
    INT 21H
    JMP EXIT
    
    FRIDAY:
    LEA DX, FRI
    MOV AH, 9
    INT 21H
    JMP EXIT 
    
    SATURDAY:
    LEA DX, SAT
    MOV AH, 9
    INT 21H
    JMP EXIT         
    
    
    
    EXIT:
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


