object frmcambiomoedascryptoativos: Tfrmcambiomoedascryptoativos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cambio - Moedas e Crypto'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 264
      Height = 47
      Align = alLeft
      Caption = 'Moeda ou Crypto'
      TabOrder = 0
      object cbxMoedaCryptoAtivos: TComboBox
        Left = 3
        Top = 19
        Width = 166
        Height = 23
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'TODAS'
          'USD-BRL'
          'EUR-BRL'
          'GBP-BRL'
          'BTC-BRL')
      end
      object btnPesquisar: TBitBtn
        Left = 175
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          20000000000000080000C30E0000C30E00000000000000000000FFFFFF00E8D7
          C64CE2CBB660FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC06E1E1
          E138F3F3F316FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9D8C749AF73
          38FBAB6B2DFFDDC3AA70FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD03D4D4D450B0B0
          B094C5C5C56DF5F5F514FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6D3C053AD70
          34FFA86625FFAD7135FEDDC3AA70FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD04D0D0D057B2B2
          B290B3B3B38EC6C6C66BF4F4F414FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2CC
          B75FB0753BF7A86625FFAD7135FEDEC5AD6CFAF6F310E9D8C845D6B89976D3B1
          917FDDC4AC62F3EBE226FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA0AD0D0
          D058B4B4B48CB3B3B38EC6C6C66AF4F4F414F7F7F70FE3E3E331D8D8D842DBDB
          DB3EE9E9E927FDFDFD04FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00E2CCB75FB0753BF7A96828FFB27941F9BB8856CFAD6F33FCAE7236FFB075
          3BFFAB6D2FFFB0753BE5D7BA9D7BFEFEFD04FFFFFF00FFFFFF00FFFFFF00FBFB
          FB07D0D0D059B4B4B48CB6B6B689C3C3C36FBFBFBF6FB6B6B687BABABA8BB9B9
          B98AB5B5B584C5C5C564EFEFEF1EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E3CEBA5CB57D46E9A76525FFB1773EFFD8BB9FFFEFE4D8FFF3EA
          E1FFE7D6C4FFC4986DFFA56321FFD1AF8D90FFFFFF01FFFFFF00FFFFFF00FFFF
          FF00FBFBFB07D2D2D255B7B7B785B2B2B288C9C9C987E9E9E981F4F4F480F2F2
          F280E0E0E083BBBBBB8DBABABA79EFEFEF1EFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00BE8D5EC8B0763CFFEDDFD1FFFFFFFFFEFFFFFFFEFFFF
          FFFEFFFFFFFEFFFFFEFECDA884FFA86726FFE6D3C050FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00EBEBEB25B4B4B483D1D1D183FDFDFD7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FF3F3F380BBBBBB8EC5C5C565FBFBFB07FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00EBDBCC40AD6F33F7D7BA9EFFFFFFFFFEFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFFEFAF7F4FFB47D45FFC4976CB1FEFEFE02FFFFFF00FFFF
          FF00FFFFFF00D2D2D24EBCBCBC8AF7F7F780FFFFFF7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FFFFFFF7FE3E3E383B4B4B485E9E9E928FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00D8BB9F75AD7034FFEFE3D8FFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFFEFFFFFFFECBA57FFFB47D46DDF9F4EF14FFFFFF00FFFF
          FF00FCFCFC06C1C1C169CCCCCC89FFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FFFFFFF7FF6F6F680BABABA8BD9D9D942FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00D5B6977DAF7439FFF2E9DFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFFEFFFFFFFED0AC8AFFB27940E3F7F0EA1AFFFFFF00FFFF
          FF00FBFBFB08BFBFBF6CD0D0D088FFFFFF7FFFFFFF7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FFFFFFF7FF8F8F880BCBCBC8BD5D5D547FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00E1CAB45DAA6B2CFFE5D2BFFFFFFFFFFEFEFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFFEFFFFFFFEC09162FFBA8754CCFCFAF809FFFFFF00FFFF
          FF00FEFEFE02C7C7C75FC3C3C38BFEFEFE7FFFFFFF7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FFFFFFF7FEEEEEE81B6B6B689E0E0E037FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00F6EFE91DB27941E7BE8F5FFFFEFCFBFEFFFFFFFEFFFFFFFEFFFF
          FFFEFFFFFFFEFFFFFFFEE6D3C1FFA86727FFD5B59683FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00DFDFDF39B2B2B28BE4E4E482FFFFFF7FFFFFFF7FFFFFFF7FFFFF
          FF7FFFFFFF7FFFFFFF7FCCCCCC88B9B9B97AF4F4F415FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00DCC2A86EA56321FFC89E75FFF4ECE3FFFFFFFFFEFFFF
          FFFEFDFCFBFEE3CFBBFFAE7136FFB8834FD7F7F1EB1BFFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FAFAFA09C6C6C665B6B6B68FE4E4E481FDFDFD7FFFFFFF7FFFFF
          FF7FF7F7F77FD3D3D385B0B0B08CDBDBDB40FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF02D5B69784A9692AFAB1773DFFC69B71FFCAA3
          7CFFBD8B5BFFA86727FFB9834FD1EFE3D736FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00F4F4F415C5C5C566B2B2B28CC4C4C48BD1D1D187CECE
          CE88BDBDBD8CB3B3B386D6D6D64AFEFEFE03FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8D7C649C79D74A2B7814BD1B47C
          45D9BC8A59C1D5B6977DF8F2EC1BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FAFAFA09DDDDDD3CC6C6C662BEBEBE6FBFBF
          BF6DCCCCCC58E8E8E82AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAF6F20FF8F2
          ED15FDFCFB05FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE01F9F9F90BFAFA
          FA09FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnPesquisarClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 528
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 351
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object mmlog: TMemo
      Left = 2
      Top = 2
      Width = 620
      Height = 347
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
  end
end
