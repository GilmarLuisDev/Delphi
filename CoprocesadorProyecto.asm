;============================================================
; EJERCICIOS COPROCESADOR MATEMATICO - TEMA 4
; Uso enfocado en: FLD, FMUL, FSUB, FADD, FDIV, FSTP
; FLD = PUSH en pila FPU, FSTP = POP en pila FPU
;============================================================

INCLUDE Biblioteca_5D.lib

.MODEL SMALL
.STACK

.DATA

tituloFormulario DB '   EJERCICIOS COPROCESADOR (FLD/FSTP)   '
subtituloVideo   DB 'TRAILER: https://github.com/GilmarLuisDev/Delphi'
subtituloEntrev  DB 'ENTREVISTA: youtu.be/COLOCA_AQUI_ENLACE'
notaPushPop      DB 'NOTA: FLD=PUSH  |  FSTP=POP             '

menu1 DB '[1] 13ab + 2ab                                '
menu2 DB '[2] 7a - 13b - 11 + 20a - 4 - 3b             '
menu3 DB '[3] (x^4 y^3)(2xy)                            '
menu4 DB '[4] 5(-4r^2 s^2)(3r^2 s^3)                    '
menu5 DB '[5] -4(9a-5b)(a+3b)                           '
menu6 DB '[6] (3r-2s)(3r+2s)                            '
menu7 DB '[7] (a^3+3-a-3a^2)/(a-2)                      '
menu8 DB '[8] (x^3-27)/(x-3)                            '
menu9 DB '[9] (3/5)x^2y^3 - (1/10)x^2y^3                '
menuA DB '[A] DEMO FABS: |a-b|                           '
menuB DB '[B] DEMO FSQRT: sqrt(x^2+y^2)                  '
menuC DB '[C] DEMO FSCALE/FCHS: -(a*2^b)                '
menu0 DB '[0] SALIR                                     '
menuSel DB 'SELECCIONA OPCION:                            '

msgRes DB 'RESULTADO = $'

; variables base ejemplo
A DD 4.0
B DD 2.0
X DD 3.0
Y DD 2.0
R DD 2.0
S DD 1.0

K13 DD 13.0
K2  DD 2.0
K7  DD 7.0
K11 DD 11.0
K20 DD 20.0
K4  DD 4.0
K3  DD 3.0
K5  DD 5.0
K9  DD 9.0
K27 DD 27.0
K35 DD 0.6      ; 3/5
K110 DD 0.1     ; 1/10
K0   DD -1.0

resultado DD 0.0
term1 DD 0.0
term2 DD 0.0
term3 DD 0.0
num DD 0.0
den DD 0.0

txtResultado DB 10 DUP(0)

.CODE

INICIO:
    MOV AX, DATA
    MOV DS, AX
    MOV ES, AX

MENU_FORM:
    LIMPIAR_PANTALLA
    IMP_COLOR tituloFormulario,43,0,0,2,15,1FH
    IMP_COLOR subtituloVideo,58,0,0,4,8,0AH
    IMP_COLOR subtituloEntrev,58,0,0,5,8,0AH
    IMP_COLOR notaPushPop,43,0,0,6,15,0EH

    IMP_COLOR menu1,46,0,0,8,15,0EH
    IMP_COLOR menu2,46,0,0,9,15,0EH
    IMP_COLOR menu3,46,0,0,10,15,0EH
    IMP_COLOR menu4,46,0,0,11,15,0EH
    IMP_COLOR menu5,46,0,0,12,15,0EH
    IMP_COLOR menu6,46,0,0,13,15,0EH
    IMP_COLOR menu7,46,0,0,14,15,0EH
    IMP_COLOR menu8,46,0,0,15,15,0EH
    IMP_COLOR menu9,46,0,0,16,15,0EH
    IMP_COLOR menuA,46,0,0,17,15,0EH
    IMP_COLOR menuB,46,0,0,18,15,0EH
    IMP_COLOR menuC,46,0,0,19,15,0EH
    IMP_COLOR menu0,46,0,0,20,15,0EH
    IMP_COLOR menuSel,46,0,0,22,15,0FH

TECLA_FORM:
    CURSOR 22,36,0
    RASTREO
    CMP AL,'1'
    JE E1
    CMP AL,'2'
    JE E2
    CMP AL,'3'
    JE E3
    CMP AL,'4'
    JE E4
    CMP AL,'5'
    JE E5
    CMP AL,'6'
    JE E6
    CMP AL,'7'
    JE E7
    CMP AL,'8'
    JE E8
    CMP AL,'9'
    JE E9
    CMP AL,'A'
    JE EA
    CMP AL,'a'
    JE EA
    CMP AL,'B'
    JE EB
    CMP AL,'b'
    JE EB
    CMP AL,'C'
    JE EC
    CMP AL,'c'
    JE EC
    CMP AL,'0'
    JE FIN
    JMP TECLA_FORM

; 13ab + 2ab
E1:
    FLD A
    FMUL B
    FMUL K13
    FSTP term1

    FLD A
    FMUL B
    FMUL K2
    FADD term1
    FSTP resultado
    JMP MOSTRAR

; 7a - 13b - 11 + 20a - 4 - 3b
E2:
    FLD A
    FMUL K7
    FSTP term1

    FLD B
    FMUL K13
    FSTP term2

    FLD A
    FMUL K20
    FSTP term3

    FLD term1
    FSUB term2
    FSUB K11
    FADD term3
    FSUB K4
    FLD B
    FMUL K3
    FSUB
    FSTP resultado
    JMP MOSTRAR

; (x^4 y^3)(2xy)
E3:
    FLD X
    FMUL X
    FMUL X
    FMUL X
    FMUL Y
    FMUL Y
    FMUL Y
    FSTP term1

    FLD K2
    FMUL X
    FMUL Y
    FMUL term1
    FSTP resultado
    JMP MOSTRAR

; 5(-4r^2 s^2)(3r^2 s^3)
E4:
    FLD R
    FMUL R
    FMUL S
    FMUL S
    FMUL K4
    FSTP term1

    FLD R
    FMUL R
    FMUL S
    FMUL S
    FMUL S
    FMUL K3
    FSTP term2

    FLD term1
    FMUL term2
    FMUL K5
    FMUL K0
    FSTP resultado
    JMP MOSTRAR

; -4(9a-5b)(a+3b)
E5:
    FLD A
    FMUL K9
    FSTP term1
    FLD B
    FMUL K5
    FSTP term2
    FLD term1
    FSUB term2
    FSTP term1

    FLD B
    FMUL K3
    FADD A
    FSTP term2

    FLD term1
    FMUL term2
    FMUL K4
    FMUL K0
    FSTP resultado
    JMP MOSTRAR

; (3r-2s)(3r+2s)
E6:
    FLD R
    FMUL K3
    FSTP term1
    FLD S
    FMUL K2
    FSTP term2

    FLD term1
    FSUB term2
    FSTP term3

    FLD term1
    FADD term2
    FMUL term3
    FSTP resultado
    JMP MOSTRAR

; (a^3+3-a-3a^2)/(a-2)
E7:
    FLD A
    FMUL A
    FMUL A
    FADD K3
    FSUB A
    FLD A
    FMUL A
    FMUL K3
    FSUB
    FSTP num

    FLD A
    FSUB K2
    FSTP den

    FLD num
    FDIV den
    FSTP resultado
    JMP MOSTRAR

; (x^3-27)/(x-3)
E8:
    FLD X
    FMUL X
    FMUL X
    FSUB K27
    FSTP num

    FLD X
    FSUB K3
    FSTP den

    FLD num
    FDIV den
    FSTP resultado
    JMP MOSTRAR


; FABS demo |a-b|
EA:
    FLD A
    FSUB B
    FABS
    FSTP resultado
    JMP MOSTRAR

; FSQRT demo sqrt(x^2+y^2)
EB:
    FLD X
    FMUL X
    FLD Y
    FMUL Y
    FADD
    FSQRT
    FSTP resultado
    JMP MOSTRAR

; FSCALE + FCHS demo  -(a*2^b)
EC:
    FLD A
    FLD B
    FXCH
    FSCALE
    FCHS
    FSTP resultado
    FSTP ST(0)
    JMP MOSTRAR

; (3/5)x^2y^3 - (1/10)x^2y^3
E9:
    FLD X
    FMUL X
    FMUL Y
    FMUL Y
    FMUL Y
    FSTP term1

    FLD term1
    FMUL K35
    FSTP term2

    FLD term1
    FMUL K110
    FSTP term3

    FLD term2
    FSUB term3
    FSTP resultado
    JMP MOSTRAR

MOSTRAR:
    LIMPIAR_PANTALLA
    IMP_COLOR msgRes,12,0,0,11,20,0FH
    LEA DI, txtResultado
    MOV AX, WORD PTR resultado
    CALL convertirDecimal
    IMP_COLOR txtResultado,10,0,0,11,33,0AH
    CURSOR 23,2,0
    RASTREO
    JMP MENU_FORM

FIN:
    MOV AX,4C00H
    INT 21H

END INICIO
