object URemote_Desktop: TURemote_Desktop
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Remote Desktop'
  ClientHeight = 404
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar_APP: TStatusBar
    Left = 0
    Top = 385
    Width = 478
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Width = 100
      end>
    ParentBiDiMode = False
  end
  object Pnl_Bottom: TPanel
    Left = 0
    Top = 352
    Width = 478
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Pnl_Bottom'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      478
      33)
    object Btn_OK: TBitBtn
      Left = 376
      Top = 0
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight, akBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = Btn_OKClick
      ExplicitHeight = 27
    end
  end
end
