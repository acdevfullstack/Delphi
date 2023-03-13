program API_BolsaCambio;

uses
  Vcl.Forms,
  uAPI_BolsaCambio in 'uAPI_BolsaCambio.pas' {frmcambiomoedascryptoativos},
  srv.RESTClient in '..\Services\srv.RESTClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmcambiomoedascryptoativos, frmcambiomoedascryptoativos);
  Application.Run;
end.
