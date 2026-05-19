;===========================================
; PROGRAMA CHEQUEO MEDICO
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

rutaChequeoReporte DB 'C:\BUNKER ACCESS\LUCIA GALINDO\ChequeoMedico.txt',0
idChequeoArchivo DW 0

;=====================================
; MENU
;=====================================

msjChequeoTitulo DB '        MENU CHEQUEO MEDICO        '

msjChequeoMenu1 DB '[1] CAPTURAR DATOS PACIENTE        '
msjChequeoMenu2 DB '[2] TOMAR TEMPERATURA              '
msjChequeoMenu3 DB '[3] GENERAR REPORTE TXT            '
msjChequeoMenu4 DB '[4] IMPRIMIR REPORTE               '
msjChequeoMenu5 DB '[5] ENCENDER TERMOMETRO            '
msjChequeoMenu6 DB '[6] APAGAR TERMOMETRO              '
msjChequeoMenu7 DB '[7] SALIR                          '

msjChequeoSeleccion DB 'SELECCIONAR:                       '
 
 
 
 
 
;=====================================
; FORMULARIO
;=====================================

msjChequeoTituloFor DB '===== FORMULARIO MEDICO ===== '

msjChequeoID        DB 'ID PACIENTE:                  '
msjChequeoNombre    DB 'NOMBRE:                       '
msjChequeoEdad      DB 'EDAD:                         '
msjChequeoAlergia   DB 'ALERGIA:                      '
msjChequeoTipo      DB 'TIPO SANGRE:                  '
msjChequeoSintoma   DB 'SINTOMAS:                     '
msjChequeoDoctor    DB 'DOCTOR:                       '

msjChequeoDivisor   DB '=============================='

msjChequeoFormularioOK DB ' FORMULARIO COMPLETADO '

;=====================================
; MENSAJES
;=====================================

msjChequeoTermometroON  DB 'TERMOMETRO ENCENDIDO  '
msjChequeoTermometroOFF DB 'TERMOMETRO APAGADO    '

msjChequeoTemperatura   DB 'TEMPERATURA PACIENTE: '

msjChequeoTempAlta      DB 'PACIENTE CON FIEBRE   '
msjChequeoTempNormal    DB 'TEMPERATURA NORMAL    '

msjChequeoReporteOK     DB 'REPORTE GUARDADO      '
msjChequeoPrintOK       DB 'REPORTE IMPRESO       '

msjChequeoError         DB 'ERROR EN ARCHIVO      '

;=====================================
; VARIABLES
;=====================================

tempChequeo DB 0
txtTempChequeo DB 0,0,'$'

estadoNormalChequeo DB 'NORMAL$'
estadoFiebreChequeo DB 'FIEBRE$'

;=====================================
; CADENAS
;=====================================

idChequeoRepo       DB 5,0,6 DUP('$')
nombreChequeoRepo   DB 20,0,21 DUP('$')
edadChequeoRepo     DB 3,0,4 DUP('$')
alergiaChequeoRepo  DB 20,0,21 DUP('$')
tipoChequeoRepo     DB 5,0,6 DUP('$')
sintomaChequeoRepo  DB 30,0,31 DUP('$')
doctorChequeoRepo   DB 20,0,21 DUP('$')

;=====================================
; LONGITUDES
;=====================================

longChequeoID DW 0
longChequeoNombre DW 0
longChequeoEdad DW 0
longChequeoAlergia DW 0
longChequeoTipo DW 0
longChequeoSintoma DW 0
longChequeoDoctor DW 0

;=====================================
; SALTOS
;=====================================

saltoChequeo DB 13,10

;=====================================
; TEXTOS TXT
;=====================================

txtChequeoIDTXT       DB 'ID: '
txtChequeoNombreTXT   DB 'NOMBRE: '
txtChequeoEdadTXT     DB 'EDAD: '
txtChequeoAlergiaTXT  DB 'ALERGIA: '
txtChequeoTipoTXT     DB 'TIPO SANGRE: '
txtChequeoSintomaTXT  DB 'SINTOMAS: '
txtChequeoDoctorTXT   DB 'DOCTOR: '
txtChequeoTempTXT     DB 'TEMPERATURA: '
txtChequeoEstadoTXT   DB 'ESTADO: '

;=====================================
; TEXTOS PRINTER
;=====================================

txtChequeoReporte DB 10,13,'===== CHEQUEO MEDICO =====$'

txtChequeoIDP       DB 10,13,'ID: $'
txtChequeoNombreP   DB 10,13,'NOMBRE: $'
txtChequeoEdadP     DB 10,13,'EDAD: $'
txtChequeoAlergiaP  DB 10,13,'ALERGIA: $'
txtChequeoTipoP     DB 10,13,'TIPO SANGRE: $'
txtChequeoSintomaP  DB 10,13,'SINTOMAS: $'
txtChequeoDoctorP   DB 10,13,'DOCTOR: $'
txtChequeoTempP     DB 10,13,'TEMPERATURA: $'
txtChequeoEstadoP   DB 10,13,'ESTADO: $'

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

MENU_CHEQUEO:

LIMPIAR_PANTALLA

IMP_COLOR msjChequeoTitulo,30,0,0,10,15,1EH

IMP_COLOR msjChequeoMenu1,35,0,0,12,15,0EH
IMP_COLOR msjChequeoMenu2,35,0,0,13,15,0EH
IMP_COLOR msjChequeoMenu3,35,0,0,14,15,0EH
IMP_COLOR msjChequeoMenu4,35,0,0,15,15,0EH
IMP_COLOR msjChequeoMenu5,35,0,0,16,15,0EH
IMP_COLOR msjChequeoMenu6,35,0,0,17,15,0EH
IMP_COLOR msjChequeoMenu7,35,0,0,18,15,0EH

IMP_COLOR msjChequeoSeleccion,35,0,0,20,15,0FH

;=====================================
; TECLAS MENU
;=====================================

TECLA_CHEQUEO:

CURSOR 20,50,0
RASTREO

CMP AL,'1'
JE CAPTURAR_DATOS_CHEQUEO

CMP AL,'2'
JE TOMAR_TEMP_CHEQUEO

CMP AL,'3'
JE GENERAR_REPORTE_CHEQUEO

CMP AL,'4'
JE IMPRIMIR_REPORTE_CHEQUEO

CMP AL,'5'
JE ENCENDER_TERMOMETRO_CHEQUEO

CMP AL,'6'
JE APAGAR_TERMOMETRO_CHEQUEO

CMP AL,'7'
JE FIN

JMP TECLA_CHEQUEO

;=====================================
; CAPTURAR DATOS
;=====================================

CAPTURAR_DATOS_CHEQUEO:

LIMPIAR_PANTALLA

IMP_COLOR msjChequeoTituloFor,32,0,0,8,18,0EH

IMP_COLOR msjChequeoID,30,0,0,10,18,0EH
IMP_COLOR msjChequeoNombre,30,0,0,11,18,0EH
IMP_COLOR msjChequeoEdad,30,0,0,12,18,0EH
IMP_COLOR msjChequeoAlergia,30,0,0,13,18,0EH
IMP_COLOR msjChequeoTipo,30,0,0,14,18,0EH
IMP_COLOR msjChequeoSintoma,30,0,0,15,18,0EH
IMP_COLOR msjChequeoDoctor,30,0,0,16,18,0EH

IMP_COLOR msjChequeoDivisor,30,0,0,17,18,0EH

CURSOR 10,30,0
LECTURA_CADENA idChequeoRepo

CURSOR 11,30,0
LECTURA_CADENA nombreChequeoRepo

CURSOR 12,30,0
LECTURA_CADENA edadChequeoRepo

CURSOR 13,30,0
LECTURA_CADENA alergiaChequeoRepo

CURSOR 14,30,0
LECTURA_CADENA tipoChequeoRepo

CURSOR 15,30,0
LECTURA_CADENA sintomaChequeoRepo

CURSOR 16,30,0
LECTURA_CADENA doctorChequeoRepo

IMP_COLOR msjChequeoFormularioOK,23,0,0,22,18,2EH

CURSOR 23,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; TOMAR TEMPERATURA
;=====================================

TOMAR_TEMP_CHEQUEO:

MOV DX,125
XOR AX,AX

IN AL,DX

MOV tempChequeo,AL

MOV AH,0
MOV AL,tempChequeo

MOV BL,10
DIV BL

ADD AL,30H
MOV txtTempChequeo,AL

ADD AH,30H
MOV txtTempChequeo+1,AH

IMP_COLOR msjChequeoTemperatura,22,0,0,22,18,0EH
IMP_COLOR txtTempChequeo,2,0,0,22,50,0FH

MOV AL,tempChequeo
CMP AL,38
JA TEMP_ALTA_CHEQUEO

IMP_COLOR msjChequeoTempNormal,22,0,0,23,18,2EH
JMP FIN_TEMP_CHEQUEO

TEMP_ALTA_CHEQUEO:

IMP_COLOR msjChequeoTempAlta,22,0,0,23,18,4EH

FIN_TEMP_CHEQUEO:

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; GENERAR REPORTE TXT
;=====================================

GENERAR_REPORTE_CHEQUEO:

ABRIR_ARCHIVO rutaChequeoReporte,2

MOV idChequeoArchivo,AX

JC ERROR_CHEQUEO

MOV AL,idChequeoRepo+1
XOR AH,AH
MOV longChequeoID,AX

MOV AL,nombreChequeoRepo+1
XOR AH,AH
MOV longChequeoNombre,AX

MOV AL,edadChequeoRepo+1
XOR AH,AH
MOV longChequeoEdad,AX

MOV AL,alergiaChequeoRepo+1
XOR AH,AH
MOV longChequeoAlergia,AX

MOV AL,tipoChequeoRepo+1
XOR AH,AH
MOV longChequeoTipo,AX

MOV AL,sintomaChequeoRepo+1
XOR AH,AH
MOV longChequeoSintoma,AX

MOV AL,doctorChequeoRepo+1
XOR AH,AH
MOV longChequeoDoctor,AX

;=====================================
; ID
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,4,txtChequeoIDTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoID,idChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; NOMBRE
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,8,txtChequeoNombreTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoNombre,nombreChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; EDAD
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,7,txtChequeoEdadTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoEdad,edadChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; ALERGIA
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,10,txtChequeoAlergiaTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoAlergia,alergiaChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; TIPO SANGRE
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,14,txtChequeoTipoTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoTipo,tipoChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; SINTOMAS
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,10,txtChequeoSintomaTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoSintoma,sintomaChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; DOCTOR
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,8,txtChequeoDoctorTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,longChequeoDoctor,doctorChequeoRepo+2
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; TEMPERATURA
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,13,txtChequeoTempTXT
ESCRIBIR_ARCHIVO idChequeoArchivo,2,txtTempChequeo
ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

;=====================================
; ESTADO
;=====================================

ESCRIBIR_ARCHIVO idChequeoArchivo,8,txtChequeoEstadoTXT

MOV AL,tempChequeo
CMP AL,38
JA SAVE_FIEBRE_CHEQUEO

ESCRIBIR_ARCHIVO idChequeoArchivo,6,estadoNormalChequeo
JMP FIN_SAVE_CHEQUEO

SAVE_FIEBRE_CHEQUEO:

ESCRIBIR_ARCHIVO idChequeoArchivo,7,estadoFiebreChequeo

FIN_SAVE_CHEQUEO:

ESCRIBIR_ARCHIVO idChequeoArchivo,2,saltoChequeo

CERRAR_ARCHIVO idChequeoArchivo

IMP_COLOR msjChequeoReporteOK,22,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; IMPRIMIR REPORTE
;=====================================

IMPRIMIR_REPORTE_CHEQUEO:

MOV AH,5
MOV DL,12
INT 21H

LEA SI,txtChequeoReporte
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,txtChequeoIDP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,idChequeoRepo+2
MOV CL,idChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoNombreP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,nombreChequeoRepo+2
MOV CL,nombreChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoEdadP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,edadChequeoRepo+2
MOV CL,edadChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoAlergiaP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,alergiaChequeoRepo+2
MOV CL,alergiaChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoTipoP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,tipoChequeoRepo+2
MOV CL,tipoChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoSintomaP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,sintomaChequeoRepo+2
MOV CL,sintomaChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoDoctorP
CALL IMPRIMIR_CADENA_CHEQUEO

LEA SI,doctorChequeoRepo+2
MOV CL,doctorChequeoRepo+1
CALL IMPRIMIR_BUFFER_CHEQUEO

LEA SI,txtChequeoTempP
CALL IMPRIMIR_CADENA_CHEQUEO

MOV AH,5
MOV DL,txtTempChequeo
INT 21H

MOV AH,5
MOV DL,txtTempChequeo+1
INT 21H

LEA SI,txtChequeoEstadoP
CALL IMPRIMIR_CADENA_CHEQUEO

MOV AL,tempChequeo
CMP AL,38
JA IMPRIMIR_FIEBRE_CHEQUEO

LEA SI,estadoNormalChequeo
CALL IMPRIMIR_CADENA_CHEQUEO
JMP FIN_PRINT_CHEQUEO

IMPRIMIR_FIEBRE_CHEQUEO:

LEA SI,estadoFiebreChequeo
CALL IMPRIMIR_CADENA_CHEQUEO

FIN_PRINT_CHEQUEO:

IMP_COLOR msjChequeoPrintOK,22,0,0,23,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; IMPRIMIR CADENA
;=====================================

IMPRIMIR_CADENA_CHEQUEO PROC

MOV AH,5

OTRA_CADENA_CHEQUEO:

MOV DL,[SI]

CMP DL,'$'
JE FIN_CADENA_CHEQUEO

INT 21H

INC SI
JMP OTRA_CADENA_CHEQUEO

FIN_CADENA_CHEQUEO:

RET

IMPRIMIR_CADENA_CHEQUEO ENDP

;=====================================
; IMPRIMIR BUFFER
;=====================================

IMPRIMIR_BUFFER_CHEQUEO PROC

MOV AH,5

OTRO_BUFFER_CHEQUEO:

MOV DL,[SI]
INT 21H

INC SI

LOOP OTRO_BUFFER_CHEQUEO

RET

IMPRIMIR_BUFFER_CHEQUEO ENDP

;=====================================
; ENCENDER TERMOMETRO
;=====================================

ENCENDER_TERMOMETRO_CHEQUEO:

ENCENDERTERMOMETRO

IMP_COLOR msjChequeoTermometroON,22,0,0,22,18,2EH

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; APAGAR TERMOMETRO
;=====================================

APAGAR_TERMOMETRO_CHEQUEO:

APAGARTERMOMETRO

IMP_COLOR msjChequeoTermometroOFF,22,0,0,22,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; ERROR
;=====================================

ERROR_CHEQUEO:

IMP_COLOR msjChequeoError,22,0,0,22,18,4EH

CURSOR 24,18,0
RASTREO

JMP MENU_CHEQUEO

;=====================================
; FIN
;=====================================

FIN:

MOV AX,4C00H
INT 21H

END