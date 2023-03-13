unit Model.Strategy.Interfaces;

interface

type
  IStrategy = interface
   function ExportDoc(const PathFile: string; const GeraDoc: string): Boolean;
  end;

implementation

end.
