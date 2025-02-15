unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    imgLogoLogin: TImage;
    pnlPrincipal: TPanel;
    pnlTopoTitulo: TPanel;
    pnlBotoesCaixaTextoContainer: TPanel;
    lblNomeAplicacao: TLabel;
    lblPreenchaCampos: TLabel;
    pnlBotoesCaixaTexto: TPanel;
    Label1: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.Model.Sistema;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if Trim(edtUsuario.Text) = '' then
  begin
    edtUsuario.SetFocus;
    Application.MessageBox('Informe o seu USU�RIO!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua SENHA!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  try
    dmUsuarios.EfetuarLogin(Trim(edtUsuario.Text), Trim(edtSenha.Text));
    dmSistema.DataUltimoAcesso(Now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
    ModalResult := mrOk;
  except
    on Erro: Exception do
    begin
      Application.MessageBox(PWideChar(Erro.Message), 'Aten��o', MB_OK + MB_ICONWARNING);
      edtUsuario.SetFocus;
    end;

  end;


end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtUsuario.Text := dmSistema.UsuarioUltimoAcesso();
end;

end.
