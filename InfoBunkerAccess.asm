;*******************************************
; Informacion del proyecto BUNKER ACCESS   *
;*******************************************

.MODEL SMALL
.STACK 100H
.DATA

top1 db '+==============================================================================+'
top1_len EQU $-top1
top2 db '|                         BUNKER ACCESS CONTROL SYSTEM                         |'
top2_len EQU $-top2
top3 db '+==============================================================================+'
top3_len EQU $-top3

panelTop db '        +--------------------------------------------------------------+        '
panelTop_len EQU $-panelTop
panelTitle db '        |                    INFORMACION DEL PROYECTO                 |        '
panelTitle_len EQU $-panelTitle
panelLine db '        +--------------------------------------------------------------+        '
panelLine_len EQU $-panelLine

info1 db '        |  Despues de un cataclismo mundial, los sobrevivientes        |        '
info1_len EQU $-info1
info2 db '        |  viven en un bunker para protegerse del exterior.            |        '
info2_len EQU $-info2
info3 db '        |  El sistema controla salida y reingreso con validaciones.    |        '
info3_len EQU $-info3
info4 db '        |  Registra temperatura, identidad y reportes por area.        |        '
info4_len EQU $-info4
obj1 db '        |  OBJETIVO: prevenir accesos contaminados y proteger vida.    |        '
obj1_len EQU $-obj1

trailer db '        |  TRAILER: github.com/GilmarLuisDev/Delphi                    |        '
trailer_len EQU $-trailer
entrev db '        |  ENTREVISTA: youtu.be/COLOCA_AQUI_ENLACE                     |        '
entrev_len EQU $-entrev

bottom1 db '+==============================================================================+'
bottom1_len EQU $-bottom1
bottom2 db '|                    PRESIONE CUALQUIER TECLA PARA SALIR                        |'
bottom2_len EQU $-bottom2

.CODE
PRINT MACRO fila, columna, color, texto, longitud
    MOV AH,13H
    MOV AL,01H
    MOV BH,00H
    MOV BL,color
    MOV CX,longitud
    MOV DH,fila
    MOV DL,columna
    LEA BP,texto
    INT 10H
ENDM

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    MOV AX,0003H
    INT 10H

    PRINT 0,0,09H,top1,top1_len
    PRINT 1,0,1FH,top2,top2_len
    PRINT 2,0,09H,top3,top3_len
    PRINT 4,0,08H,panelTop,panelTop_len
    PRINT 5,0,0BH,panelTitle,panelTitle_len
    PRINT 6,0,08H,panelLine,panelLine_len
    PRINT 8,0,0FH,info1,info1_len
    PRINT 9,0,0FH,info2,info2_len
    PRINT 10,0,0FH,info3,info3_len
    PRINT 11,0,0FH,info4,info4_len
    PRINT 13,0,0EH,obj1,obj1_len
    PRINT 15,0,0AH,trailer,trailer_len
    PRINT 16,0,0AH,entrev,entrev_len
    PRINT 23,0,09H,bottom1,bottom1_len
    PRINT 24,0,0EH,bottom2,bottom2_len

    MOV AH,00H
    INT 16H
    MOV AX,4C00H
    INT 21H
MAIN ENDP
END MAIN
