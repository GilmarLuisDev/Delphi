program FORMA_PRICIPAL;

uses
  Vcl.Forms,
  FORMA_PRINCIPAL in 'FORMULARIOS\FORMA_PRINCIPAL.pas' {FormaPrincipal},
  FormaDevice in 'FORMULARIOS\FormaDevice.pas' {Forma_Device},
  FormaAlertas in 'FORMULARIOS\FormaAlertas.pas' {Forma_Alertas},
  FormaDirectorio in 'FORMULARIOS\FormaDirectorio.pas' {Forma_Directorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormaPrincipal, FormaPrincipal);
  Application.CreateForm(TForma_Device, Forma_Device);
  Application.CreateForm(TForma_Alertas, Forma_Alertas);
  Application.CreateForm(TForma_Directorio, Forma_Directorio);
  Application.Run;
end.
