unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao, MonolitoFinanceiro.Model.Entidades.Usuario;

type
  TdmUsuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    dataSetUsuarios: TClientDataSet;
    dataSetProviderUsuarios: TDataSetProvider;
    dataSetUsuariosid: TStringField;
    dataSetUsuariosnome: TStringField;
    dataSetUsuarioslogin: TStringField;
    dataSetUsuariossenha: TStringField;
    dataSetUsuariosdata_cadastro: TDateField;
    dataSetUsuariosstatus: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FEntidadeUsuario : TModelEntidadeUsuario;
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(Login : String; ID : String) : Boolean;
    procedure EfetuarLogin(Login : String; Senha : String);
    function GetUsuarioLogado : TModelEntidadeUsuario;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin
  FEntidadeUsuario := TModelEntidadeUsuario.Create;
end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta : TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM usuarios WHERE login = :login AND senha = :senha');
    SQLConsulta.ParamByName('login').AsString := Login;
    SQLConsulta.ParamByName('senha').AsString := Senha;
    SQLConsulta.Open();

    if SQLConsulta.IsEmpty then
    begin
      raise Exception.Create('Usuário ou Senha INVÀLIDOS!');
    end;

    if SQLConsulta.FieldByName('status').AsString <> 'A' then
    begin
      raise Exception.Create('Usuário BLOQUEADO! - Entrar em contato com o Administrador');
    end;

    FEntidadeUsuario.ID := SQLConsulta.FieldByName('ID').AsString;
    FEntidadeUsuario.Nome := SQLConsulta.FieldByName('NOME').AsString;
    FEntidadeUsuario.Login := SQLConsulta.FieldByName('LOGIN').AsString;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;



function TdmUsuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT id FROM usuarios WHERE login = :login');
    SQLConsulta.ParamByName('login').AsString := Login;
    SQLConsulta.Open();

    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('id').AsString <> ID;

  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

end.
