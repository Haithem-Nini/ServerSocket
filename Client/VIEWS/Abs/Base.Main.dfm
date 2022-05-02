object BaseMain: TBaseMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Client'
  ClientHeight = 403
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 23
  object StatusBar_APP: TStatusBar
    Left = 0
    Top = 384
    Width = 442
    Height = 19
    BiDiMode = bdLeftToRight
    Color = 16051948
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = 'Client is NOT Connected !!'
        Width = 100
      end>
    ParentBiDiMode = False
  end
  object Pnl_Caption: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Guichet - [  N'#176' 01  ]'
    Color = 16051948
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14532543
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
    Top = 41
    Width = 442
    Height = 343
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Pnl_Client'
    ShowCaption = False
    TabOrder = 2
    object Pnl_Connection_Page: TPanel
      Left = 0
      Top = 0
      Width = 442
      Height = 343
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Pnl_Connection_Page'
      Color = 15985129
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object GrpBox_ConnectSettings: TGroupBox
        Left = 8
        Top = 8
        Width = 425
        Height = 209
        Caption = 'Connection Settings'
        Color = 15985129
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object GrpBox_ServerConfig: TGroupBox
          Left = 6
          Top = 22
          Width = 414
          Height = 90
          Caption = 'Server Settings :'
          Color = 15985129
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 9
            Top = 25
            Width = 92
            Height = 18
            Caption = 'Server IP/Host:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object Label2: TLabel
            Left = 259
            Top = 25
            Width = 30
            Height = 18
            Caption = 'Port:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object Label3: TLabel
            Left = 9
            Top = 56
            Width = 106
            Height = 18
            Caption = 'Server Password:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object Edt_Host: TEdit
            Left = 109
            Top = 22
            Width = 139
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
            TabOrder = 0
            Text = 'localhost'
          end
          object Edt_Port: TEdit
            Left = 295
            Top = 22
            Width = 110
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
            TabOrder = 1
            Text = '8081'
          end
          object Edt_Password: TEdit
            Left = 121
            Top = 53
            Width = 284
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 2
          end
        end
        object GrpBox_ClientConfig: TGroupBox
          Left = 6
          Top = 115
          Width = 414
          Height = 82
          Caption = 'Client Settings : '
          Color = 15985129
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object Label4: TLabel
            Left = 9
            Top = 25
            Width = 100
            Height = 18
            Caption = 'Client PC Name:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
          end
          object Edt_Client_ID: TEdit
            Left = 121
            Top = 22
            Width = 284
            Height = 26
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
            TabOrder = 0
            Text = 'Guichet - [  N'#176' 01  ]'
          end
          object CheckBox_AutoReconnect: TCheckBox
            Left = 9
            Top = 54
            Width = 392
            Height = 17
            Cursor = crHandPoint
            Action = dm_UX.Act_AutoReconnect
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object GrpBox_Connection: TGroupBox
        Left = 8
        Top = 223
        Width = 425
        Height = 74
        Caption = 'Connection Dashboard : '
        Color = 15985129
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Btn_Connect: TButton
          AlignWithMargins = True
          Left = 12
          Top = 22
          Width = 401
          Height = 43
          Cursor = crHandPoint
          Margins.Left = 10
          Margins.Top = 5
          Margins.Right = 10
          Margins.Bottom = 7
          Action = dm_UX.Act_Switcher
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ImageAlignment = iaRight
          ImageMargins.Left = 25
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
end
