program DPFactoryMethod;

uses
  Forms,
  View.Principal in 'View.Principal.pas' {frmCalcJuros},
  Model.Product in '..\Model\Model.Product.pas',
  Controller.Interfaces in '..\Controller\Controller.Interfaces.pas',
  Controller.ConcreteProduct in '..\Controller\Controller.ConcreteProduct.pas',
  Controller.ConcreteInterfaces in '..\Controller\Controller.ConcreteInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCalcJuros, frmCalcJuros);
  Application.Run;
end.
