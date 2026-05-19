# Formularios Delphi + Pantallas EMU

## Estilo visual (como el programa principal)
Sí se dejó preparado con **interfaz basada en imágenes** para Delphi:
- Cada formulario usa imagen de fondo desde `../IMAGENES/`.
- Encima se muestra el contenido TXT correspondiente.
- Incluye botones para abrir Trailer y Entrevista.

## Rutas que solo debes reemplazar
En los formularios Delphi (`*.pas`) ya está todo armado:
- `TrailerURL := 'https://github.com/GilmarLuisDev/Delphi'`
- `EntrevistaURL := 'https://youtu.be/REEMPLAZA_ENTREVISTA'`

Solo cambia la URL de entrevista por la final.

## Formularios Delphi creados
- `FORMA_PRINCIPAL.pas` (menú principal de acceso a formularios).
- `FormaDirectorio.pas` (visualiza `ReporteExterior.txt`).
- `FormaAlertas.pas` (visualiza `BitacoraReingreso.txt`).
- `FormaDevice.pas` (visualiza `ChequeoMedico.txt`).
- `UnitBaseViewer.pas` (base reutilizable: imagen + memo + botones de video).

## Pantallas EMU enlazadas
- `AcercaDeBunkerAccess.asm` (equipo + correos institucionales + trailer/entrevista).
- `InfoBunkerAccess.asm` (información del proyecto + trailer/entrevista).
- `CoprocesadorProyecto.asm` (ejercicios del coprocesador + demos extras).
- `LanzadorEmuProyecto.asm` (`#start=` para correr desde EMU8086).

## Requisitos cubiertos
- Formularios Delphi para visualizar archivos TXT asignados ✅
- Ejecutable de `Win32/Debug` eliminado del repo ✅
- Pantalla AcercaDe con equipo y correos ✅
- Pantallas EMU enlazadas para ejecución ✅
- Trailer y entrevista integrados con reemplazo de URL ✅
- Formulario de coprocesador con fórmulas complejas e instrucciones x87 ✅
