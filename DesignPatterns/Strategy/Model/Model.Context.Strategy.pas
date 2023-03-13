unit Model.Context.Strategy;

interface

uses
  Model.Strategy.Interfaces;

type
  TTipoDoc = (TXT, CSV, HTML);

  TContext = class
    private
      FStrategy : IStrategy;
    public
       function ExportDoc(const PathFile: string;  const TipoDoc: TTipoDoc; const GeraDoc: string): Boolean;
  end;

implementation

uses
  Model.Concrete.StrategyTXT, Model.Concrete.StrategyCSV,
  Model.Concrete.StrategyHTML;

function TContext.ExportDoc(const PathFile: string; const TipoDoc: TTipoDoc;
  const GeraDoc: string): Boolean;
begin
  case TipoDoc of
    TXT: FStrategy     := TConcreteStrategyTXT.Create;
    CSV: FStrategy     := TConcreteStrategyCSV.Create;
    HTML: FStrategy    := TConcreteStrategyHTML.Create;
  end;
  Result:= FStrategy.ExportDoc(PathFile, GeraDoc);
end;

end.

