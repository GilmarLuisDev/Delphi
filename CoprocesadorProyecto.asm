;============================================================
; FORMULARIO MATEMATICO (COPROCESADOR x87)
; Proyecto: Bunker Access
; Operaciones requeridas: FADD, FSUB, FMUL, FDIV, FSQRT,
;                         FABS, FSCALE, FCHS
;============================================================

INCLUDE Biblioteca_5D.lib

.MODEL SMALL
.STACK

.DATA

tituloFormulario DB '     FORMULARIO COPROCESADOR MATEMATICO     '
subtituloVideo   DB 'TRAILER: https://github.com/GilmarLuisDev/Delphi'
subtituloEntrev  DB 'ENTREVISTA: agrega aqui el link de tu entrevista'

menu1 DB '[1] ENERGIA TOTAL: (A*B) + (C/D)             '
menu2 DB '[2] DESPLAZAMIENTO: (A-B)                     '
menu3 DB '[3] RIESGO ABSOLUTO: ABS(A-B)                '
menu4 DB '[4] CAMBIO DE SIGNO: -A                      '
menu5 DB '[5] DISTANCIA: SQRT(A)                        '
menu6 DB '[6] ESCALAR 2^N: A * (2^N)                    '
menu7 DB '[7] SALIR                                     '
menuSel DB 'SELECCIONA OPCION:                            '

msgA DB 'A = $'
msgB DB 'B = $'
msgC DB 'C = $'
msgD DB 'D = $'
msgN DB 'N = $'
msgRes DB 'RESULTADO = $'

A DD 100.0
B DD 40.0
C DD 90.0
D DD 6.0
N DD 3.0
resultado DD 0.0

txtResultado DB 10 DUP(0)

.CODE

INICIO:
    MOV AX, DATA
    MOV DS, AX
    MOV ES, AX

MENU_FORM:
    LIMPIAR_PANTALLA

    IMP_COLOR tituloFormulario,45,0,0,2,15,1FH
    IMP_COLOR subtituloVideo,58,0,0,4,8,0AH
    IMP_COLOR subtituloEntrev,58,0,0,5,8,0AH

    IMP_COLOR menu1,45,0,0,8,15,0EH
    IMP_COLOR menu2,45,0,0,9,15,0EH
    IMP_COLOR menu3,45,0,0,10,15,0EH
    IMP_COLOR menu4,45,0,0,11,15,0EH
    IMP_COLOR menu5,45,0,0,12,15,0EH
    IMP_COLOR menu6,45,0,0,13,15,0EH
    IMP_COLOR menu7,45,0,0,14,15,0EH

    IMP_COLOR menuSel,45,0,0,16,15,0FH

TECLA_FORM:
    CURSOR 16,35,0
    RASTREO

    CMP AL,'1'
    JE OP_ENERGIA
    CMP AL,'2'
    JE OP_RESTA
    CMP AL,'3'
    JE OP_ABS
    CMP AL,'4'
    JE OP_SIGNO
    CMP AL,'5'
    JE OP_SQRT
    CMP AL,'6'
    JE OP_SCALE
    CMP AL,'7'
    JE FIN

    JMP TECLA_FORM

; (A * B) + (C / D)
OP_ENERGIA:
    FLD A
    FLD B
    FMUL             ; ST0 = A*B

    FLD C
    FLD D
    FDIV             ; ST0 = C/D

    FADD             ; ST0 = (A*B) + (C/D)
    FSTP resultado

    JMP MOSTRAR

; (A - B)
OP_RESTA:
    FLD A
    FSUB B
    FSTP resultado
    JMP MOSTRAR

; ABS(A - B)
OP_ABS:
    FLD A
    FSUB B
    FABS
    FSTP resultado
    JMP MOSTRAR

; -A
OP_SIGNO:
    FLD A
    FCHS
    FSTP resultado
    JMP MOSTRAR

; SQRT(A)
OP_SQRT:
    FLD A
    FSQRT
    FSTP resultado
    JMP MOSTRAR

; A * 2^N
OP_SCALE:
    FLD A      ; ST0 = A
    FLD N      ; ST0 = N, ST1 = A
    FXCH       ; ST0 = A, ST1 = N
    FSCALE     ; ST0 = A * 2^int(N)
    FSTP resultado
    FSTP ST(0)
    JMP MOSTRAR

MOSTRAR:
    LIMPIAR_PANTALLA
    IMP_COLOR msgRes,12,0,0,10,20,0FH

    LEA DI, txtResultado
    MOV AX, WORD PTR resultado
    CALL convertirDecimal

    IMP_COLOR txtResultado,10,0,0,10,33,0AH

    CURSOR 23,2,0
    RASTREO
    JMP MENU_FORM

FIN:
    MOV AX,4C00H
    INT 21H

END INICIO
