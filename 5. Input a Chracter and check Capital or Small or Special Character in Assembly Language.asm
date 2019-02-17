
;Title:- Input a Chracter and check Capital or Small or Special Character in Assembly Language

;Purpose: Solve Some Easy Problem in Assembly Language
;@author Md. Sadikul Islam Shuvo


PRINT MACRO P
    MOV AH,9
    LEA DX,P		;PRINT str
    INT 21H
    ENDM

.MODEL SMALL
.STACK 100H

.DATA
str1 DB "Please Enter a Chracter: $"
str2 DB "It is a Capital Letter: $"
str3 DB "It is a Small Letter: $" 
str4 DB "It is not any Alphabet It is a Number or Special Chracter: $"


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT str1
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CALL New_Line
    
    CMP BL,65
    
    JGE LEVEL1
    
    PRINT str4
MOV AH,4CH
INT 21H
    
    LEVEL1:
    CMP BL,90
    
    JLE LEVEL2
    
    CMP BL,97
    
    JGE LEVEL3
    
    PRINT str4
MOV AH,4CH
INT 21H

     LEVEL2:
     PRINT str2
MOV AH,4CH
INT 21H

     LEVEL3:
     PRINT str3
MOV AH,4CH
INT 21H 

    
MOV AH,4CH
INT 21H
        
ENDP


New_Line PROC
    MOV AH,2
    MOV DX,10
    INT 21H       
    MOV AH,2		;CALL New_Line 
    MOV DX,13
    INT 21H
    RET 
    ENDP


END MAIN
