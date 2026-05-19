;************************************
;Natividad Aguilera Andrick Joksan
;Guardar como: SevenSegmentDisplay01.asm
;**************Seven Segment Display **********************
;PUERTO:
;INICIO:
    ;2040H
;FIN 
;=======================INSTRUCCIONES==================
;Este componente maneja 8 bits que pueden estar encendidos o apagados dependiendo del dato que se quiera formar.
;NOTA: El bit a siempre esta en 0
;La secuencia de bits es la siguiente: 
;a f g b c d e h
;Ejemplo 1 formar el numero 0
                ;a f g b c d e h
;encendidos     ;0 0 1 1 1 1 1 1b
;Ejemplo 2       a f g b c d e h
;formar el 9     0 1 1 0 1 1 1 1b
;encendidos    
.MODEL SMALL
.STACK                 
.DATA   
              ;a f g b c d e h
    NUMERO2 DB 01011011B ;NUMERO 2  
    NUMERO1 DB 00000110B ;NUMERO 1
    NUMERO4 DB 01100110B ;NUMERO 4  
    NUMERO0 DB 00111111B ;NUMERO 0
    NUMERO7 DB 00000111B ;NUMERO 7   
    NUMERO3 DB 01001111B ;NUMERO 3  
    NUMERO6 DB 01111101B ;NUMERO 6 
    
                        ;afgbcdeh
    PARENTESISABIERTO DB 00111001B
    LETRAA            DB 01110111B
    LETRAE            DB 01111001B
    LETRAS            DB 01101101B
    PARENTESISCERRADO DB 00001111B
    
    ;ACCESS
    
    MSJ DB "se ha enviado al Seven Segment Display$"
   
             
.CODE 
INICIO:
    MOV AX, @DATA
    MOV DS,AX
    MOV ES,AX 
    
;===============INICIALIZACION======= 

    MOV AH,2
    MOV DH,20
    MOV DL,25
    MOV BH,0
    INT 10H
        MOV AH,9
        LEA DX,MSJ
        INT 21H
    
;==========    
    MOV DX, 2030H ;PUERTO INICIAL
    MOV AL, PARENTESISABIERTO
        OUT DX,AL  
        
    MOV DX, 2031H ;PUERTO INICIAL
    MOV AL, LETRAA
        OUT DX,AL  
    
    MOV DX, 2032H ;PUERTO INICIAL
    MOV AL, PARENTESISABIERTO
        OUT DX,AL  
        
    MOV DX, 2033H ;PUERTO INICIAL
    MOV AL, PARENTESISABIERTO
        OUT DX,AL
        
    MOV DX, 2034H ;PUERTO INICIAL
    MOV AL, LETRAE
        OUT DX,AL  
        
    MOV DX, 2035H ;PUERTO INICIAL
    MOV AL, LETRAS
        OUT DX,AL 
    
    MOV DX, 2036H ;PUERTO INICIAL
    MOV AL, LETRAS
        OUT DX,AL  
        
    MOV DX, 2037H ;PUERTO INICIAL
    MOV AL, PARENTESISCERRADO
        OUT DX,AL
FIN:
    MOV AX,4C00H
    INT 21H
END