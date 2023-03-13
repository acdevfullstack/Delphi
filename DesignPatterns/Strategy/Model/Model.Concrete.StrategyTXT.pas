unit Model.Concrete.StrategyTXT;

interface

uses
  Model.Strategy.Interfaces;

type
  { Concrete Strategy - TXT }
  TConcreteStrategyTXT = class(TInterfacedObject, IStrategy)
  private
    function ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
  public
    // Assinatura da Interface Strategy
    function ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;

  end;

implementation

uses
  Classes, SysUtils;

{ TConcreteStrategyTXT }

function TConcreteStrategyTXT.ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;
begin
  Result:= ValidaDoc(PathFile, GeraDoc);
end;

function TConcreteStrategyTXT.ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
var
 arq : TextFile;
begin
  try
    AssignFile(arq, PathFile);
    {$I-} // desativa a diretiva de Input
    ReWrite(arq);
    {$I+} // ativa a diretiva de Input
    WriteLn(arq, SaveDoc);
    CloseFile(arq);

    Result:= True;
    except
    on e : Exception do
    begin
      Result:= False;
      raise Exception.Create(e.Message);
    end;

  end;
end;

end.

