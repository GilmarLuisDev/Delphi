;===========================================
; PROGRAMA EXPLORACION EXTERIOR
;===========================================

INCLUDE Biblioteca_5D.lib

#start=thermometer.exe#
#start=printer.exe#
#start=Traffic_Lights.exe#
#start=robot.exe#

.MODEL SMALL
.STACK

.DATA

;=====================================
; ROBOT
;=====================================

ROBOT_PORT EQU 9

;=====================================
; SEMAFORO
;=====================================

verdeExterior     EQU 00000100b
amarilloExterior  EQU 00000110b
rojoExterior      EQU 00000001b

;=====================================
; ARCHIVO
;=====================================

rutaExteriorReporte DB 'C:\BUNKER ACCESS\GILMAR GALLAGA\ReporteExterior.txt',0
idExteriorArchivo DW 0

;=====================================
; MENSAJES
;=====================================

msjExteriorTitulo DB '       MENU EXPLORACION       '

msjExteriorMenu1 DB '[1] EXPLORAR EXTERIOR         '
msjExteriorMenu2 DB '[2] TOMAR TEMPERATURA         '
msjExteriorMenu3 DB '[3] ANALIZAR EXTERIOR         '
msjExteriorMenu4 DB '[4] ENCENDER TERMOMETRO       '
msjExteriorMenu5 DB '[5] APAGAR TERMOMETRO         '
msjExteriorMenu6 DB '[6] GENERAR REPORTE           '
msjExteriorMenu7 DB '[7] IMPRIMIR REPORTE          '
msjExteriorMenu8 DB '[8] SALIR                     '

msjExteriorSeleccion DB 'SELECCIONAR:                  '

msjExteriorExplorando DB ' ROBOT EXPLORANDO EXTERIOR... '

msjExteriorTemp DB 'TEMPERATURA EXTERIOR:         '

msjExteriorRadiacion DB 'RADIACION DETECTADA:          '

msjExteriorVerde DB ' EXTERIOR SEGURO '
msjExteriorAmarillo DB ' PRECAUCION EN EXTERIOR '
msjExteriorRojo DB ' ZOMBIES DETECTADOS '

msjExteriorReporteOK DB 'REPORTE GENERADO              '
msjExteriorPrintOK DB 'REPORTE IMPRESO               '

msjExteriorTermometroON DB 'TERMOMETRO ENCENDIDO'
msjExteriorTermometroOFF DB 'TERMOMETRO APAGADO'

msjExteriorError DB 'ERROR ARCHIVO'

;=====================================
; VARIABLES
;=====================================

tempExterior DB 0
txtTempExterior DB 0,0

radiacionExterior DB 0
txtRadiacionExterior DB 0,0

estadoExterior DB 'SEGURO'
estadoPrecaucionExterior DB 'PRECAUCION'
estadoZombieExterior DB 'PELIGROSO'

tipoRutaExterior DB 0

banderaTempExterior DB 0

saltoExterior DB 13,10

;=====================================
; TEXTOS PRINT
;=====================================

txtExteriorTitulo DB 10,13,'==== EXPLORACION ====$'
txtExteriorTempP DB 'TEMPERATURA: $'
txtExteriorRadP DB 'RADIACION: $'
txtExteriorEstadoP DB 'ESTADO: $'

.CODE

;=====================================
; INICIO
;=====================================

INICIO:

MOV AX,DATA
MOV DS,AX
MOV ES,AX

;=====================================
; MENU
;=====================================

MENU_EXTERIOR:

LIMPIAR_PANTALLA

IMP_COLOR msjExteriorTitulo,30,0,0,10,18,1EH

IMP_COLOR msjExteriorMenu1,30,0,0,12,18,0EH
IMP_COLOR msjExteriorMenu2,30,0,0,13,18,0EH
IMP_COLOR msjExteriorMenu3,30,0,0,14,18,0EH
IMP_COLOR msjExteriorMenu4,30,0,0,15,18,0EH
IMP_COLOR msjExteriorMenu5,30,0,0,16,18,0EH
IMP_COLOR msjExteriorMenu6,30,0,0,17,18,0EH
IMP_COLOR msjExteriorMenu7,30,0,0,18,18,0EH
IMP_COLOR msjExteriorMenu8,30,0,0,19,18,0EH

IMP_COLOR msjExteriorSeleccion,30,0,0,21,18,0FH

;=====================================
; TECLAS
;=====================================

TECLA_EXTERIOR:

CURSOR 21,44,0
RASTREO

CMP AL,'1'
JE EXPLORAR_EXTERIOR

CMP AL,'2'
JE TOMAR_TEMP_EXTERIOR

CMP AL,'3'
JE ANALIZAR_EXTERIOR

CMP AL,'4'
JE ENCENDER_TERMOMETRO_EXTERIOR

CMP AL,'5'
JE APAGAR_TERMOMETRO_EXTERIOR

CMP AL,'6'
JE GENERAR_REPORTE_EXTERIOR

CMP AL,'7'
JE IMPRIMIR_REPORTE_EXTERIOR

CMP AL,'8'
JE FIN

JMP TECLA_EXTERIOR

;=====================================
; EXPLORAR
;=====================================

EXPLORAR_EXTERIOR:

LIMPIAR_PANTALLA

IMP_COLOR msjExteriorExplorando,35,0,0,5,18,2EH

MOV AH,00
INT 1AH

MOV AL,DL
AND AL,01H

MOV tipoRutaExterior,AL

CMP AL,0
JE RUTA_SEGURA

JMP RUTA_ZOMBIES

;=====================================
; RUTA SEGURA
;=====================================

RUTA_SEGURA:

MOV CX,5

RUTA_SEGURA_LOOP:

CALL ADELANTE_ROBOT

LOOP RUTA_SEGURA_LOOP

CURSOR 23,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; RUTA ZOMBIES
;=====================================

RUTA_ZOMBIES:

CALL DERECHA_ROBOT

MOV CX,5
ZOMBIE_1:
CALL ADELANTE_ROBOT
LOOP ZOMBIE_1

CALL IZQUIERDA_ROBOT

MOV CX,3
ZOMBIE_2:
CALL ADELANTE_ROBOT
LOOP ZOMBIE_2

CALL IZQUIERDA_ROBOT

CALL DERECHA_ROBOT

MOV CX,3
ZOMBIE_3:
CALL ADELANTE_ROBOT
LOOP ZOMBIE_3

CALL IZQUIERDA_ROBOT

CALL ADELANTE_ROBOT

CALL DERECHA_ROBOT

CALL ADELANTE_ROBOT

CALL IZQUIERDA_ROBOT

MOV CX,2
ZOMBIE_4:
CALL ADELANTE_ROBOT
LOOP ZOMBIE_4

CURSOR 23,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; TEMPERATURA
;=====================================

TOMAR_TEMP_EXTERIOR:

MOV DX,125
XOR AX,AX

IN AL,DX

MOV tempExterior,AL

MOV AH,0
MOV AL,tempExterior

MOV BL,10
DIV BL

ADD AL,30H
MOV txtTempExterior,AL

ADD AH,30H
MOV txtTempExterior+1,AH

MOV banderaTempExterior,1

IMP_COLOR msjExteriorTemp,30,0,0,23,18,0EH
IMP_COLOR txtTempExterior,2,0,0,23,50,0FH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; ANALIZAR
;=====================================

ANALIZAR_EXTERIOR:

MOV AH,00
INT 1AH

MOV AL,DL
AND AL,63

MOV radiacionExterior,AL

MOV AH,0
MOV AL,radiacionExterior

MOV BL,10
DIV BL

ADD AL,30H
MOV txtRadiacionExterior,AL

ADD AH,30H
MOV txtRadiacionExterior+1,AH

IMP_COLOR msjExteriorRadiacion,30,0,0,22,18,0EH
IMP_COLOR txtRadiacionExterior,2,0,0,22,50,0FH

CMP tipoRutaExterior,1
JE PELIGRO_EXTERIOR

MOV AL,tempExterior
CMP AL,40
JA PRECAUCION_EXTERIOR

MOV AL,radiacionExterior
CMP AL,40
JA PRECAUCION_EXTERIOR

JMP SEGURO_EXTERIOR

;=====================================
; VERDE
;=====================================

SEGURO_EXTERIOR:

MOV AX,verdeExterior
OUT 4,AX

IMP_COLOR msjExteriorVerde,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; AMARILLO
;=====================================

PRECAUCION_EXTERIOR:

MOV AX,amarilloExterior
OUT 4,AX

IMP_COLOR msjExteriorAmarillo,35,0,0,23,18,6EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; ROJO
;=====================================

PELIGRO_EXTERIOR:

MOV AX,rojoExterior
OUT 4,AX

IMP_COLOR msjExteriorRojo,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; GENERAR REPORTE TXT
;=====================================

GENERAR_REPORTE_EXTERIOR:

ABRIR_ARCHIVO rutaExteriorReporte,2

MOV idExteriorArchivo,AX

JC ERROR_EXTERIOR

ESCRIBIR_ARCHIVO idExteriorArchivo,13,txtExteriorTempP
ESCRIBIR_ARCHIVO idExteriorArchivo,2,txtTempExterior
ESCRIBIR_ARCHIVO idExteriorArchivo,2,saltoExterior

ESCRIBIR_ARCHIVO idExteriorArchivo,11,txtExteriorRadP
ESCRIBIR_ARCHIVO idExteriorArchivo,2,txtRadiacionExterior
ESCRIBIR_ARCHIVO idExteriorArchivo,2,saltoExterior

ESCRIBIR_ARCHIVO idExteriorArchivo,8,txtExteriorEstadoP

CMP tipoRutaExterior,1
JE SAVE_ROJO

MOV AL,tempExterior
CMP AL,40
JA SAVE_AMARILLO

MOV AL,radiacionExterior
CMP AL,40
JA SAVE_AMARILLO

ESCRIBIR_ARCHIVO idExteriorArchivo,6,estadoExterior
JMP FIN_SAVE

SAVE_AMARILLO:

ESCRIBIR_ARCHIVO idExteriorArchivo,10,estadoPrecaucionExterior
JMP FIN_SAVE

SAVE_ROJO:

ESCRIBIR_ARCHIVO idExteriorArchivo,10,estadoZombieExterior

FIN_SAVE:

ESCRIBIR_ARCHIVO idExteriorArchivo,2,saltoExterior

CERRAR_ARCHIVO idExteriorArchivo

IMP_COLOR msjExteriorReporteOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; IMPRIMIR REPORTE
;=====================================

IMPRIMIR_REPORTE_EXTERIOR:

; LIMPIAR IMPRESORA
MOV AH,5
MOV DL,12
INT 21H

;=====================================
; TITULO
;=====================================

LEA SI,txtExteriorTitulo
CALL IMPRIMIR_CADENA_EXTERIOR

; ENTER
CALL SALTO_LINEA_PRINT

;=====================================
; TEMPERATURA
;=====================================

LEA SI,txtExteriorTempP
CALL IMPRIMIR_CADENA_EXTERIOR

MOV AH,5
MOV DL,txtTempExterior
INT 21H

MOV AH,5
MOV DL,txtTempExterior+1
INT 21H

CALL SALTO_LINEA_PRINT

;=====================================
; RADIACION
;=====================================

LEA SI,txtExteriorRadP
CALL IMPRIMIR_CADENA_EXTERIOR

MOV AH,5
MOV DL,txtRadiacionExterior
INT 21H

MOV AH,5
MOV DL,txtRadiacionExterior+1
INT 21H

CALL SALTO_LINEA_PRINT

;=====================================
; ESTADO
;=====================================

LEA SI,txtExteriorEstadoP
CALL IMPRIMIR_CADENA_EXTERIOR

CMP tipoRutaExterior,1
JE PRINT_ROJO

MOV AL,tempExterior
CMP AL,40
JA PRINT_AMARILLO

MOV AL,radiacionExterior
CMP AL,40
JA PRINT_AMARILLO

LEA SI,estadoExterior
CALL IMPRIMIR_CADENA_EXTERIOR
JMP FIN_PRINT

PRINT_AMARILLO:

LEA SI,estadoPrecaucionExterior
CALL IMPRIMIR_CADENA_EXTERIOR
JMP FIN_PRINT

PRINT_ROJO:

LEA SI,estadoZombieExterior
CALL IMPRIMIR_CADENA_EXTERIOR

FIN_PRINT:

CALL SALTO_LINEA_PRINT

IMP_COLOR msjExteriorPrintOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; SALTO DE LINEA
;=====================================

SALTO_LINEA_PRINT PROC

MOV AH,5
MOV DL,13
INT 21H

MOV AH,5
MOV DL,10
INT 21H

RET

SALTO_LINEA_PRINT ENDP

;=====================================
; IMPRIMIR CADENA
;=====================================

IMPRIMIR_CADENA_EXTERIOR PROC

MOV AH,5

OTRA_CADENA_EXTERIOR:

MOV DL,[SI]

CMP DL,'$'
JE FIN_CADENA_EXTERIOR

INT 21H

INC SI
JMP OTRA_CADENA_EXTERIOR

FIN_CADENA_EXTERIOR:

RET

IMPRIMIR_CADENA_EXTERIOR ENDP

;=====================================
; ROBOT
;=====================================

WAIT_ROBOT PROC

BUSY_ROBOT:

IN AL,ROBOT_PORT+2
TEST AL,00000010b
JNZ BUSY_ROBOT

RET

WAIT_ROBOT ENDP

;=====================================

ADELANTE_ROBOT PROC

CALL WAIT_ROBOT

MOV AL,1
OUT ROBOT_PORT,AL

CALL WAIT_ROBOT

RET

ADELANTE_ROBOT ENDP

;=====================================

DERECHA_ROBOT PROC

CALL WAIT_ROBOT

MOV AL,3
OUT ROBOT_PORT,AL

CALL WAIT_ROBOT

RET

DERECHA_ROBOT ENDP

;=====================================

IZQUIERDA_ROBOT PROC

CALL WAIT_ROBOT

MOV AL,2
OUT ROBOT_PORT,AL

CALL WAIT_ROBOT

RET

IZQUIERDA_ROBOT ENDP

;=====================================
; TERMOMETRO
;=====================================

ENCENDER_TERMOMETRO_EXTERIOR:

ENCENDERTERMOMETRO

IMP_COLOR msjExteriorTermometroON,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================

APAGAR_TERMOMETRO_EXTERIOR:

APAGARTERMOMETRO

IMP_COLOR msjExteriorTermometroOFF,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; ERROR
;=====================================

ERROR_EXTERIOR:

IMP_COLOR msjExteriorError,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_EXTERIOR

;=====================================
; FIN
;=====================================

FIN:

MOV AX,4C00H
INT 21H

END