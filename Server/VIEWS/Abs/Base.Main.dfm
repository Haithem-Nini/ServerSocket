object BaseMain: TBaseMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Server'
  ClientHeight = 533
  ClientWidth = 952
  Color = 16051948
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 15
  object StatusBar_APP: TStatusBar
    Left = 0
    Top = 514
    Width = 952
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = 'Server is not Activated'
        Width = 100
      end>
    ParentBiDiMode = False
  end
  object Pnl_Caption: TPanel
    Left = 0
    Top = 0
    Width = 952
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Server'
    Color = 16051948
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14136757
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Pnl_Client: TPanel
    Left = 0
    Top = 81
    Width = 952
    Height = 433
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Pnl_Client'
    ShowCaption = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 19
      Caption = 'Port:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Btn_ServerSwitcher: TBitBtn
      Left = 8
      Top = 69
      Width = 162
      Height = 33
      Cursor = crHandPoint
      Action = dm_UX.Act_Switcher
      Caption = 'Start Server'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edt_Port: TEdit
      Left = 8
      Top = 33
      Width = 162
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      TabOrder = 1
      Text = '8081'
    end
    object LV_Clients: TListView
      Left = 184
      Top = 0
      Width = 768
      Height = 433
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 15985129
      Columns = <
        item
          Caption = 'Socket ID'
          Width = 150
        end
        item
          Alignment = taCenter
          Caption = 'Pc Name'
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = 'Client IP'
          Width = 250
        end
        item
          Alignment = taCenter
          Caption = 'Port'
          Width = 150
        end>
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      PopupMenu = dm_UX.PopupMenu_Client
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
end