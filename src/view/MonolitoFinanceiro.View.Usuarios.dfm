inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  TextHeight = 21
  inherited pnlPrincipal: TCardPanel
    inherited CardCadastro: TCard
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 986
      ExplicitHeight = 760
      object Label1: TLabel [0]
        Left = 136
        Top = 56
        Width = 43
        Height = 21
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
        Left = 136
        Top = 99
        Width = 39
        Height = 21
        Caption = 'Login'
      end
      object Label3: TLabel [2]
        Left = 136
        Top = 147
        Width = 43
        Height = 21
        Caption = 'Senha'
      end
      object Label4: TLabel [3]
        Left = 137
        Top = 200
        Width = 42
        Height = 21
        Caption = 'Status'
      end
      inherited Panel1: TPanel
        ExplicitTop = 681
        ExplicitWidth = 986
        inherited btnCancelar: TButton
          ExplicitLeft = 874
        end
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
          ExplicitLeft = 763
        end
      end
      object edtNome: TEdit
        Left = 192
        Top = 56
        Width = 545
        Height = 29
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 192
        Top = 104
        Width = 337
        Height = 29
        TabOrder = 2
      end
      object edtSenha: TEdit
        Left = 192
        Top = 152
        Width = 337
        Height = 29
        TabOrder = 3
      end
      object ToggleSwitchStatus: TToggleSwitch
        Left = 192
        Top = 200
        Width = 130
        Height = 23
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 4
      end
    end
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlPesquisaBotoes: TPanel
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.dataSetUsuarios
    Left = 873
    Top = 572
  end
end
