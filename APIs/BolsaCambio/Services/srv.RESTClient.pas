unit srv.RESTClient;

interface

uses
  System.SysUtils, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON;

type
  TMyRESTClient = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

  public
    constructor Create(aURL: string);
    function Get: string;

end;

implementation

constructor TMyRESTClient.Create(aURL: string);
begin
  FRESTClient := TRESTClient.Create(nil);
  FRESTClient.BaseURL := aURL;
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Method := TRESTRequestMethod.rmGET;
  FRESTRequest.Client := FRESTClient;
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest.Response := FRESTResponse;
end;

function TMyRESTClient.Get: string;
begin
  try
    FRESTRequest.Execute;
    if FRESTResponse.StatusCode = 200 then
      Result := FRESTResponse.Content
    else
      raise Exception.CreateFmt('A chamada da API falhou com o código de status %d', [FRESTResponse.StatusCode]);
  except
    on E: Exception do
      raise Exception.CreateFmt('Erro ao executar a chamada da API: %s', [E.Message]);
  end;
end;

end.
