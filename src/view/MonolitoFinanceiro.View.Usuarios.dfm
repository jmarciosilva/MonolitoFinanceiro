inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientWidth = 988
  TextHeight = 21
  inherited pnlPrincipal: TCardPanel
    Width = 988
    inherited CardCadastro: TCard
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 986
      ExplicitHeight = 760
      inherited Panel1: TPanel
        ExplicitTop = 681
        ExplicitWidth = 986
        inherited btnCancelar: TButton
          ExplicitLeft = 874
        end
        inherited btnSalvar: TButton
          ExplicitLeft = 763
        end
      end
    end
    inherited CardPesquisa: TCard
      Height = 759
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
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
    DataSet = dmConexao.FDQuery1
    Left = 873
    Top = 572
  end
end
