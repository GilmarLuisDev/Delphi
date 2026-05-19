unit FORMA_PRINCIPAL;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, System.Classes, FormaDirectorio, FormaAlertas, FormaDevice;

type
  TFormaPrincipal = class(TForm)
  private
    BtnDirectorio, BtnAlertas, BtnDevice: TButton;
    procedure OpenDirectorio(Sender: TObject);
    procedure OpenAlertas(Sender: TObject);
    procedure OpenDevice(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FormaPrincipal: TFormaPrincipal;

implementation

constructor TFormaPrincipal.Create(AOwner: TComponent);
begin
  inherited;
  Width := 520;
  Height := 280;
  Position := poScreenCenter;
  Caption := 'BUNKER ACCESS - Formularios Delphi';

  BtnDirectorio := TButton.Create(Self);
  BtnDirectorio.Parent := Self;
  BtnDirectorio.Caption := 'Abrir Directorio/TXT';
  BtnDirectorio.SetBounds(40, 40, 200, 40);
  BtnDirectorio.OnClick := OpenDirectorio;

  BtnAlertas := TButton.Create(Self);
  BtnAlertas.Parent := Self;
  BtnAlertas.Caption := 'Abrir Alertas/TXT';
  BtnAlertas.SetBounds(40, 100, 200, 40);
  BtnAlertas.OnClick := OpenAlertas;

  BtnDevice := TButton.Create(Self);
  BtnDevice.Parent := Self;
  BtnDevice.Caption := 'Abrir Device/TXT';
  BtnDevice.SetBounds(40, 160, 200, 40);
  BtnDevice.OnClick := OpenDevice;
end;

procedure TFormaPrincipal.OpenDirectorio(Sender: TObject);
var
  F: TForma_Directorio;
begin
  F := TForma_Directorio.Create(Self);
  F.Show;
end;

procedure TFormaPrincipal.OpenAlertas(Sender: TObject);
var
  F: TForma_Alertas;
begin
  F := TForma_Alertas.Create(Self);
  F.Show;
end;

procedure TFormaPrincipal.OpenDevice(Sender: TObject);
var
  F: TForma_Device;
begin
  F := TForma_Device.Create(Self);
  F.Show;
end;

end.
