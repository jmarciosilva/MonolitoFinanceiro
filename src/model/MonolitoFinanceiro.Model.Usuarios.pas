unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
  private
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(Login : String; ID : String) : Boolean;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MonolitoFinanceiro.Model.Conexao;

{$R *.dfm}

{ TdmUsuarios }

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
