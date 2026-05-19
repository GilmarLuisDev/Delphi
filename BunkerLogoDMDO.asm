.MODEL SMALL
.STACK                 
.DATA 
    ;=========================I===================   
    MATRIZ01_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ01_C1 DB 01001001B ;COL02     ---2001H
    MATRIZ01_C2 DB 01001001B ;COL03     ---2002H
    MATRIZ01_C3 DB 01001111B ;COL04     ---2003H
    MATRIZ01_C4 DB 01111000B ;COL05     ---2004H
    ;=========================N===================   
    MATRIZ02_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ02_C1 DB 01000000B ;COL02     ---2001H
    MATRIZ02_C2 DB 01000000B ;COL03     ---2002H
    MATRIZ02_C3 DB 01000000B ;COL04     ---2003H
    MATRIZ02_C4 DB 01111111B ;COL05     ---2004H
    ;=========================T===================   
    MATRIZ03_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ03_C1 DB 00000010B ;COL02     ---2001H
    MATRIZ03_C2 DB 00011100B ;COL03     ---2002H
    MATRIZ03_C3 DB 00110000B ;COL04     ---2003H
    MATRIZ03_C4 DB 011111111B ;COL05     ---2004H 
    ;=========================E===================   
    MATRIZ04_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ04_C1 DB 00001000B ;COL02     ---2001H
    MATRIZ04_C2 DB 00011100B ;COL03     ---2002H
    MATRIZ04_C3 DB 00100010B ;COL04     ---2003H
    MATRIZ04_C4 DB 01000001B ;COL05     ---2004H 
    ;=========================R===================   
    MATRIZ05_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ05_C1 DB 01001001B ;COL02     ---2001H
    MATRIZ05_C2 DB 01001001B ;COL03     ---2002H
    MATRIZ05_C3 DB 01001001B ;COL04     ---2003H
    MATRIZ05_C4 DB 01000001B ;COL05     ---2004H
    ;=========================F===================   
    MATRIZ06_C0 DB 01111111B ;COL01     ---2000H
    MATRIZ06_C1 DB 00001001B ;COL02     ---2001H
    MATRIZ06_C2 DB 00011001B ;COL03     ---2002H
    MATRIZ06_C3 DB 00101001B ;COL04     ---2003H
    MATRIZ06_C4 DB 01001111B ;COL05     ---2004H  
    ;=========================A===================   
    MATRIZ07_C0 DB 01111110B ;COL01     ---2000H
    MATRIZ07_C1 DB 01001001B ;COL02     ---2001H
    MATRIZ07_C2 DB 01001001B ;COL03     ---2002H
    MATRIZ07_C3 DB 01001001B ;COL04     ---2003H
    MATRIZ07_C4 DB 01111110B ;COL05     ---2004H
    ;=========================Z===================   
    MATRIZ08_C0 DB 00011110B ;COL01     ---2000H
    MATRIZ08_C1 DB 00100101B ;COL02     ---2001H
    MATRIZ08_C2 DB 01010001B ;COL03     ---2002H
    MATRIZ08_C3 DB 00100101B ;COL04     ---2003H
    MATRIZ08_C4 DB 00011110B ;COL05     ---2004H
             
    MSJ DB "se ha enviado al matrix display$"
   
             
.CODE 

INICIO:
    MOV AX, @DATA
    MOV DS,AX
    MOV ES,AX
 
;=============I============= 
    MOV AL,MATRIZ01_C0
    MOV DX,2000H
        OUT DX,AL
    MOV AL,MATRIZ01_C1
    MOV DX,2001H
        OUT DX,AL
    MOV AL,MATRIZ01_C2
    MOV DX,2002H
        OUT DX,AL
    MOV AL,MATRIZ01_C3
    MOV DX,2003H
        OUT DX,AL
    MOV AL,MATRIZ01_C4
    MOV DX,2004H
        OUT DX,AL 
        
;=============N============= 
    MOV AL,MATRIZ02_C0
    MOV DX,2005H
        OUT DX,AL
    MOV AL,MATRIZ02_C1
    MOV DX,2006H
        OUT DX,AL
    MOV AL,MATRIZ02_C2
    MOV DX,2007H
        OUT DX,AL
    MOV AL,MATRIZ02_C3
    MOV DX,2008H
        OUT DX,AL
    MOV AL,MATRIZ02_C4
    MOV DX,2009H
        OUT DX,AL 
 
;=============T============= 
    MOV AL,MATRIZ03_C0
    MOV DX,200AH
        OUT DX,AL
    MOV AL,MATRIZ03_C1
    MOV DX,200BH
        OUT DX,AL
    MOV AL,MATRIZ03_C2
    MOV DX,200CH
        OUT DX,AL
    MOV AL,MATRIZ03_C3
    MOV DX,200DH
        OUT DX,AL
    MOV AL,MATRIZ03_C4
    MOV DX,200EH
        OUT DX,AL
        
;=============E============= 
    MOV AL,MATRIZ04_C0
    MOV DX,200FH
        OUT DX,AL
    MOV AL,MATRIZ04_C1
    MOV DX,2010H
        OUT DX,AL
    MOV AL,MATRIZ04_C2
    MOV DX,2011H
        OUT DX,AL
    MOV AL,MATRIZ04_C3
    MOV DX,2012H
        OUT DX,AL
    MOV AL,MATRIZ04_C4
    MOV DX,2013H
        OUT DX,AL

;=============R============= 
    MOV AL,MATRIZ05_C0
    MOV DX,2014H
        OUT DX,AL
    MOV AL,MATRIZ05_C1
    MOV DX,2015H
        OUT DX,AL
    MOV AL,MATRIZ05_C2
    MOV DX,2016H
        OUT DX,AL
    MOV AL,MATRIZ05_C3
    MOV DX,2017H
        OUT DX,AL
    MOV AL,MATRIZ05_C4
    MOV DX,2018H
        OUT DX,AL           
;=============F============= 
    MOV AL,MATRIZ06_C0
    MOV DX,2019H
        OUT DX,AL
    MOV AL,MATRIZ06_C1
    MOV DX,201AH
        OUT DX,AL
    MOV AL,MATRIZ06_C2
    MOV DX,201BH
        OUT DX,AL
    MOV AL,MATRIZ06_C3
    MOV DX,201CH
        OUT DX,AL
    MOV AL,MATRIZ06_C4
    MOV DX,201DH
        OUT DX,AL    

;=============A============= 
    MOV AL,MATRIZ07_C0
    MOV DX,201EH
        OUT DX,AL
    MOV AL,MATRIZ07_C1
    MOV DX,201FH
        OUT DX,AL
    MOV AL,MATRIZ07_C2
    MOV DX,2020H
        OUT DX,AL
    MOV AL,MATRIZ07_C3
    MOV DX,2021H
        OUT DX,AL
    MOV AL,MATRIZ07_C4
    MOV DX,2022H
        OUT DX,AL
        
;=============Z============= 
    MOV AL,MATRIZ08_C0
    MOV DX,2023H
        OUT DX,AL
    MOV AL,MATRIZ08_C1
    MOV DX,2024H
        OUT DX,AL
    MOV AL,MATRIZ08_C2
    MOV DX,2025H
        OUT DX,AL
    MOV AL,MATRIZ08_C3
    MOV DX,2026H
        OUT DX,AL
    MOV AL,MATRIZ08_C4
    MOV DX,2027H
        OUT DX,AL    
;==========================
    
    MOV AH,2
    MOV DH,12
    MOV DL,30
    MOV BH,0
    INT 10H
        MOV AH,9
        LEA DX,MSJ
        INT 21H 
    

FIN:
    MOV AX,4C00H
    INT 21H
END