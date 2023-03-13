unit uAPI_BolsaCambio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

  const
    ABaseUrl = 'https://economia.awesomeapi.com.br';
    AResource = '/last/';
    ACabecalho = '******* Cambio - Moedas e CryptoAtivos *******';

type
  Tfrmcambiomoedascryptoativos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cbxMoedaCryptoAtivos: TComboBox;
    btnPesquisar: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    mmlog: TMemo;
    procedure btnPesquisarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function RemoverTracos(const Str: string): string;
    function Moedas_CryptoAtivos: string;
    procedure retornoapi;

  end;

var
  frmcambiomoedascryptoativos: Tfrmcambiomoedascryptoativos;

implementation

uses
  srv.RESTClient, System.JSON;

{$R *.dfm}

procedure Tfrmcambiomoedascryptoativos.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmcambiomoedascryptoativos.btnPesquisarClick(Sender: TObject);
begin
  retornoapi;
end;

function Tfrmcambiomoedascryptoativos.Moedas_CryptoAtivos: string;
var
  i: Integer;
  selectItems: string;
begin
  selectItems := '';
  for i := 0 to cbxMoedaCryptoAtivos.Items.Count - 1 do
  begin
    if cbxMoedaCryptoAtivos.Items[i] <> 'TODAS' then
    begin
      if selectItems <> '' then
        selectItems := selectItems + ',';
      selectItems  := selectItems + cbxMoedaCryptoAtivos.Items[i];
    end;
  end;

  Result:= selectItems;
end;

function Tfrmcambiomoedascryptoativos.RemoverTracos(const Str: string): string;
var
  i: Integer;
begin
  Result := Str;
  for i := Length(Result) downto 1 do
  begin
    if Result[i] = '-' then
      Delete(Result, i, 1);
  end;

end;

procedure Tfrmcambiomoedascryptoativos.retornoapi;
var
  MyRESTC: TMyRESTClient;
  Vrl_Cambio: Double;
  ResponseJSON, VrlCambioJSON: TJSONObject;
  BidValue : string;
  i : integer;

begin
  try
    try
      if mmlog.Text <> EmptyStr then mmlog.Clear;

      if cbxMoedaCryptoAtivos.Text = EmptyStr then
      begin
        MessageDlg('Campo Moeda e CryptoAtivos em Branco! ', mtInformation, [mbOK], 0);
        Abort;
      end;

      if cbxMoedaCryptoAtivos.Text <> 'TODAS'
      then
        MyRESTC := TMyRESTClient.Create(ABaseUrl + AResource + cbxMoedaCryptoAtivos.Text)
      else
        MyRESTC := TMyRESTClient.Create(ABaseUrl + AResource + Moedas_CryptoAtivos);

      ResponseJSON := TJSONObject.ParseJSONValue(MyRESTC.Get) as TJSONObject;
      if cbxMoedaCryptoAtivos.Text = 'TODAS' then
      begin
        mmlog.Lines.Add(ACabecalho);
        mmlog.Lines.Add('');
        for i := 0 to cbxMoedaCryptoAtivos.Items.Count - 1 do
        begin
          if cbxMoedaCryptoAtivos.Items[i] <> 'TODAS'
            then
            begin
              VrlCambioJSON:= ResponseJSON.GetValue(RemoverTracos(cbxMoedaCryptoAtivos.Items[i])) as TJSONObject;
              mmlog.Lines.Add(cbxMoedaCryptoAtivos.Items[i] + ' : '+ VrlCambioJSON.GetValue('bid').Value);
            end;
        end;
      end
      else
      begin
        mmlog.Lines.Add(ACabecalho);
        mmlog.Lines.Add('');
        VrlCambioJSON:= ResponseJSON.GetValue(RemoverTracos(cbxMoedaCryptoAtivos.Text)) as TJSONObject;
        mmlog.Lines.Add(cbxMoedaCryptoAtivos.Text + ' : '+ VrlCambioJSON.GetValue('bid').Value);
      end;
    except
      on E: Exception do
      begin
        MessageDlg(MyRESTC.Get, TMsgDlgType.mtError, [mbOK], 0);
        Exit;
      end;

    end;
  finally
     MyRESTC.Free;
  end;

end;

end.
