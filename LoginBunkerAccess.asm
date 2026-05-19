;===========================================
; LOGIN BUNKER ACCESS
;===========================================
#start=thermometer.exe#
#start=printer.exe#
#start=stepper_motor.exe#
#start=Traffic_Lights.exe#
#start=robot.exe#


INCLUDE Biblioteca_5D.lib

.MODEL SMALL
.STACK

.DATA 
;4TA OPCION:

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











;5TA OPCION:
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

















;3ra OPCION:

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




;2da OPCION:
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

rutaReingresoBitacora DB 'C:\BUNKER ACCESS\GILMAR GALLAGA\BitacoraReingreso.txt',0
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

rutaSalidaBitacora DB 'C:\BUNKER ACCESS\ANDRICK NATIVIDAD\BitacoraSalida.txt',0
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


;LOGINNN
ruta DB "C:\BUNKER ACCESS\ANDRICK NATIVIDAD\Users.txt",0

ID DW 0

;============= LOGO =================

msjLogo  db "|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|_"
         db "__|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___|___"
         db "|___|___|    ____  _   _  _   _   _  __  _____   ____    |___|___|"
         db "__|___|__   | __ )| | | || \ | | | |/ / | ____| |  _ \   __|___|__"         
         db "|___|___|   |  _ \| | | ||  \| | | ' /  |  _|   | |_) |  |___|___|"         
         db "__|___|__   | |_) | |_| || |\  |_| . \ _| |___ _|  _ <   __|___|__"         
         db "|___|___|   |____(_)___(_)_|_\_(_)_|\_(_)_____(_)_| \_\  |___|___|"         
         db "__|___|__         / \  / ___/ ___| ____/ ___/ ___/       __|___|__"         
         db "|___|___|        / _ \| |  | |   |  _| \___ \___ \       |___|___|"         
         db "__|___|__       / ___ \ |__| |___| |___ ___) |__) |      __|___|__"         
         db "|___|___|      /_/   \_\____\____|_____|____/____/       |___|___|$"

;============= LOGIN =================

msjTitulo       DB '========== WELCOME =========='
msjNombre       DB 'NAME:                        '
msjContrasena   DB 'PASSWORD:                    '
msjDivisor      DB '============================='
msjLogin        DB '     [L]ogin     [S]alir     '

msjLoginExito   DB '        LOGIN CON EXITO        '
msjLoginError   DB 'ERROR DE LOGIN INTENTE DE NUEVO'

;============= CADENAS ===============

Nombre          DB 6,0,7 DUP('$')
Password        DB 5,0,6 DUP('$')

;============= LEIDOS =================

usuarioTXT      DB 6 DUP('$')
passwordTXT     DB 5 DUP('$')

saltoLinea      DB 2 DUP('$') 


;=====================================
; MENU PRINCIPAL
;=====================================
msjTitulodos       db '      MENU PRINCIPAL       '
msjMenu1           DB '[1] SALIDA DEL BUNKER      '
msjMenu2           DB '[2] REINGRESO AL BUNKER    '
msjMenu3           DB '[3] ESTADO EXTERIOR        '
msjMenu4           DB '[4] CONTROL ALIMENTOS      '
msjMenu5           DB '[5] CHEQUEO MEDICO         '
msjMenu7           DB '[6] SALIR                  '

msjSeleccion       DB 'SELECCIONAR:               '


.CODE              

;=====================================
; LCD BIENVENIDA
;=====================================



INICIO:

    MOV AX,DATA
    MOV ES,AX
    MOV DS,AX
    JMP LOGO
    

;=====================================
; LCD BIENVENIDA
;=====================================

LCD_BIENVENIDA PROC

    MOV DX,2040H

;=========== LIMPIAR LCD ============

    MOV AL,' '
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX 
    
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX
    




;=========== WELCOME ================

    MOV AL,'W'
    OUT DX,AL
    INC DX

    MOV AL,'E'
    OUT DX,AL
    INC DX

    MOV AL,'L'
    OUT DX,AL
    INC DX

    MOV AL,'C'
    OUT DX,AL
    INC DX

    MOV AL,'O'
    OUT DX,AL
    INC DX

    MOV AL,'M'
    OUT DX,AL
    INC DX

    MOV AL,'E'
    OUT DX,AL
    INC DX
    
    
    MOV AL,' '
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX
    
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX
    
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX
    
    OUT DX,AL
    INC DX

    OUT DX,AL
    INC DX
    
    
    

;=========== NOMBRE =================

    MOV SI,2

MOSTRAR_NOMBRE:

    MOV AL,Nombre[SI]

    CMP AL,13
    JE SALIR_LCD

    CMP AL,'$'
    JE SALIR_LCD

    OUT DX,AL

    INC DX
    INC SI

    CMP SI,7
    JBE MOSTRAR_NOMBRE

SALIR_LCD:

    RET

LCD_BIENVENIDA ENDP
    

;=====================================
; LOGO
;=====================================

LOGO:

    IMP_COLOR msjLogo,726,0,0,0,0,0CH

;=====================================
; LOGIN
;=====================================

LOGIN:

    IMP_COLOR msjTitulo,29,0,0,14,18,0EH
    IMP_COLOR msjNombre,29,0,0,15,18,0EH
    IMP_COLOR msjContrasena,29,0,0,16,18,0EH
    IMP_COLOR msjDivisor,29,0,0,17,18,0EH
    IMP_COLOR msjLogin,29,0,0,18,18,0EH

;=====================================
; LIMPIAR MENSAJES
;=====================================

    IMP_COLOR msjDivisor,29,0,0,22,18,00H
    IMP_COLOR msjDivisor,29,0,0,23,18,00H

;=====================================
; CAPTURA
;=====================================

CAPTURA:

    CURSOR 15,33,0
    LECTURA_CADENA Nombre

    CURSOR 16,33,0
    LECTURA_CADENA Password

;=====================================
; MENU
;=====================================

MENU:

    CURSOR 18,31,0
    RASTREO

    CMP AL,'L'
    JE VALIDAR

    CMP AL,'l'
    JE VALIDAR

    CMP AL,'S'
    JE FIN

    CMP AL,'s'
    JE FIN

    JMP MENU

;=====================================
; VALIDAR LOGIN
;=====================================

VALIDAR:

    ABRIR_ARCHIVO ruta,2
    MOV ID,AX
    JC ERROR

;=====================================
; USUARIO 1
;=====================================

USUARIO1:

    LEER_ARCHIVO ID,5,usuarioTXT
    LEER_ARCHIVO ID,4,passwordTXT
    LEER_ARCHIVO ID,2,saltoLinea

    CALL COMPARAR

    CMP AX,1
    JE CORRECTO

;=====================================
; USUARIO 2
;=====================================

USUARIO2:

    LEER_ARCHIVO ID,5,usuarioTXT
    LEER_ARCHIVO ID,4,passwordTXT
    LEER_ARCHIVO ID,2,saltoLinea

    CALL COMPARAR

    CMP AX,1
    JE CORRECTO

;=====================================
; USUARIO 3
;=====================================

USUARIO3:

    LEER_ARCHIVO ID,5,usuarioTXT
    LEER_ARCHIVO ID,4,passwordTXT
    LEER_ARCHIVO ID,2,saltoLinea

    CALL COMPARAR

    CMP AX,1
    JE CORRECTO

;=====================================
; USUARIO 4
;=====================================

USUARIO4:

    LEER_ARCHIVO ID,5,usuarioTXT
    LEER_ARCHIVO ID,4,passwordTXT
    LEER_ARCHIVO ID,2,saltoLinea

    CALL COMPARAR

    CMP AX,1
    JE CORRECTO

    JMP ERROR

;=====================================
; PROCEDIMIENTO COMPARAR
;=====================================

COMPARAR PROC

;=========== USUARIO =================

    MOV AL,Nombre+2
    CMP AL,usuarioTXT[0]
    JNE FALSO

    MOV AL,Nombre+3
    CMP AL,usuarioTXT[1]
    JNE FALSO

    MOV AL,Nombre+4
    CMP AL,usuarioTXT[2]
    JNE FALSO

    MOV AL,Nombre+5
    CMP AL,usuarioTXT[3]
    JNE FALSO

    MOV AL,Nombre+6
    CMP AL,usuarioTXT[4]
    JNE FALSO

;=========== PASSWORD ================

    MOV AL,Password+2
    CMP AL,passwordTXT[0]
    JNE FALSO

    MOV AL,Password+3
    CMP AL,passwordTXT[1]
    JNE FALSO

    MOV AL,Password+4
    CMP AL,passwordTXT[2]
    JNE FALSO

    MOV AL,Password+5
    CMP AL,passwordTXT[3]
    JNE FALSO

    MOV AX,1
    JMP SALIR

FALSO:

    MOV AX,0

SALIR:

    RET

COMPARAR ENDP

;=====================================
; ERROR LOGIN
;=====================================

ERROR:

    IMP_COLOR msjLoginError,31,0,0,22,18,4EH
    CURSOR 23,18,0
    RASTREO

    JMP LIMPIAR

;=====================================
; LIMPIAR DATOS
;=====================================

LIMPIAR:

;=========== LIMPIAR NOMBRE ==========

    MOV Nombre[2],' '
    MOV Nombre[3],' '
    MOV Nombre[4],' '
    MOV Nombre[5],' '
    MOV Nombre[6],' '

;=========== LIMPIAR PASSWORD ========

    MOV Password[2],' '
    MOV Password[3],' '
    MOV Password[4],' '
    MOV Password[5],' '

;=========== LIMPIAR PANTALLA ========

    IMP_COLOR msjNombre,29,0,0,15,18,0EH
    IMP_COLOR msjContrasena,29,0,0,16,18,0EH

    JMP CAPTURA

;=====================================
; LOGIN CORRECTO
;=====================================

CORRECTO:

    IMP_COLOR msjLoginExito,31,0,0,22,18,2EH
    CALL LCD_BIENVENIDA
    CURSOR 23,18,0
    RASTREO
    
    
    
    
    
    
;MENSAJE EN DISPLAY

    JMP Menu_Principal









    
;=====================================
; MENU PRINCIPAL
;=====================================

MENU_PRINCIPAL:

;=========== LIMPIAR PANTALLA ============

    MOV AH,00
    MOV AL,03
    INT 10H

;=========== TITULO ======================

    IMP_COLOR msjLogo,726,0,0,0,0,0CH

;=========== OPCIONES ====================
    IMP_COLOR msjTitulodos,27,0,0,12,22,1EH
    IMP_COLOR msjMenu1,27,0,0,14,22,0EH
    IMP_COLOR msjMenu2,27,0,0,15,22,0EH
    IMP_COLOR msjMenu3,27,0,0,16,22,0EH
    IMP_COLOR msjMenu4,27,0,0,17,22,0EH
    IMP_COLOR msjMenu5,27,0,0,18,22,0EH
    IMP_COLOR msjMenu7,27,0,0,19,22,0EH

    IMP_COLOR msjSeleccion,27,0,0,21,22,0FH

;=====================================
; TECLA MENU
;=====================================

TECLA_MENU:

    CURSOR 21,40,0
    RASTREO

    CMP AL,'1'
    JE SALIDA_BUNKER

    CMP AL,'2'
    JE REINGRESO

    CMP AL,'3'
    JE ESTADO_EXTERIOR

    CMP AL,'4'
    JE ALIMENTOS

    CMP AL,'5'
    JE CHEQUEO

    CMP AL,'6'
    JE FIN

    JMP TECLA_MENU

;=====================================
; MODULO SALIDA
;=====================================
   
   
   
   
   
   
   
SALIDA_BUNKER:

    MOV AH,00
    MOV AL,03
    INT 10H

;=====================================
; MENU
;=====================================

MENU_SALIDA:

LIMPIAR_PANTALLA
IMP_COLOR msjLogo,726,0,0,0,0,0CH

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
JE MENU_PRINCIPAL

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
; MODULO REINGRESO
;=====================================

REINGRESO:

    MOV AH,00
    MOV AL,03
    INT 10H
    
    ;=====================================
; MENU
;=====================================

MENU_REINGRESO:

LIMPIAR_PANTALLA

IMP_COLOR msjLogo,726,0,0,0,0,0CH
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
JE MENU_PRINCIPAL

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

    

JMP MENU_SALIDA 











;=====================================
; MODULO ESTADO EXTERIOR
;=====================================

ESTADO_EXTERIOR:

    MOV AH,00
    MOV AL,03
    INT 10H
    
    ;=====================================
; MENU
;=====================================

MENU_EXTERIOR:

LIMPIAR_PANTALLA
IMP_COLOR msjLogo,726,0,0,0,0,0CH

IMP_COLOR msjExteriorTitulo,30,0,0,12,18,1EH

IMP_COLOR msjExteriorMenu1,30,0,0,14,18,0EH
IMP_COLOR msjExteriorMenu2,30,0,0,15,18,0EH
IMP_COLOR msjExteriorMenu3,30,0,0,16,18,0EH
IMP_COLOR msjExteriorMenu4,30,0,0,17,18,0EH
IMP_COLOR msjExteriorMenu5,30,0,0,18,18,0EH
IMP_COLOR msjExteriorMenu6,30,0,0,19,18,0EH
IMP_COLOR msjExteriorMenu7,30,0,0,20,18,0EH
IMP_COLOR msjExteriorMenu8,30,0,0,21,18,0EH

IMP_COLOR msjExteriorSeleccion,30,0,0,22,18,0FH

;=====================================
; TECLAS
;=====================================

TECLA_EXTERIOR:

CURSOR 22,44,0
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
JE MENU_PRINCIPAL

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
; MODULO ALIMENTOS
;=====================================

ALIMENTOS:

    MOV AH,00
    MOV AL,03
    INT 10H
    
;=====================================
; MENU
;=====================================

MENU_ALIMENTOS:

LIMPIAR_PANTALLA
IMP_COLOR msjLogo,726,0,0,0,0,0CH

IMP_COLOR msjAlimentosTitulo,33,0,0,12,15,1EH

IMP_COLOR msjAlimentosMenu1,33,0,0,14,15,0EH
IMP_COLOR msjAlimentosMenu2,33,0,0,15,15,0EH
IMP_COLOR msjAlimentosMenu3,33,0,0,16,15,0EH
IMP_COLOR msjAlimentosMenu4,33,0,0,17,15,0EH
IMP_COLOR msjAlimentosMenu5,33,0,0,18,15,0EH
IMP_COLOR msjAlimentosMenu6,33,0,0,19,15,0EH
IMP_COLOR msjAlimentosMenu7,33,0,0,20,15,0EH

IMP_COLOR msjAlimentosSeleccion,33,0,0,22,15,0FH

;=====================================
; TECLAS
;=====================================

TECLA_ALIMENTOS:

CURSOR 22,50,0
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
JE MENU_PRINCIPAL

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
; MODULO CHEQUEO
;=====================================

CHEQUEO:

    MOV AH,00
    MOV AL,03
    INT 10H
    
;=====================================
; MENU
;=====================================

MENU_CHEQUEO:

LIMPIAR_PANTALLA 
IMP_COLOR msjLogo,726,0,0,0,0,0CH

IMP_COLOR msjChequeoTitulo,30,0,0,12,15,1EH

IMP_COLOR msjChequeoMenu1,35,0,0,14,15,0EH
IMP_COLOR msjChequeoMenu2,35,0,0,15,15,0EH
IMP_COLOR msjChequeoMenu3,35,0,0,16,15,0EH
IMP_COLOR msjChequeoMenu4,35,0,0,17,15,0EH
IMP_COLOR msjChequeoMenu5,35,0,0,18,15,0EH
IMP_COLOR msjChequeoMenu6,35,0,0,19,15,0EH
IMP_COLOR msjChequeoMenu7,35,0,0,20,15,0EH

IMP_COLOR msjChequeoSeleccion,35,0,0,22,15,0FH

;=====================================
; TECLAS MENU
;=====================================

TECLA_CHEQUEO:

CURSOR 22,50,0
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
JE MENU_PRINCIPAL

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