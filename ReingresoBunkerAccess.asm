;===========================================
; PROGRAMA REINGRESO DEL BUNKER
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

msjReingresoBunkerAbierto DB '   PUERTA DEL BUNKER ABIERTA    '
msjReingresoBunkerCerrado DB '   PUERTA DEL BUNKER CERRADA    '

msjReingresoCerrarBunker  DB '[C] CERRAR PUERTA DEL BUNKER'

;=====================================
; GIRO DERECHA (ABRIR)
;=====================================

datReingresoCW db 00000110b
               db 00000100b
               db 00000011b
               db 00000010b

;=====================================
; GIRO IZQUIERDA (CERRAR)
;=====================================

datReingresoCCW db 00000011b
                db 00000001b
                db 00000110b
                db 00000010b

;=====================================
; ARCHIVO BITACORA
;=====================================

rutaReingresoBitacora DB 'C:\BitacoraReingreso.txt',0
idReingresoArchivo    DW 0

msjReingresoErrorArchivo DB 'ERROR AL GUARDAR EN ARCHIVO'

;=====================================
; MENU
;=====================================

msjReingresoTitulo DB '         MENU REINGRESO        '

msjReingresoMenu1  DB '[1] CAPTURAR DATOS             '
msjReingresoMenu2  DB '[2] TOMAR TEMPERATURA PERSONA  '
msjReingresoMenu3  DB '[3] ABRIR BUNKER               '
msjReingresoMenu4  DB '[4] GUARDAR EN BITACORA        '
msjReingresoMenu5  DB '[5] IMPRIMIR REPORTE           '
msjReingresoMenu6  DB '[6] ENCENDER TERMOMETRO        '
msjReingresoMenu7  DB '[7] APAGAR TERMOMETRO          '
msjReingresoMenu8  DB '[8] SALIR                      '

msjReingresoSeleccion DB 'SELECCIONAR:                   '

;=====================================
; FORMULARIO
;=====================================

msjReingresoTituloFor DB '=== FORMULARIO REINGRESO ==='
msjReingresoID        DB 'ID:                         '
msjReingresoNombre    DB 'NOMBRE:                     '
msjReingresoMotivo    DB 'MOTIVO:                     '
msjReingresoDivisor   DB '============================'

msjReingresoFormularioOK DB ' FORMULARIO LLENADO CON EXITO '

;=====================================
; MENSAJES
;=====================================

msjReingresoTermometroOff DB '      TERMOMETRO APAGADO      '
msjReingresoTermometroOn  DB '     TERMOMETRO ENCENDIDO     '

msjReingresoTemperatura   DB 'TEMPERATURA PERSONA:          '

msjReingresoTempAlta DB '  TEMPERATURA ALTA - ACCESO DENEGADO  '
msjReingresoTempOK   DB 'TEMPERATURA NORMAL - ACCESO AUTORIZADO'

msjReingresoDebeTomarTemp DB 'PRIMERO DEBE TOMAR TEMPERATURA'

msjReingresoBitacoraOK DB 'BITACORA GUARDADA             '

msjReingresoPrintOK DB 'REPORTE IMPRESO               '

;=====================================
; VARIABLES
;=====================================

tempReingreso DB 0
txtTempReingreso DB 0,0,'$'

banderaTempReingreso DB 0

estadoReingreso DB 'AUTORIZADO$'
estadoDenegadoReingreso DB 'DENEGADO$'

;=====================================
; CADENAS
;=====================================

idReingresoRepo      DB 5,0,6 DUP('$')
nombreReingresoRepo  DB 11,0,12 DUP('$')
motivoReingresoRepo  DB 16,0,17 DUP('$')

;=====================================
; LONGITUDES
;=====================================

longReingresoID      DW 0
longReingresoNombre  DW 0
longReingresoMotivo  DW 0

;=====================================
; SALTO
;=====================================

saltoReingreso DB 13,10

;=====================================
; TEXTOS PRINTER
;=====================================

txtReingresoReporte DB 10,13,'====== REINGRESO ======$'
txtReingresoIDP     DB 10,13,'ID: $'
txtReingresoNombreP DB 10,13,'NOMBRE: $'
txtReingresoMotivoP DB 10,13,'MOTIVO: $'
txtReingresoTempP   DB 10,13,'TEMPERATURA: $'
txtReingresoEstadoP DB 10,13,'ESTADO: $'

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

MENU_REINGRESO:

LIMPIAR_PANTALLA

IMP_COLOR msjReingresoTitulo,30,0,0,12,18,1EH

IMP_COLOR msjReingresoMenu1,30,0,0,13,18,0EH
IMP_COLOR msjReingresoMenu2,30,0,0,14,18,0EH
IMP_COLOR msjReingresoMenu3,30,0,0,15,18,0EH
IMP_COLOR msjReingresoMenu4,30,0,0,16,18,0EH
IMP_COLOR msjReingresoMenu5,30,0,0,17,18,0EH
IMP_COLOR msjReingresoMenu6,30,0,0,18,18,0EH
IMP_COLOR msjReingresoMenu7,30,0,0,19,18,0EH
IMP_COLOR msjReingresoMenu8,30,0,0,20,18,0EH

IMP_COLOR msjReingresoSeleccion,30,0,0,22,18,0FH

;=====================================
; TECLA MENU
;=====================================

TECLA_MENU_REINGRESO:

CURSOR 22,45,0
RASTREO

CMP AL,'1'
JE CAPTURAR_DATOS_REINGRESO

CMP AL,'2'
JE LEER_TEMPERATURA_REINGRESO

CMP AL,'3'
JE ABRIR_BUNKER_REINGRESO

CMP AL,'4'
JE GUARDAR_BITACORA_REINGRESO

CMP AL,'5'
JE IMPRIMIR_REPORTE_REINGRESO

CMP AL,'6'
JE ENCENDER_TERMOMETRO_REINGRESO

CMP AL,'7'
JE APAGAR_TERMOMETRO_REINGRESO

CMP AL,'8'
JE FIN

JMP TECLA_MENU_REINGRESO

;=====================================
; CAPTURAR DATOS
;=====================================

CAPTURAR_DATOS_REINGRESO:

LIMPIAR_PANTALLA

IMP_COLOR msjReingresoTituloFor,28,0,0,14,18,0EH
IMP_COLOR msjReingresoID,28,0,0,15,18,0EH
IMP_COLOR msjReingresoNombre,28,0,0,16,18,0EH
IMP_COLOR msjReingresoMotivo,28,0,0,17,18,0EH
IMP_COLOR msjReingresoDivisor,28,0,0,18,18,0EH

CURSOR 15,33,0
LECTURA_CADENA idReingresoRepo

CURSOR 16,33,0
LECTURA_CADENA nombreReingresoRepo

CURSOR 17,33,0
LECTURA_CADENA motivoReingresoRepo

IMP_COLOR msjReingresoFormularioOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; LEER TEMPERATURA
;=====================================

LEER_TEMPERATURA_REINGRESO:

MOV DX,125
XOR AX,AX

IN AL,DX

MOV tempReingreso,AL

MOV AH,0
MOV AL,tempReingreso

MOV BL,10
DIV BL

ADD AL,30H
MOV txtTempReingreso,AL

ADD AH,30H
MOV txtTempReingreso+1,AH

MOV banderaTempReingreso,1

IMP_COLOR msjReingresoTemperatura,30,0,0,23,18,0EH
IMP_COLOR txtTempReingreso,2,0,0,23,54,0FH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; ABRIR BUNKER
;=====================================

ABRIR_BUNKER_REINGRESO:

CMP banderaTempReingreso,1
JNE NO_TEMP_REINGRESO

MOV AL,tempReingreso

CMP AL,38
JA ACCESO_DENEGADO_REINGRESO

JMP ACCESO_AUTORIZADO_REINGRESO

;=====================================
; NO TEMPERATURA
;=====================================

NO_TEMP_REINGRESO:

IMP_COLOR msjReingresoDebeTomarTemp,40,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; ACCESO AUTORIZADO
;=====================================

ACCESO_AUTORIZADO_REINGRESO:

LIMPIAR_PANTALLA

IMP_COLOR msjReingresoTempOK,40,0,0,3,18,2EH

IMP_COLOR msjReingresoBunkerAbierto,35,0,0,5,20,2EH

MOV BX,OFFSET datReingresoCW
CALL MOVER_MOTOR_REINGRESO

IMP_COLOR msjReingresoCerrarBunker,30,0,0,10,20,4EH

ESPERAR_CERRAR_REINGRESO:

CURSOR 12,20,0
RASTREO

CMP AL,'C'
JE CERRAR_BUNKER_REINGRESO

CMP AL,'c'
JE CERRAR_BUNKER_REINGRESO

JMP ESPERAR_CERRAR_REINGRESO

;=====================================
; ACCESO DENEGADO
;=====================================

ACCESO_DENEGADO_REINGRESO:

IMP_COLOR msjReingresoTempAlta,38,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; CERRAR BUNKER
;=====================================

CERRAR_BUNKER_REINGRESO:

IMP_COLOR msjReingresoBunkerCerrado,35,0,0,15,20,4EH

MOV BX,OFFSET datReingresoCCW
CALL MOVER_MOTOR_REINGRESO

CURSOR 17,20,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; MOTOR
;=====================================

MOVER_MOTOR_REINGRESO PROC

MOV SI,0
MOV CX,35

SIGUIENTE_PASO_REINGRESO:

ESPERA_MOTOR_REINGRESO:

IN AL,7
TEST AL,10000000b
JZ ESPERA_MOTOR_REINGRESO

MOV AL,[BX][SI]
OUT 7,AL

INC SI

CMP SI,4
JB CONTINUAR_MOTOR_REINGRESO

MOV SI,0

CONTINUAR_MOTOR_REINGRESO:

LOOP SIGUIENTE_PASO_REINGRESO

RET

MOVER_MOTOR_REINGRESO ENDP

;=====================================
; GUARDAR BITACORA
;=====================================

GUARDAR_BITACORA_REINGRESO:

ABRIR_ARCHIVO rutaReingresoBitacora,2

MOV idReingresoArchivo,AX

JC ERROR_REINGRESO

MOV AL,idReingresoRepo+1
XOR AH,AH
MOV longReingresoID,AX

MOV AL,nombreReingresoRepo+1
XOR AH,AH
MOV longReingresoNombre,AX

MOV AL,motivoReingresoRepo+1
XOR AH,AH
MOV longReingresoMotivo,AX

ESCRIBIR_ARCHIVO idReingresoArchivo,longReingresoID,idReingresoRepo+2
ESCRIBIR_ARCHIVO idReingresoArchivo,2,saltoReingreso

ESCRIBIR_ARCHIVO idReingresoArchivo,longReingresoNombre,nombreReingresoRepo+2
ESCRIBIR_ARCHIVO idReingresoArchivo,2,saltoReingreso

ESCRIBIR_ARCHIVO idReingresoArchivo,longReingresoMotivo,motivoReingresoRepo+2
ESCRIBIR_ARCHIVO idReingresoArchivo,2,saltoReingreso

ESCRIBIR_ARCHIVO idReingresoArchivo,2,txtTempReingreso
ESCRIBIR_ARCHIVO idReingresoArchivo,2,saltoReingreso

MOV AL,tempReingreso
CMP AL,38
JA GUARDAR_DENEGADO

ESCRIBIR_ARCHIVO idReingresoArchivo,11,estadoReingreso
JMP CONTINUAR_GUARDADO

GUARDAR_DENEGADO:

ESCRIBIR_ARCHIVO idReingresoArchivo,9,estadoDenegadoReingreso

CONTINUAR_GUARDADO:

ESCRIBIR_ARCHIVO idReingresoArchivo,2,saltoReingreso

CERRAR_ARCHIVO idReingresoArchivo

IMP_COLOR msjReingresoBitacoraOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; IMPRIMIR REPORTE
;=====================================

IMPRIMIR_REPORTE_REINGRESO:

MOV AH,5
MOV DL,12
INT 21H

LEA SI,txtReingresoReporte
CALL IMPRIMIR_CADENA_REINGRESO

LEA SI,txtReingresoIDP
CALL IMPRIMIR_CADENA_REINGRESO

LEA SI,idReingresoRepo+2
MOV CL,idReingresoRepo+1
CALL IMPRIMIR_BUFFER_REINGRESO

LEA SI,txtReingresoNombreP
CALL IMPRIMIR_CADENA_REINGRESO

LEA SI,nombreReingresoRepo+2
MOV CL,nombreReingresoRepo+1
CALL IMPRIMIR_BUFFER_REINGRESO

LEA SI,txtReingresoMotivoP
CALL IMPRIMIR_CADENA_REINGRESO

LEA SI,motivoReingresoRepo+2
MOV CL,motivoReingresoRepo+1
CALL IMPRIMIR_BUFFER_REINGRESO

LEA SI,txtReingresoTempP
CALL IMPRIMIR_CADENA_REINGRESO

MOV AH,5
MOV DL,txtTempReingreso
INT 21H

MOV AH,5
MOV DL,txtTempReingreso+1
INT 21H

LEA SI,txtReingresoEstadoP
CALL IMPRIMIR_CADENA_REINGRESO

MOV AL,tempReingreso
CMP AL,38
JA IMPRIMIR_DENEGADO

LEA SI,estadoReingreso
CALL IMPRIMIR_CADENA_REINGRESO
JMP FIN_ESTADO_PRINT

IMPRIMIR_DENEGADO:

LEA SI,estadoDenegadoReingreso
CALL IMPRIMIR_CADENA_REINGRESO

FIN_ESTADO_PRINT:

IMP_COLOR msjReingresoPrintOK,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; IMPRIMIR CADENA
;=====================================

IMPRIMIR_CADENA_REINGRESO PROC

MOV AH,5

OTRA_CADENA_REINGRESO:

MOV DL,[SI]

CMP DL,'$'
JE FIN_CADENA_REINGRESO

INT 21H

INC SI
JMP OTRA_CADENA_REINGRESO

FIN_CADENA_REINGRESO:

RET

IMPRIMIR_CADENA_REINGRESO ENDP

;=====================================
; IMPRIMIR BUFFER
;=====================================

IMPRIMIR_BUFFER_REINGRESO PROC

MOV AH,5

OTRO_BUFFER_REINGRESO:

MOV DL,[SI]
INT 21H

INC SI

LOOP OTRO_BUFFER_REINGRESO

RET

IMPRIMIR_BUFFER_REINGRESO ENDP

;=====================================
; ENCENDER TERMOMETRO
;=====================================

ENCENDER_TERMOMETRO_REINGRESO:

ENCENDERTERMOMETRO

IMP_COLOR msjReingresoTermometroOn,30,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; APAGAR TERMOMETRO
;=====================================

APAGAR_TERMOMETRO_REINGRESO:

APAGARTERMOMETRO

IMP_COLOR msjReingresoTermometroOff,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; ERROR
;=====================================

ERROR_REINGRESO:

IMP_COLOR msjReingresoErrorArchivo,30,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_REINGRESO

;=====================================
; FIN
;=====================================

FIN:

MOV AX,4C00H
INT 21H

END