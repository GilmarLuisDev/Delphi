;===========================================
; PROGRAMA SALIDA DEL BUNKER
;===========================================

INCLUDE Biblioteca_5D.lib

#start=thermometer.exe#
#start=printer.exe#
#start=stepper_motor.exe#

.MODEL SMALL
.STACK

.DATA

;=====================================
; STEPPER MOTOR
;=====================================

msjSalidaBunkerAbierto DB '   PUERTA DEL BUNKER ABIERTA    '
msjSalidaBunkerCerrado DB '   PUERTA DEL BUNKER CERRADA    '

msjSalidaCerrarBunker  DB '[C] CERRAR PUERTA DEL BUNKER'

;=====================================
; GIRO DERECHA (ABRIR)
;=====================================

datSalidaCW db 00000110b
            db 00000100b
            db 00000011b
            db 00000010b

;=====================================
; GIRO IZQUIERDA (CERRAR)
;=====================================

datSalidaCCW db 00000011b
             db 00000001b
             db 00000110b
             db 00000010b

;=====================================
; ARCHIVO BITACORA
;=====================================

rutaSalidaBitacora DB 'C:\BitacoraSalida.txt',0
idSalidaArchivo    DW 0

msjSalidaErrorArchivo DB 'ERROR AL GUARDAR EN ARCHIVO'

;=====================================
; MENU
;=====================================

msjSalidaTitulo DB '          MENU SALIDA         '

msjSalidaMenu1  DB '[1] CAPTURAR DATOS            '
msjSalidaMenu2  DB '[2] LEER TEMPERATURA EXTERIOR '
msjSalidaMenu3  DB '[3] MOSTRAR SEMAFORO          '
msjSalidaMenu4  DB '[4] ABRIR BUNKER              '
msjSalidaMenu5  DB '[5] GUARDAR EN BITACORA       '
msjSalidaMenu6  DB '[6] IMPRIMIR REPORTE          '
msjSalidaMenu7  DB '[7] ENCENDER TERMOMETRO       '
msjSalidaMenu8  DB '[8] APAGAR TERMOMETRO         '
msjSalidaMenu9  DB '[9] SALIR                     '

msjSalidaSeleccion DB 'SELECCIONAR:                  '

;=====================================
; FORMULARIO
;=====================================

msjSalidaTituloFor    DB '==== FORMULARIO SALIDA ====='
msjSalidaID           DB 'ID:                         '
msjSalidaNombre       DB 'NOMBRE:                     '
msjSalidaMotivo       DB 'MOTIVO:                     '
msjSalidaEstado       DB 'ESTADO:                     '
msjSalidaDivisor      DB '============================'

msjSalidaFormularioOK DB ' FORMULARIO LLENADO CON EXITO '

;=====================================
; MENSAJES
;=====================================

msjSalidaTermometroOff DB '      TERMOMETRO APAGADO      '
msjSalidaTermometroOn  DB '     TERMOMETRO ENCENDIDO     '

msjSalidaTemperatura   DB 'TEMPERATURA EXTERIOR:         '

msjSalidaSemaforoVerde    DB 'SALIDA AUTORIZADA             '
msjSalidaSemaforoAmarillo DB 'SALIDA CON PRECAUCION         '
msjSalidaSemaforoRojo     DB 'SALIDA CANCELADA              '

msjSalidaPuerta DB 'ABRIENDO PUERTA DEL BUNKER... '

msjSalidaBitacoraOK DB 'BITACORA GUARDADA             '

msjSalidaPrintOK DB 'REPORTE IMPRESO               '

;=====================================
; VARIABLES
;=====================================

tempSalida DB 0
txtTempSalida DB 0,0,'$'

;=====================================
; CADENAS
;=====================================

idSalidaRepo      DB 5,0,6 DUP('$')
nombreSalidaRepo  DB 11,0,12 DUP('$')
motivoSalidaRepo  DB 16,0,17 DUP('$')
estadoSalidaRepo  DB 11,0,12 DUP('$')

;=====================================
; LONGITUDES
;=====================================

longSalidaID      DW 0
longSalidaNombre  DW 0
longSalidaMotivo  DW 0
longSalidaEstado  DW 0

;=====================================
; SALTO
;=====================================

saltoSalida DB 13,10

;=====================================
; TEXTOS PRINTER
;=====================================

txtSalidaReporte DB 10,13,'======= SALIDA =======$'
txtSalidaIDP     DB 10,13,'ID: $'
txtSalidaNombreP DB 10,13,'NOMBRE: $'
txtSalidaMotivoP DB 10,13,'MOTIVO: $'
txtSalidaTempP   DB 10,13,'TEMPERATURA: $'
txtSalidaEstadoP DB 10,13,'ESTADO: $'

.CODE

;=====================================
; INICIO
;=====================================

INICIO:

MOV AX,DATA
MOV ES,AX
MOV DS,AX

;=====================================
; MENU
;=====================================

MENU_SALIDA:

LIMPIAR_PANTALLA

IMP_COLOR msjSalidaTitulo,30,0,0,12,18,1EH

IMP_COLOR msjSalidaMenu1,30,0,0,13,18,0EH
IMP_COLOR msjSalidaMenu2,30,0,0,14,18,0EH
IMP_COLOR msjSalidaMenu3,30,0,0,15,18,0EH
IMP_COLOR msjSalidaMenu4,30,0,0,16,18,0EH
IMP_COLOR msjSalidaMenu5,30,0,0,17,18,0EH
IMP_COLOR msjSalidaMenu6,30,0,0,18,18,0EH
IMP_COLOR msjSalidaMenu7,30,0,0,19,18,0EH
IMP_COLOR msjSalidaMenu8,30,0,0,20,18,0EH
IMP_COLOR msjSalidaMenu9,30,0,0,21,18,0EH

IMP_COLOR msjSalidaSeleccion,30,0,0,22,18,0FH

;=====================================
; TECLA MENU
;=====================================

TECLA_MENU_SALIDA:

CURSOR 22,44,0
RASTREO

CMP AL,'1'
JE CAPTURAR_DATOS_SALIDA

CMP AL,'2'
JE LEER_TEMPERATURA_SALIDA

CMP AL,'3'
JE MOSTRAR_SEMAFORO_SALIDA

CMP AL,'4'
JE ABRIR_BUNKER_SALIDA

CMP AL,'5'
JE GUARDAR_BITACORA_SALIDA

CMP AL,'6'
JE IMPRIMIR_REPORTE_SALIDA

CMP AL,'7'
JE ENCENDER_TERMOMETRO_SALIDA

CMP AL,'8'
JE APAGAR_TERMOMETRO_SALIDA

CMP AL,'9'
JE FIN

JMP TECLA_MENU_SALIDA

;=====================================
; CAPTURAR DATOS
;=====================================

CAPTURAR_DATOS_SALIDA:

LIMPIAR_PANTALLA

IMP_COLOR msjSalidaTituloFor,28,0,0,14,18,0EH
IMP_COLOR msjSalidaID,28,0,0,15,18,0EH
IMP_COLOR msjSalidaNombre,28,0,0,16,18,0EH
IMP_COLOR msjSalidaMotivo,28,0,0,17,18,0EH
IMP_COLOR msjSalidaEstado,28,0,0,18,18,0EH
IMP_COLOR msjSalidaDivisor,28,0,0,19,18,0EH

CURSOR 15,33,0
LECTURA_CADENA idSalidaRepo

CURSOR 16,33,0
LECTURA_CADENA nombreSalidaRepo

CURSOR 17,33,0
LECTURA_CADENA motivoSalidaRepo

CURSOR 18,33,0
LECTURA_CADENA estadoSalidaRepo

IMP_COLOR msjSalidaFormularioOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; LEER TEMPERATURA
;=====================================

LEER_TEMPERATURA_SALIDA:

MOV DX,125
XOR AX,AX

IN AL,DX

MOV tempSalida,AL

MOV AH,0
MOV AL,tempSalida

MOV BL,10
DIV BL

ADD AL,30H
MOV txtTempSalida,AL

ADD AH,30H
MOV txtTempSalida+1,AH

IMP_COLOR msjSalidaTemperatura,30,0,0,23,18,0EH
IMP_COLOR txtTempSalida,2,0,0,23,54,0FH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; MOSTRAR SEMAFORO
;=====================================

MOSTRAR_SEMAFORO_SALIDA:

MOV AL,tempSalida

CMP AL,35
JBE SEMAFORO_VERDE_SALIDA

CMP AL,50
JBE SEMAFORO_AMARILLO_SALIDA

JMP SEMAFORO_ROJO_SALIDA

SEMAFORO_VERDE_SALIDA:

IMP_COLOR msjSalidaSemaforoVerde,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

SEMAFORO_AMARILLO_SALIDA:

IMP_COLOR msjSalidaSemaforoAmarillo,30,0,0,23,18,6EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

SEMAFORO_ROJO_SALIDA:

IMP_COLOR msjSalidaSemaforoRojo,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; ABRIR BUNKER
;=====================================

ABRIR_BUNKER_SALIDA:

LIMPIAR_PANTALLA

IMP_COLOR msjSalidaBunkerAbierto,35,0,0,5,20,2EH

MOV BX,OFFSET datSalidaCW
CALL MOVER_MOTOR_SALIDA

IMP_COLOR msjSalidaCerrarBunker,30,0,0,10,20,4EH

ESPERAR_CERRAR_SALIDA:

CURSOR 12,20,0
RASTREO

CMP AL,'C'
JE CERRAR_BUNKER_SALIDA

CMP AL,'c'
JE CERRAR_BUNKER_SALIDA

JMP ESPERAR_CERRAR_SALIDA

;=====================================
; CERRAR BUNKER
;=====================================

CERRAR_BUNKER_SALIDA:

IMP_COLOR msjSalidaBunkerCerrado,35,0,0,15,20,4EH

MOV BX,OFFSET datSalidaCCW
CALL MOVER_MOTOR_SALIDA

CURSOR 17,20,0
RASTREO

JMP MENU_SALIDA

;=====================================
; MOTOR
;=====================================

MOVER_MOTOR_SALIDA PROC

MOV SI,0
MOV CX,35

SIGUIENTE_PASO_SALIDA:

ESPERA_MOTOR_SALIDA:

IN AL,7
TEST AL,10000000b
JZ ESPERA_MOTOR_SALIDA

MOV AL,[BX][SI]
OUT 7,AL

INC SI

CMP SI,4
JB CONTINUAR_MOTOR_SALIDA

MOV SI,0

CONTINUAR_MOTOR_SALIDA:

LOOP SIGUIENTE_PASO_SALIDA

RET

MOVER_MOTOR_SALIDA ENDP

;=====================================
; GUARDAR BITACORA
;=====================================

GUARDAR_BITACORA_SALIDA:

ABRIR_ARCHIVO rutaSalidaBitacora,2

MOV idSalidaArchivo,AX

JC ERROR_SALIDA

MOV AL,idSalidaRepo+1
XOR AH,AH
MOV longSalidaID,AX

MOV AL,nombreSalidaRepo+1
XOR AH,AH
MOV longSalidaNombre,AX

MOV AL,motivoSalidaRepo+1
XOR AH,AH
MOV longSalidaMotivo,AX

MOV AL,estadoSalidaRepo+1
XOR AH,AH
MOV longSalidaEstado,AX

ESCRIBIR_ARCHIVO idSalidaArchivo,longSalidaID,idSalidaRepo+2
ESCRIBIR_ARCHIVO idSalidaArchivo,2,saltoSalida

ESCRIBIR_ARCHIVO idSalidaArchivo,longSalidaNombre,nombreSalidaRepo+2
ESCRIBIR_ARCHIVO idSalidaArchivo,2,saltoSalida

ESCRIBIR_ARCHIVO idSalidaArchivo,longSalidaMotivo,motivoSalidaRepo+2
ESCRIBIR_ARCHIVO idSalidaArchivo,2,saltoSalida

ESCRIBIR_ARCHIVO idSalidaArchivo,2,txtTempSalida
ESCRIBIR_ARCHIVO idSalidaArchivo,2,saltoSalida

ESCRIBIR_ARCHIVO idSalidaArchivo,longSalidaEstado,estadoSalidaRepo+2
ESCRIBIR_ARCHIVO idSalidaArchivo,2,saltoSalida

CERRAR_ARCHIVO idSalidaArchivo

IMP_COLOR msjSalidaBitacoraOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; IMPRIMIR REPORTE
;=====================================

IMPRIMIR_REPORTE_SALIDA:

MOV AH,5
MOV DL,12
INT 21H

LEA SI,txtSalidaReporte
CALL IMPRIMIR_CADENA_SALIDA

LEA SI,txtSalidaIDP
CALL IMPRIMIR_CADENA_SALIDA

LEA SI,idSalidaRepo+2
MOV CL,idSalidaRepo+1
CALL IMPRIMIR_BUFFER_SALIDA

LEA SI,txtSalidaNombreP
CALL IMPRIMIR_CADENA_SALIDA

LEA SI,nombreSalidaRepo+2
MOV CL,nombreSalidaRepo+1
CALL IMPRIMIR_BUFFER_SALIDA

LEA SI,txtSalidaMotivoP
CALL IMPRIMIR_CADENA_SALIDA

LEA SI,motivoSalidaRepo+2
MOV CL,motivoSalidaRepo+1
CALL IMPRIMIR_BUFFER_SALIDA

LEA SI,txtSalidaTempP
CALL IMPRIMIR_CADENA_SALIDA

MOV AH,5
MOV DL,txtTempSalida
INT 21H

MOV AH,5
MOV DL,txtTempSalida+1
INT 21H

LEA SI,txtSalidaEstadoP
CALL IMPRIMIR_CADENA_SALIDA

LEA SI,estadoSalidaRepo+2
MOV CL,estadoSalidaRepo+1
CALL IMPRIMIR_BUFFER_SALIDA

IMP_COLOR msjSalidaPrintOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; IMPRIMIR CADENA
;=====================================

IMPRIMIR_CADENA_SALIDA PROC

MOV AH,5

OTRA_CADENA_SALIDA:

MOV DL,[SI]

CMP DL,'$'
JE FIN_CADENA_SALIDA

INT 21H

INC SI
JMP OTRA_CADENA_SALIDA

FIN_CADENA_SALIDA:

RET

IMPRIMIR_CADENA_SALIDA ENDP

;=====================================
; IMPRIMIR BUFFER
;=====================================

IMPRIMIR_BUFFER_SALIDA PROC

MOV AH,5

OTRO_BUFFER_SALIDA:

MOV DL,[SI]
INT 21H

INC SI

LOOP OTRO_BUFFER_SALIDA

RET

IMPRIMIR_BUFFER_SALIDA ENDP

;=====================================
; ENCENDER TERMOMETRO
;=====================================

ENCENDER_TERMOMETRO_SALIDA:

ENCENDERTERMOMETRO

IMP_COLOR msjSalidaTermometroOn,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; APAGAR TERMOMETRO
;=====================================

APAGAR_TERMOMETRO_SALIDA:

APAGARTERMOMETRO

IMP_COLOR msjSalidaTermometroOff,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; ERROR
;=====================================

ERROR_SALIDA:

IMP_COLOR msjSalidaErrorArchivo,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_SALIDA

;=====================================
; FIN
;=====================================

FIN:

MOV AX,4C00H
INT 21H

END