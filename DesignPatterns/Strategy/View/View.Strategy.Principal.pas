unit View.Strategy.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  Tfrmexportdoc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rgtipodoc: TRadioGroup;
    Panel5: TPanel;
    MoTexto: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtdirdocdestino: TEdit;
    edtnomearquivo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtnomearquivoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
     procedure gerarDocumento;
     function validacampos: Boolean;
     function returndirdocdestino : string;

  end;

var
  frmexportdoc: Tfrmexportdoc;

implementation

uses
  Model.Context.Strategy, View.Strategy.Principal;

{$R *.dfm}

procedure Tfrmexportdoc.FormCreate(Sender: TObject);
begin
   rgtipodoc.ItemIndex:= 0;
   edtdirdocdestino.Text:= returndirdocdestino;
end;

procedure Tfrmexportdoc.gerarDocumento;
var
  FContext  : TContext;
  TipoDoc   : TTipoDoc;
  PathFile  : string;
  statusdoc : Boolean;
begin
  try
    if validacampos then
    begin
      FContext:= TContext.Create;

      case rgtipodoc.ItemIndex of
         0: TipoDoc:= TXT;
         1: TipoDoc:= CSV;
         2: TipoDoc:= HTML;
      end;

     PathFile:= edtdirdocdestino.Text + '\' + edtnomearquivo.Text + '.' + LowerCase(rgtipodoc.Items[rgtipodoc.ItemIndex]);
     statusdoc := FContext.ExportDoc(PathFile, TipoDoc, MoTexto.Text);
     if statusdoc  then
        ShowMessage('Arquivo gerado com sucesso!')
     else
     ShowMessage('Arquivo não foi gerado');
    end
    else
    Abort;
  finally
    if FContext <> nil
      then FreeAndNil(FContext);

  end;

end;

function Tfrmexportdoc.returndirdocdestino: string;
var
  DirDocs : string;
begin
  DirDocs:= ExtractFileDir(GetCurrentDir) + '\Docs';

  if not DirectoryExists (DirDocs)
  then
    ForceDirectories(DirDocs);

  Result:= DirDocs;

end;

function Tfrmexportdoc.validacampos: Boolean;
begin
  Result:= false;
  if edtnomearquivo.Text = EmptyStr
  then
  begin
    ShowMessage('Campo nome arquivo em branco!');
    Exit;
  end
  else
  if MoTexto.Text = EmptyStr
  then
  begin
    ShowMessage('Campo Texto em branco!');
    Exit;
  end
  else
  Result:= True;
end;

procedure Tfrmexportdoc.edtnomearquivoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = VK_RETURN) or (Key = VK_TAB) then
   begin
      Key := 0;
      MoTexto.SetFocus;
   end;

  if not (Key in ['0'..'9', 'a'..'z', 'A'..'Z', '_' , #8, #44]) then
    Key := #0;  

end;

procedure Tfrmexportdoc.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate; 
end;

procedure Tfrmexportdoc.BitBtn2Click(Sender: TObject);
begin
  gerarDocumento;
end;

end.
