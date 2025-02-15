unit MonolitoFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MonolitoFinanceiro.View.CadastroPadrao,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    ToggleSwitchStatus: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Conexao, MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.Utilitarios;

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.dataSetUsuarios.Edit;

  edtNome.Text := dmUsuarios.dataSetUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.dataSetUsuarioslogin.AsString;
  edtSenha.Text := dmUsuarios.dataSetUsuariossenha.AsString;
  ToggleSwitchStatus.State := tssOn;
  if dmUsuarios.dataSetUsuariosstatus.AsString = 'B' then
    ToggleSwitchStatus.State := tssOff;

end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.dataSetUsuarios.Cancel;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente EXCLUIR o Registro?', 'Pergunta',MB_YESNO + MB_ICONQUESTION) <> mrYES then
  begin
    Exit;
  end;

  try
    dmUsuarios.dataSetUsuarios.Delete;
    dmUsuarios.dataSetUsuarios.ApplyUpdates(0);
    Application.MessageBox('O Registro foi Exclu�do com SUCESSO!', 'Aten��o', MB_OK + MB_ICONWARNING);
  except on E : Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao Excluir Registro', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.dataSetUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.dataSetUsuarios.Close;
  dmUsuarios.dataSetUsuarios.CommandText :=  'Select * from usuarios';
  dmUsuarios.dataSetUsuarios.Open;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus : String;
  Mensagem : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O Campo NOME n�o pode ser VAZIO!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O Campo LOGIN n�o pode ser VAZIO!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('O Campo SENHA n�o pode ser VAZIO!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.dataSetUsuarios.FieldByName('id').AsString) then
  begin
    edtSenha.SetFocus;
    Application.MessageBox(PWIdeChar(Format('O login %s j� est� CADASTRADO!',[edtLogin.Text])), 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

   LStatus := 'A';

   if ToggleSwitchStatus.State = tssOff then
    LStatus := 'B';

   Mensagem := 'Registro Alterado com Sucesso!';

   if dmUsuarios.dataSetUsuarios.State in [dsInsert] then
    begin
        Mensagem := 'Registro Inclu�do com Sucesso!';
       dmUsuarios.dataSetUsuariosid.AsString  := TUtilitario.GetID;
       dmUsuarios.dataSetUsuariosdata_cadastro.AsDateTime := Now;
    end;

   dmUsuarios.dataSetUsuariosnome.AsString  :=  Trim(edtNome.Text);
   dmUsuarios.dataSetUsuarioslogin.AsString :=  Trim(edtLogin.Text);
   dmUsuarios.dataSetUsuariossenha.AsString :=  Trim(edtSenha.Text);
   dmUsuarios.dataSetUsuariosstatus.AsString :=  LStatus;

   dmUsuarios.dataSetUsuarios.Post;
   dmUsuarios.dataSetUsuarios.ApplyUpdates(0);
   Application.MessageBox(PWideChar(Mensagem), 'Aten��o', MB_OK + MB_ICONINFORMATION);

   pnlPrincipal.ActiveCard := CardPesquisa;

  inherited;

end;

procedure TfrmUsuarios.LimparCampos;
var
  Contador : Integer;
begin
  for Contador := 0 to ComponentCount -1 do
    begin
      if Components[Contador] is TCustomEdit then
        TCustomEdit(Components[Contador]).Clear
      else if Components[Contador] is TToggleSwitch then
        TToggleSwitch(Components[Contador]).State := tssOn;
    end;
end;

end.
