unit Model.Concrete.StrategyCSV;

interface

uses
  Model.Strategy.Interfaces;

type
  { Concrete Strategy - csv }
  TConcreteStrategyCSV = class(TInterfacedObject, IStrategy)
  private
    function ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
  public
    // Assinatura da Interface Strategy
    function ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;
  end;

implementation

uses
  Classes, SysUtils;

function TConcreteStrategyCSV.ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;
begin
  Result:= ValidaDoc(PathFile, GeraDoc);
end;

function TConcreteStrategyCSV.ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
begin
  try
    with TStringList.Create do
    begin
      Add(SaveDoc);
      SaveToFile(PathFile);
      Free;
      Result:= True;
    end;
    except
    on e : Exception do
    begin
      Result:= False;
      raise Exception.Create(e.Message);
    end;

  end;

end;

end.
