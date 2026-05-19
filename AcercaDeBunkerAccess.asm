;*******************************************
;Natividad Aguilera Andrick Joksan         *
;Gilmar Steven Gallaga Montero             *
;Galindo Lopez Santa Lucia                 *
;*******************************************

.MODEL SMALL
.STACK 100H

.DATA

top1 db '+==============================================================================+'
top1_len EQU $-top1
top2 db '|                              ACERCA DE BUNKER                               |'
top2_len EQU $-top2
top3 db '+==============================================================================+'
top3_len EQU $-top3

panelTop db '        +--------------------------------------------------------------+        '
panelTop_len EQU $-panelTop
panelLine db '        +--------------------------------------------------------------+        '
panelLine_len EQU $-panelLine
panelTitle db '        |            INFORMACION DEL EQUIPO Y CONTACTO                |        '
panelTitle_len EQU $-panelTitle

contact1 db '        |  PAGINA WEB : www.BUNKER.com                                |        '
contact1_len EQU $-contact1
contact2 db '        |  CORREO     : BunkerAccess@gmail.com                        |        '
contact2_len EQU $-contact2
contact3 db '        |  TELEFONO   : 33-4410-5427                                  |        '
contact3_len EQU $-contact3

inst1 db '        |  INST. GILMAR: gistgallagamo@ittepic.edu.mx                 |        '
inst1_len EQU $-inst1
inst2 db '        |  INST. ANDRICK: andrick.natividad@ittepic.edu.mx            |        '
inst2_len EQU $-inst2
inst3 db '        |  INST. LUCIA: santa.galindo@ittepic.edu.mx                  |        '
inst3_len EQU $-inst3

devTitle db '        |                    DESARROLLADORES                          |        '
devTitle_len EQU $-devTitle
dev1 db '        |  01. Natividad Aguilera Andrick Joksan                      |        '
dev1_len EQU $-dev1
dev2 db '        |  02. Gilmar Steven Gallaga Montero                          |        '
dev2_len EQU $-dev2
dev3 db '        |  03. Galindo Lopez Santa Lucia                              |        '
dev3_len EQU $-dev3

trailer db '        |  TRAILER: github.com/GilmarLuisDev/Delphi                  |        '
trailer_len EQU $-trailer
entrev db '        |  ENTREVISTA: youtu.be/COLOCA_AQUI_ENLACE                   |        '
entrev_len EQU $-entrev

bottom1 db '+==============================================================================+'
bottom1_len EQU $-bottom1
bottom2 db '|                    PRESIONE CUALQUIER TECLA PARA CONTINUAR                   |'
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
    PRINT 8,0,0FH,contact1,contact1_len
    PRINT 9,0,0FH,contact2,contact2_len
    PRINT 10,0,0FH,contact3,contact3_len
    PRINT 11,0,08H,panelLine,panelLine_len

    PRINT 13,0,0BH,devTitle,devTitle_len
    PRINT 14,0,07H,dev1,dev1_len
    PRINT 15,0,07H,dev2,dev2_len
    PRINT 16,0,07H,dev3,dev3_len

    PRINT 18,0,0AH,inst1,inst1_len
    PRINT 19,0,0AH,inst2,inst2_len
    PRINT 20,0,0AH,inst3,inst3_len

    PRINT 21,0,0EH,trailer,trailer_len
    PRINT 22,0,0EH,entrev,entrev_len
    PRINT 23,0,09H,bottom1,bottom1_len
    PRINT 24,0,0EH,bottom2,bottom2_len

    MOV AH,00H
    INT 16H

    MOV AX,4C00H
    INT 21H
MAIN ENDP
END MAIN
