unit Model.Concrete.StrategyHTML;

interface

uses
  Model.Strategy.Interfaces;

type
  { Concrete Strategy - HTML }
  TConcreteStrategyHTML = class(TInterfacedObject, IStrategy)
  private
    function ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
  public
    // Assinatura da Interface Strategy
    function ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;

  end;

implementation

uses
  Classes, SysUtils;

{ TConcreteStrategyHTML }

function TConcreteStrategyHTML.ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;
begin
  Result:= ValidaDoc(PathFile, GeraDoc);
end;

function TConcreteStrategyHTML.ValidaDoc(const PathFile: string; const SaveDoc: string): Boolean;
var
 arq : TextFile;
begin
  try
    AssignFile(arq, PathFile);
    {$I-} // desativa a diretiva de Input
    ReWrite(arq);
    {$I+} // ativa a diretiva de Input

    Writeln(Arq,'<p style="text-align:center">');
    Writeln(Arq,'<span style="font-size:16px">');
    Writeln(Arq,'<strong><span style="font-family:Verdana,Geneva,sans-serif">Documento Html</span></strong></span></p>');
    Writeln(Arq,'<p style="text-align:center"><span style="font-size:14px">');
    Writeln(Arq,'<span style="font-family:Verdana,Geneva,sans-serif">'+SaveDoc+'</span></span></p>');
    Writeln(Arq,'<p style="text-align:center">&nbsp;</p>');
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

