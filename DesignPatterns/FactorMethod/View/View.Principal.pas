unit View.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;   

type
  TfrmCalcJuros = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    LabelPrazoPagamento: TLabel;
    LabelQtdeParcelas: TLabel;
    LabelValor: TLabel;
    cbxQtdeParc: TComboBox;
    cbxPrazoPG: TComboBox;
    edtvrlatual: TEdit;
    btnProcessar: TBitBtn;
    btnSair: TBitBtn;
    mmolog: TMemo;
    procedure edtvrlatualKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    function validacampos: Boolean;

  end;

var
  frmCalcJuros: TfrmCalcJuros;

implementation

uses
  Model.Product, Controller.Interfaces, Controller.ConcreteInterfaces;

{$R *.dfm}

procedure TfrmCalcJuros.edtvrlatualKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #44]) then
    Key := #0;
end;

procedure TfrmCalcJuros.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

function TfrmCalcJuros.validacampos: Boolean;
begin
  if (Length(edtvrlatual.Text) < 1)
    or
    (cbxQtdeParc.ItemIndex < 0)
    or
    (cbxPrazoPG.ItemIndex < 0)
    then
    begin
      if Length(edtvrlatual.Text) < 1
      then
        MessageDlg('Digite valor atual.', mtInformation, [mbOK], 0);


    if cbxQtdeParc.ItemIndex < 0
    then
    begin
      MessageDlg('Selecione a quantidade de parcelas.', mtInformation, [mbOK], 0);
      cbxQtdeParc.DroppedDown := True;
    end;

    if cbxPrazoPG.ItemIndex < 0
    then
    begin
      MessageDlg('Selecione o prazo de pagamento.', mtInformation, [mbOK], 0);
      cbxPrazoPG.DroppedDown := True;
    end;

    Result:= False;
  end
  else
    Result:= True;

end;

procedure TfrmCalcJuros.btnProcessarClick(Sender: TObject);
var
  FabricaPrazos: IFactoryMethod;
  TipoPrazo: ITipoPrazo;
  Valor: real;
  QtdeParcelas: integer;
begin
  if validacampos
  then
  begin
    // cria a fábrica (Factory Method)
    FabricaPrazos := TFabricaPrazos.Create;
    // retorna um objeto de tipo de prazo de acordo com o tipo de prazo
    TipoPrazo := FabricaPrazos.ConsultarPrazo(cbxPrazoPG.Text);

    // alimenta as variáveis
    Valor := StrToFloatDef(edtvrlatual.Text, 0);
    QtdeParcelas := StrToIntDef(cbxQtdeParc.Text, 0);

    // consulta o conteúdo do tipo de prazo retornado pela fábrica
    mmolog.Lines.Clear;
    mmolog.Lines.Add(TipoPrazo.ConsultarDescricao);
    mmolog.Lines.Add(TipoPrazo.ConsultarJuros);
    mmolog.Lines.Add(TipoPrazo.ConsultarCalc(Valor, QtdeParcelas));
    mmolog.Lines.Add(TipoPrazo.ConsultarTotal);
  end;
end;

end.
