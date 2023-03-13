program ExportDoc.DesignPatterns.Strategy;

uses
  Forms,
  View.Strategy.Principal in 'View.Strategy.Principal.pas' {frmexportdoc},
  Model.Strategy.Interfaces in '..\Model\Model.Strategy.Interfaces.pas',
  Model.Context.Strategy in '..\Model\Model.Context.Strategy.pas',
  Model.Concrete.StrategyCSV in '..\Model\Model.Concrete.StrategyCSV.pas',
  Model.Concrete.StrategyHTML in '..\Model\Model.Concrete.StrategyHTML.pas',
  Model.Concrete.StrategyTXT in '..\Model\Model.Concrete.StrategyTXT.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmexportdoc, frmexportdoc);
  Application.Run;
end.
