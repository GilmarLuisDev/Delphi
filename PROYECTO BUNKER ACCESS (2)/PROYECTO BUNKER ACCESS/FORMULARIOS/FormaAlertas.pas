unit FormaAlertas;

interface

uses UnitBaseViewer, Vcl.Forms, System.Classes;

type
  TForma_Alertas = class(TBaseViewerForm)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Forma_Alertas: TForma_Alertas;

implementation

constructor TForma_Alertas.Create(AOwner: TComponent);
begin
  inherited;
  TrailerURL := 'https://github.com/GilmarLuisDev/Delphi';
  EntrevistaURL := 'https://youtu.be/REEMPLAZA_ENTREVISTA';
  BuildUI('Alertas / Bitácora reingreso', '..\\IMAGENES\\Alertas.jpeg',
    '..\\..\\BunkerAccessU3\\BUNKER ACCESS\\GILMAR GALLAGA\\BitacoraReingreso.txt');
end;

end.
