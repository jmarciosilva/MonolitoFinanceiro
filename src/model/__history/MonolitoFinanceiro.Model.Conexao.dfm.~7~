object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 627
  Width = 814
  object SQLConexao: TFDConnection
    Params.Strings = (
      'Database=C:\monolitoFinanceiro\db\sistema_financeiro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = SQLConexao
    SQL.Strings = (
      'select * from usuarios;')
    Left = 176
    Top = 56
  end
end
