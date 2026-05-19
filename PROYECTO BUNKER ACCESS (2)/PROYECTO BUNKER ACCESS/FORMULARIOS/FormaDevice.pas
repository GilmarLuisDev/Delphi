unit FormaDevice;

interface

uses UnitBaseViewer, Vcl.Forms, System.Classes;

type
  TForma_Device = class(TBaseViewerForm)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  Forma_Device: TForma_Device;

implementation

constructor TForma_Device.Create(AOwner: TComponent);
begin
  inherited;
  TrailerURL := 'https://github.com/GilmarLuisDev/Delphi';
  EntrevistaURL := 'https://youtu.be/REEMPLAZA_ENTREVISTA';
  BuildUI('Dispositivos / Chequeo', '..\\IMAGENES\\Devices.jpeg',
    '..\\..\\BunkerAccessU3\\BUNKER ACCESS\\LUCIA GALINDO\\ChequeoMedico.txt');
end;

end.
