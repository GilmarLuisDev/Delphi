unit FormaDirectorio;

interface

uses UnitBaseViewer, Vcl.Forms, System.Classes;

type
  TForma_Directorio = class(TBaseViewerForm)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Forma_Directorio: TForma_Directorio;

implementation

constructor TForma_Directorio.Create(AOwner: TComponent);
begin
  inherited;
  TrailerURL := 'https://github.com/GilmarLuisDev/Delphi';
  EntrevistaURL := 'https://youtu.be/REEMPLAZA_ENTREVISTA';
  BuildUI('Directorio y reportes (TXT)', '..\\IMAGENES\\Directorios.jpeg',
    '..\\..\\BunkerAccessU3\\BUNKER ACCESS\\GILMAR GALLAGA\\ReporteExterior.txt');
end;

end.
