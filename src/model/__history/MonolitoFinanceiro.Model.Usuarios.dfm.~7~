object dmUsuarios: TdmUsuarios
  Height = 563
  Width = 693
  object sqlUsuarios: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 80
    Top = 104
  end
  object dataSetUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dataSetProviderUsuarios'
    Left = 360
    Top = 104
    object dataSetUsuariosid: TStringField
      DisplayLabel = '#ID'
      DisplayWidth = 10
      FieldName = 'id'
      Visible = False
      Size = 36
    end
    object dataSetUsuariosnome: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      DisplayWidth = 30
      FieldName = 'nome'
      Size = 50
    end
    object dataSetUsuarioslogin: TStringField
      DisplayLabel = 'Login Usu'#225'rio'
      FieldName = 'login'
    end
    object dataSetUsuariossenha: TStringField
      DisplayLabel = 'Senha '
      DisplayWidth = 10
      FieldName = 'senha'
      Visible = False
    end
    object dataSetUsuariosstatus: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Size = 1
    end
    object dataSetUsuariosdata_cadastro: TDateField
      DisplayLabel = 'Cadastro'
      FieldName = 'data_cadastro'
    end
  end
  object dataSetProviderUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 104
  end
end
