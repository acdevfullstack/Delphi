unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit, System.JSON, REST.Types;

type
  TFrmPrincipal = class(TForm)
    TabControl: TTabControl;
    TabLista: TTabItem;
    TabCadastro: TTabItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    imgAdd: TImage;
    lvClientes: TListView;
    rectToolbar: TRectangle;
    lblTitulo: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEmail: TEdit;
    Label4: TLabel;
    edtFone: TEdit;
    imgExcluir: TImage;
    imgVoltar: TImage;
    imgSalvar: TImage;
    lblIdCliente: TLabel;
    procedure imgAddClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvClientesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure imgExcluirClick(Sender: TObject);
    procedure lvClientesPullRefresh(Sender: TObject);
  private
    procedure AddClienteLV(id_cliente: integer; nome, email, fone: string);
    procedure GET_Clientes;
    procedure ProcessarGET;
    procedure ProcessarGETErro(Sender: TObject);
    function POST_PUT_Clientes(verbo: TRestRequestMethod; id_cliente: integer;
      nome, email, fone: string; out erro: string): boolean;
    function DELETE_Clientes(id_cliente: integer; out erro: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitDM;

{--- GET ---}

procedure TFrmPrincipal.ProcessarGET;
var
    json : string;
    arrayClientes : TJsonArray;
    i : integer;
begin
    if dm.ReqClienteGet.Response.StatusCode  <> 200 then
    begin
        showmessage('Ocorreu um erro na consulta: ' +
        dm.ReqClienteGet.Response.StatusCode.ToString);
    end;

    try
        lvClientes.BeginUpdate;

        json := dm.ReqClienteGet.Response.JSONValue.ToString;
        arrayClientes := TJSONObject.ParseJSONValue(
                          TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;

        for i := 0 to arrayClientes.Size - 1 do
            AddClienteLV(arrayClientes.Get(i).GetValue<integer>('idCliente', 0),
                         arrayClientes.Get(i).GetValue<string>('nome', ''),
                         arrayClientes.Get(i).GetValue<string>('email', ''),
                         arrayClientes.Get(i).GetValue<string>('fone', ''));

        arrayClientes.DisposeOf;

    finally
        lvClientes.EndUpdate;
    end;
end;

procedure TFrmPrincipal.ProcessarGETErro(Sender: TObject);
begin
    if Assigned(Sender) and (Sender is Exception) then
        showmessage(Exception(Sender).Message);
end;

procedure TFrmPrincipal.GET_Clientes;
begin
    lvClientes.Items.Clear;

    try
        dm.ReqClienteGet.ExecuteAsync(ProcessarGET, true, true, ProcessarGETErro);
    except on ex:exception do
        showmessage('Erro ao acessar o servidor: ' + ex.Message);
    end;
end;

{--- POST / PUT ---}
function TFrmPrincipal.POST_PUT_Clientes(verbo: TRestRequestMethod;
                                         id_cliente: integer;
                                         nome, email, fone: string;
                                         out erro: string): boolean;
var
    jsonBody : TJSONObject;
begin
    try
        try
            Result := false;
            erro := '';

            jsonBody := TJSONObject.Create;
            jsonBody.AddPair('nome', nome);
            jsonBody.AddPair('email', email);
            jsonBody.AddPair('fone', fone);

            if verbo = rmPUT then
                jsonBody.AddPair('id_cliente', id_cliente.ToString);


            dm.ReqClientePostPut.Params.Clear;
            dm.ReqClientePostPut.Body.ClearBody;
            dm.ReqClientePostPut.Method := verbo; // POST ou PUT
            dm.ReqClientePostPut.Body.Add(jsonBody.ToString,
                                          ContentTypeFromString('application/json'));
            dm.ReqClientePostPut.Execute;

            // Tratar retorno...
            if (dm.ReqClientePostPut.Response.StatusCode  <> 200) and
               (dm.ReqClientePostPut.Response.StatusCode  <> 201) then
            begin
                erro := 'Erro ao salvar dados: ';
                exit;
            end;

            Result := true;

        except on ex:exception do
                erro := 'Ocorreu um erro: ' + ex.Message;
        end;
    finally
        jsonBody.DisposeOf;
    end;
end;


{--- DELETE ---}
function TFrmPrincipal.DELETE_Clientes(id_cliente: integer;
                                       out erro: string): boolean;
begin
    try
        Result := false;
        erro := '';

        dm.ReqClienteDelete.Resource := 'cliente/' + id_cliente.ToString;
        dm.ReqClienteDelete.Execute;

        // Tratar retorno...
        if (dm.ReqClienteDelete.Response.StatusCode  <> 200) then
        begin
            erro := 'Erro ao excluir dados: ';
            exit;
        end;

        Result := true;

    except on ex:exception do
        erro := 'Ocorreu um erro: ' + ex.Message;
    end;
end;

procedure TFrmPrincipal.AddClienteLV(id_cliente: integer;
                                     nome, email, fone : string);
begin
    with lvClientes.Items.Add do
    begin
        Height := 50;
        Tag := id_cliente;

        TListItemText(Objects.FindDrawable('TxtNome')).Text := nome;
        TListItemText(Objects.FindDrawable('TxtEmail')).Text := email;
        TListItemText(Objects.FindDrawable('TxtFone')).Text := fone;
    end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    TabControl.ActiveTab := TabLista;
    GET_Clientes;
end;

procedure TFrmPrincipal.imgAddClick(Sender: TObject);
begin
    imgExcluir.Visible := false;
    lblTitulo.Text := 'Novo Cliente';
    lblIdCliente.Text := '';
    edtNome.Text := '';
    edtEmail.Text := '';
    edtFone.Text := '';

    TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.imgExcluirClick(Sender: TObject);
var
    erro : string;
begin
    if NOT DELETE_Clientes(lblIdCliente.Text.ToInteger, erro) then
        showmessage(erro)
    else
    begin
        GET_Clientes;
        TabControl.GotoVisibleTab(0);
    end;
end;

procedure TFrmPrincipal.imgSalvarClick(Sender: TObject);
var
    erro : string;
    verbo : TRESTRequestMethod;
    idCliente : integer;
begin
    if lblIdCliente.Text = '' then // Inclusao
    begin
        verbo := rmPOST;
        idCliente := 0;
    end
    else  // Alteracao...
    begin
        verbo := rmPUT;
        idCliente := lblIdCliente.Text.ToInteger;
    end;

    if NOT POST_PUT_Clientes(verbo,
                             idCliente,
                             edtNome.Text,
                             edtEmail.Text,
                             edtFone.Text,
                             erro) then
        showmessage(erro)
    else
    begin
        GET_Clientes;
        TabControl.GotoVisibleTab(0);
    end;
end;

procedure TFrmPrincipal.imgVoltarClick(Sender: TObject);
begin
    TabControl.GotoVisibleTab(0);
end;

procedure TFrmPrincipal.lvClientesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    imgExcluir.Visible := true;
    lblTitulo.Text := 'Editar Cliente';
    lblIdCliente.Text := Aitem.Tag.ToString;
    edtNome.Text := TListItemText(Aitem.Objects.FindDrawable('TxtNome')).Text;
    edtEmail.Text := TListItemText(Aitem.Objects.FindDrawable('TxtEmail')).Text;
    edtFone.Text := TListItemText(Aitem.Objects.FindDrawable('TxtFone')).Text;

    TabControl.GotoVisibleTab(1);
end;

procedure TFrmPrincipal.lvClientesPullRefresh(Sender: TObject);
begin
    GET_Clientes;
end;


end.
