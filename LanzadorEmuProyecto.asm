; Lanzador de pantallas para EMU8086
#start=AcercaDeBunkerAccess.exe#
#start=InfoBunkerAccess.exe#
#start=CoprocesadorProyecto.exe#

.MODEL SMALL
.STACK
.DATA
msj1 DB 'Lanzador EMU: compila y ejecuta las pantallas desde EMU8086.$'
msj2 DB 13,10,'1) AcercaDeBunkerAccess.asm'
msj3 DB 13,10,'2) InfoBunkerAccess.asm'
msj4 DB 13,10,'3) CoprocesadorProyecto.asm$'
.CODE
INICIO:
 MOV AX,@DATA
 MOV DS,AX
 MOV AH,9
 LEA DX,msj1
 INT 21H
 MOV AH,9
 LEA DX,msj2
 INT 21H
 MOV AX,4C00H
 INT 21H
END INICIO
