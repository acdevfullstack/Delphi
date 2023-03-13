unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  Tdm = class(TDataModule)
    RESTCliente: TRESTClient;
    ReqClienteGet: TRESTRequest;
    ReqClientePostPut: TRESTRequest;
    ReqClienteDelete: TRESTRequest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
