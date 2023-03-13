object frmCalcJuros: TfrmCalcJuros
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'C'#225'lculo de Juros'
  ClientHeight = 305
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object LabelPrazoPagamento: TLabel
      Left = 248
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Prazo de Pagamento:'
    end
    object LabelQtdeParcelas: TLabel
      Left = 130
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Qtde Parcelas:'
    end
    object LabelValor: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'Valor Atual:'
    end
    object cbxQtdeParc: TComboBox
      Left = 132
      Top = 22
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
    object cbxPrazoPG: TComboBox
      Left = 239
      Top = 22
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Mensal'
        'Semestral'
        'Anual')
    end
    object edtvrlatual: TEdit
      Left = 7
      Top = 22
      Width = 80
      Height = 21
      TabOrder = 2
      OnKeyPress = edtvrlatualKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 382
    Height = 215
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object mmolog: TMemo
      Left = 2
      Top = 2
      Width = 378
      Height = 211
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 264
    Width = 382
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object btnProcessar: TBitBtn
      Left = 221
      Top = 4
      Width = 75
      Height = 30
      Caption = '&Processar'
      TabOrder = 0
      OnClick = btnProcessarClick
    end
    object btnSair: TBitBtn
      Left = 299
      Top = 4
      Width = 75
      Height = 30
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
end
