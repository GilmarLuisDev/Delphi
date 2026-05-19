;===========================================
; PROGRAMA CONTROL DE ALIMENTOS
;===========================================

INCLUDE Biblioteca_5D.lib

#start=thermometer.exe#
#start=printer.exe#

.MODEL SMALL
.STACK

.DATA

;=====================================
; ARCHIVO
;=====================================

rutaAlimentosReporte DB 'C:\BUNKER ACCESS\LUCIA GALINDO\Alimentos.txt',0
idAlimentosArchivo DW 0

;=====================================
; MENU
;=====================================

msjAlimentosTitulo DB '      CONTROL DE ALIMENTOS       '

msjAlimentosMenu1  DB '[1] CAPTURAR DATOS               '
msjAlimentosMenu2  DB '[2] TOMAR TEMPERATURA            '
msjAlimentosMenu3  DB '[3] GENERAR REPORTE TXT          '
msjAlimentosMenu4  DB '[4] IMPRIMIR REPORTE             '
msjAlimentosMenu5  DB '[5] ENCENDER TERMOMETRO          '
msjAlimentosMenu6  DB '[6] APAGAR TERMOMETRO            '
msjAlimentosMenu7  DB '[7] SALIR                        '

msjAlimentosSeleccion DB 'SELECCIONAR:                     '

;=====================================
; FORMULARIO
;=====================================

msjAlimentosTituloFor DB '==== FORMULARIO ALIMENTOS ===='

msjAlimentosID        DB 'ID PRODUCTO:                    '
msjAlimentosNombre    DB 'NOMBRE:                         '
msjAlimentosCantidad  DB 'CANTIDAD:                       '
msjAlimentosTipo      DB 'TIPO:                           '
msjAlimentosCaducidad DB 'CADUCIDAD:                      '
msjAlimentosPasillo   DB 'PASILLO:                        '
msjAlimentosEncargado DB 'ENCARGADO:                      '

msjAlimentosDivisor DB '=============================='

msjAlimentosFormularioOK DB ' DATOS GUARDADOS '

;=====================================
; MENSAJES
;=====================================

msjAlimentosTemp          DB 'TEMPERATURA AMBIENTE:   '

msjAlimentosSeguro        DB 'ALIMENTOS ESTABLES      '
msjAlimentosPeligro       DB 'RIESGO DE DESCOMPOSICION'

msjAlimentosReporteOK     DB 'REPORTE GUARDADO        '
msjAlimentosPrintOK       DB 'REPORTE IMPRESO         '

msjAlimentosTermometroON  DB 'TERMOMETRO ENCENDIDO    '
msjAlimentosTermometroOFF DB 'TERMOMETRO APAGADO      '

msjAlimentosError         DB 'ERROR EN ARCHIVO        '

;=====================================
; VARIABLES
;=====================================

tempAlimentos DB 0
txtTempAlimentos DB 0,0,'$'

estadoSeguroAlimentos DB 'ESTABLE$'
estadoPeligroAlimentos DB 'PELIGRO$'

;=====================================
; CADENAS
;=====================================

idAlimentosRepo DB 6,0,7 DUP('$')

nombreAlimentosRepo DB 20,0,21 DUP('$')

cantidadAlimentosRepo DB 5,0,6 DUP('$')

tipoAlimentosRepo DB 15,0,16 DUP('$')

caducidadAlimentosRepo DB 12,0,13 DUP('$')

pasilloAlimentosRepo DB 5,0,6 DUP('$')

encargadoAlimentosRepo DB 20,0,21 DUP('$')

;=====================================
; LONGITUDES
;=====================================

longAlimentosID DW 0
longAlimentosNombre DW 0
longAlimentosCantidad DW 0
longAlimentosTipo DW 0
longAlimentosCaducidad DW 0
longAlimentosPasillo DW 0
longAlimentosEncargado DW 0

;=====================================
; SALTOS
;=====================================

saltoAlimentos DB 13,10

;=====================================
; TEXTOS TXT
;=====================================

txtAlimentosIDTXT DB 'ID: '
txtAlimentosNombreTXT DB 'NOMBRE: '
txtAlimentosCantidadTXT DB 'CANTIDAD: '
txtAlimentosTipoTXT DB 'TIPO: '
txtAlimentosCaducidadTXT DB 'CADUCIDAD: '
txtAlimentosPasilloTXT DB 'PASILLO: '
txtAlimentosEncargadoTXT DB 'ENCARGADO: '
txtAlimentosTempTXT DB 'TEMPERATURA: '
txtAlimentosEstadoTXT DB 'ESTADO: '

;=====================================
; TEXTOS PRINTER
;=====================================

txtAlimentosReporte DB 10,13,'===== CONTROL ALIMENTOS =====$'

txtAlimentosIDP DB 10,13,'ID: $'
txtAlimentosNombreP DB 10,13,'NOMBRE: $'
txtAlimentosCantidadP DB 10,13,'CANTIDAD: $'
txtAlimentosTipoP DB 10,13,'TIPO: $'
txtAlimentosCaducidadP DB 10,13,'CADUCIDAD: $'
txtAlimentosPasilloP DB 10,13,'PASILLO: $'
txtAlimentosEncargadoP DB 10,13,'ENCARGADO: $'
txtAlimentosTempP DB 10,13,'TEMPERATURA: $'
txtAlimentosEstadoP DB 10,13,'ESTADO: $'

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

MENU_ALIMENTOS:

LIMPIAR_PANTALLA

IMP_COLOR msjAlimentosTitulo,33,0,0,10,15,1EH

IMP_COLOR msjAlimentosMenu1,33,0,0,12,15,0EH
IMP_COLOR msjAlimentosMenu2,33,0,0,13,15,0EH
IMP_COLOR msjAlimentosMenu3,33,0,0,14,15,0EH
IMP_COLOR msjAlimentosMenu4,33,0,0,15,15,0EH
IMP_COLOR msjAlimentosMenu5,33,0,0,16,15,0EH
IMP_COLOR msjAlimentosMenu6,33,0,0,17,15,0EH
IMP_COLOR msjAlimentosMenu7,33,0,0,18,15,0EH

IMP_COLOR msjAlimentosSeleccion,33,0,0,20,15,0FH

;=====================================
; TECLAS
;=====================================

TECLA_ALIMENTOS:

CURSOR 20,50,0
RASTREO

CMP AL,'1'
JE CAPTURAR_DATOS_ALIMENTOS

CMP AL,'2'
JE TOMAR_TEMP_ALIMENTOS

CMP AL,'3'
JE GENERAR_REPORTE_ALIMENTOS

CMP AL,'4'
JE IMPRIMIR_REPORTE_ALIMENTOS

CMP AL,'5'
JE ENCENDER_TERMOMETRO_ALIMENTOS

CMP AL,'6'
JE APAGAR_TERMOMETRO_ALIMENTOS

CMP AL,'7'
JE FIN

JMP TECLA_ALIMENTOS

;=====================================
; CAPTURAR DATOS
;=====================================

CAPTURAR_DATOS_ALIMENTOS:

LIMPIAR_PANTALLA

IMP_COLOR msjAlimentosTituloFor,30,0,0,7,18,0EH

IMP_COLOR msjAlimentosID,32,0,0,9,18,0EH
IMP_COLOR msjAlimentosNombre,32,0,0,10,18,0EH
IMP_COLOR msjAlimentosCantidad,32,0,0,11,18,0EH
IMP_COLOR msjAlimentosTipo,32,0,0,12,18,0EH
IMP_COLOR msjAlimentosCaducidad,32,0,0,13,18,0EH
IMP_COLOR msjAlimentosPasillo,32,0,0,14,18,0EH
IMP_COLOR msjAlimentosEncargado,32,0,0,15,18,0EH

IMP_COLOR msjAlimentosDivisor,30,0,0,16,18,0EH

CURSOR 9,35,0
LECTURA_CADENA idAlimentosRepo

CURSOR 10,35,0
LECTURA_CADENA nombreAlimentosRepo

CURSOR 11,35,0
LECTURA_CADENA cantidadAlimentosRepo

CURSOR 12,35,0
LECTURA_CADENA tipoAlimentosRepo

CURSOR 13,35,0
LECTURA_CADENA caducidadAlimentosRepo

CURSOR 14,35,0
LECTURA_CADENA pasilloAlimentosRepo

CURSOR 15,35,0
LECTURA_CADENA encargadoAlimentosRepo

IMP_COLOR msjAlimentosFormularioOK,17,0,0,22,18,2EH

CURSOR 23,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; TEMPERATURA
;=====================================

TOMAR_TEMP_ALIMENTOS:

MOV DX,125
XOR AX,AX

IN AL,DX

MOV tempAlimentos,AL

MOV AH,0
MOV AL,tempAlimentos

MOV BL,10
DIV BL

ADD AL,30H
MOV txtTempAlimentos,AL

ADD AH,30H
MOV txtTempAlimentos+1,AH

IMP_COLOR msjAlimentosTemp,24,0,0,22,18,0EH
IMP_COLOR txtTempAlimentos,2,0,0,22,55,0FH

MOV AL,tempAlimentos
CMP AL,30
JA PELIGRO_ALIMENTOS

IMP_COLOR msjAlimentosSeguro,24,0,0,23,18,2EH
JMP FIN_TEMP_ALIMENTOS

PELIGRO_ALIMENTOS:

IMP_COLOR msjAlimentosPeligro,24,0,0,23,18,4EH

FIN_TEMP_ALIMENTOS:

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; GENERAR TXT
;=====================================

GENERAR_REPORTE_ALIMENTOS:

ABRIR_ARCHIVO rutaAlimentosReporte,2

MOV idAlimentosArchivo,AX

JC ERROR_ALIMENTOS

MOV AL,idAlimentosRepo+1
XOR AH,AH
MOV longAlimentosID,AX

MOV AL,nombreAlimentosRepo+1
XOR AH,AH
MOV longAlimentosNombre,AX

MOV AL,cantidadAlimentosRepo+1
XOR AH,AH
MOV longAlimentosCantidad,AX

MOV AL,tipoAlimentosRepo+1
XOR AH,AH
MOV longAlimentosTipo,AX

MOV AL,caducidadAlimentosRepo+1
XOR AH,AH
MOV longAlimentosCaducidad,AX

MOV AL,pasilloAlimentosRepo+1
XOR AH,AH
MOV longAlimentosPasillo,AX

MOV AL,encargadoAlimentosRepo+1
XOR AH,AH
MOV longAlimentosEncargado,AX

ESCRIBIR_ARCHIVO idAlimentosArchivo,4,txtAlimentosIDTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosID,idAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,8,txtAlimentosNombreTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosNombre,nombreAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,10,txtAlimentosCantidadTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosCantidad,cantidadAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,6,txtAlimentosTipoTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosTipo,tipoAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,12,txtAlimentosCaducidadTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosCaducidad,caducidadAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,10,txtAlimentosPasilloTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosPasillo,pasilloAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,12,txtAlimentosEncargadoTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,longAlimentosEncargado,encargadoAlimentosRepo+2
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,13,txtAlimentosTempTXT
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,txtTempAlimentos
ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

ESCRIBIR_ARCHIVO idAlimentosArchivo,8,txtAlimentosEstadoTXT

MOV AL,tempAlimentos
CMP AL,30
JA SAVE_PELIGRO_ALIMENTOS

ESCRIBIR_ARCHIVO idAlimentosArchivo,7,estadoSeguroAlimentos
JMP FIN_SAVE_ALIMENTOS

SAVE_PELIGRO_ALIMENTOS:

ESCRIBIR_ARCHIVO idAlimentosArchivo,8,estadoPeligroAlimentos

FIN_SAVE_ALIMENTOS:

ESCRIBIR_ARCHIVO idAlimentosArchivo,2,saltoAlimentos

CERRAR_ARCHIVO idAlimentosArchivo

IMP_COLOR msjAlimentosReporteOK,24,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; IMPRIMIR REPORTE
;=====================================

IMPRIMIR_REPORTE_ALIMENTOS:

MOV AH,5
MOV DL,12
INT 21H

LEA SI,txtAlimentosReporte
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,txtAlimentosIDP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,idAlimentosRepo+2
MOV CL,idAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosNombreP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,nombreAlimentosRepo+2
MOV CL,nombreAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosCantidadP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,cantidadAlimentosRepo+2
MOV CL,cantidadAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosTipoP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,tipoAlimentosRepo+2
MOV CL,tipoAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosCaducidadP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,caducidadAlimentosRepo+2
MOV CL,caducidadAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosPasilloP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,pasilloAlimentosRepo+2
MOV CL,pasilloAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosEncargadoP
CALL IMPRIMIR_CADENA_ALIMENTOS

LEA SI,encargadoAlimentosRepo+2
MOV CL,encargadoAlimentosRepo+1
CALL IMPRIMIR_BUFFER_ALIMENTOS

LEA SI,txtAlimentosTempP
CALL IMPRIMIR_CADENA_ALIMENTOS

MOV AH,5
MOV DL,txtTempAlimentos
INT 21H

MOV AH,5
MOV DL,txtTempAlimentos+1
INT 21H

LEA SI,txtAlimentosEstadoP
CALL IMPRIMIR_CADENA_ALIMENTOS

MOV AL,tempAlimentos
CMP AL,30
JA IMPRIMIR_PELIGRO_ALIMENTOS

LEA SI,estadoSeguroAlimentos
CALL IMPRIMIR_CADENA_ALIMENTOS
JMP FIN_PRINT_ALIMENTOS

IMPRIMIR_PELIGRO_ALIMENTOS:

LEA SI,estadoPeligroAlimentos
CALL IMPRIMIR_CADENA_ALIMENTOS

FIN_PRINT_ALIMENTOS:

IMP_COLOR msjAlimentosPrintOK,24,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; IMPRIMIR CADENA
;=====================================

IMPRIMIR_CADENA_ALIMENTOS PROC

MOV AH,5

OTRA_CADENA_ALIMENTOS:

MOV DL,[SI]

CMP DL,'$'
JE FIN_CADENA_ALIMENTOS

INT 21H

INC SI
JMP OTRA_CADENA_ALIMENTOS

FIN_CADENA_ALIMENTOS:

RET

IMPRIMIR_CADENA_ALIMENTOS ENDP

;=====================================
; IMPRIMIR BUFFER
;=====================================

IMPRIMIR_BUFFER_ALIMENTOS PROC

MOV AH,5

OTRO_BUFFER_ALIMENTOS:

MOV DL,[SI]
INT 21H

INC SI

LOOP OTRO_BUFFER_ALIMENTOS

RET

IMPRIMIR_BUFFER_ALIMENTOS ENDP

;=====================================
; ENCENDER TERMOMETRO
;=====================================

ENCENDER_TERMOMETRO_ALIMENTOS:

ENCENDERTERMOMETRO

IMP_COLOR msjAlimentosTermometroON,24,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; APAGAR TERMOMETRO
;=====================================

APAGAR_TERMOMETRO_ALIMENTOS:

APAGARTERMOMETRO

IMP_COLOR msjAlimentosTermometroOFF,24,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; ERROR
;=====================================

ERROR_ALIMENTOS:

IMP_COLOR msjAlimentosError,24,0,0,23,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_ALIMENTOS

;=====================================
; FIN
;=====================================

FIN:

MOV AX,4C00H
INT 21H

END