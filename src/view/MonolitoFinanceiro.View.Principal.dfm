object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Financeiro'
  ClientHeight = 728
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 21
  object StatusBar1: TStatusBar
    AlignWithMargins = True
    Left = 6
    Top = 677
    Width = 982
    Height = 48
    Margins.Left = 6
    Margins.Right = 6
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Width = 300
      end>
    ExplicitLeft = 0
    ExplicitTop = 680
    ExplicitWidth = 994
  end
  object MainMenu1: TMainMenu
    Left = 800
    Top = 344
    object menuCadastros: TMenuItem
      Caption = 'Cadastros'
      object menuCadastroUsuario: TMenuItem
        Caption = 'Cadastro Usu'#225'rio'
        OnClick = menuCadastroUsuarioClick
      end
    end
    object menuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object menuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 800
    Top = 504
  end
end
