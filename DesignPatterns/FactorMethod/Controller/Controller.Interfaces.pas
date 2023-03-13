unit Controller.Interfaces;

interface

uses
  Model.Product;

type
  { Creator }
  IFactoryMethod = interface
    function ConsultarPrazo(const Prazo: string): ITipoPrazo;
  end;  

implementation

end.
