unit UnitBaseViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Winapi.ShellAPI;

type
  TBaseViewerForm = class(TForm)
  private
    FBackground: TImage;
    FMemo: TMemo;
    FTitle: TLabel;
    FTrailerBtn: TButton;
    FEntrevistaBtn: TButton;
    FTrailerURL: string;
    FEntrevistaURL: string;
    procedure OpenURL(const AURL: string);
    procedure OnTrailerClick(Sender: TObject);
    procedure OnEntrevistaClick(Sender: TObject);
  protected
    procedure BuildUI(const ATitle, ABackgroundImage, ATextFile: string);
  public
    property TrailerURL: string read FTrailerURL write FTrailerURL;
    property EntrevistaURL: string read FEntrevistaURL write FEntrevistaURL;
  end;

implementation

procedure TBaseViewerForm.BuildUI(const ATitle, ABackgroundImage, ATextFile: string);
begin
  Width := 1024;
  Height := 600;
  Position := poScreenCenter;
  Caption := ATitle;

  FBackground := TImage.Create(Self);
  FBackground.Parent := Self;
  FBackground.Align := alClient;
  FBackground.Stretch := True;
  if FileExists(ABackgroundImage) then
    FBackground.Picture.LoadFromFile(ABackgroundImage);

  FTitle := TLabel.Create(Self);
  FTitle.Parent := Self;
  FTitle.Caption := ATitle;
  FTitle.Font.Size := 20;
  FTitle.Font.Style := [fsBold];
  FTitle.Font.Color := clWhite;
  FTitle.Left := 24;
  FTitle.Top := 16;
  FTitle.Transparent := True;

  FMemo := TMemo.Create(Self);
  FMemo.Parent := Self;
  FMemo.Left := 24;
  FMemo.Top := 70;
  FMemo.Width := 620;
  FMemo.Height := 430;
  FMemo.ReadOnly := True;
  FMemo.ScrollBars := ssVertical;
  FMemo.Color := $00212121;
  FMemo.Font.Color := clLime;
  if FileExists(ATextFile) then
    FMemo.Lines.LoadFromFile(ATextFile)
  else
    FMemo.Lines.Text := 'No se encontró: ' + ATextFile;

  FTrailerBtn := TButton.Create(Self);
  FTrailerBtn.Parent := Self;
  FTrailerBtn.Caption := 'Ver Trailer';
  FTrailerBtn.Left := 700;
  FTrailerBtn.Top := 120;
  FTrailerBtn.Width := 220;
  FTrailerBtn.OnClick := OnTrailerClick;

  FEntrevistaBtn := TButton.Create(Self);
  FEntrevistaBtn.Parent := Self;
  FEntrevistaBtn.Caption := 'Ver Entrevista';
  FEntrevistaBtn.Left := 700;
  FEntrevistaBtn.Top := 170;
  FEntrevistaBtn.Width := 220;
  FEntrevistaBtn.OnClick := OnEntrevistaClick;
end;

procedure TBaseViewerForm.OpenURL(const AURL: string);
begin
  if AURL <> '' then
    ShellExecute(Handle, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL);
end;

procedure TBaseViewerForm.OnTrailerClick(Sender: TObject);
begin
  OpenURL(FTrailerURL);
end;

procedure TBaseViewerForm.OnEntrevistaClick(Sender: TObject);
begin
  OpenURL(FEntrevistaURL);
end;

end.
