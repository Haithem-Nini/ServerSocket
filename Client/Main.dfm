object UMain: TUMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Client'
  ClientHeight = 146
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 255
    Top = 7
    Width = 34
    Height = 19
    Caption = 'Port :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 255
    Top = 63
    Width = 75
    Height = 19
    Caption = 'IP address :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Edt_Host: TEdit
    Left = 255
    Top = 85
    Width = 162
    Height = 30
    TabStop = False
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 0
    Text = '192.168.1.41'
  end
  object Btn_Start: TBitBtn
    Left = 8
    Top = 40
    Width = 225
    Height = 68
    Caption = 'Start Client..'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn_StartClick
  end
  object Edt_Port: TEdit
    Left = 255
    Top = 29
    Width = 162
    Height = 30
    TabStop = False
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    Font.Quality = fqClearTypeNatural
    ParentFont = False
    TabOrder = 2
    Text = '8081'
  end
  object StatusBar_APP: TStatusBar
    Left = 0
    Top = 127
    Width = 444
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = 'Client is not Activated'
        Width = 100
      end>
    ParentBiDiMode = False
    ExplicitTop = 123
  end
  object Auto_Reconn_Chek: TCheckBox
    Left = 11
    Top = 11
    Width = 225
    Height = 23
    TabStop = False
    Caption = 'Auto ReConnect '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Client_Sock: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnecting = Client_SockConnecting
    OnConnect = Client_SockConnect
    OnDisconnect = Client_SockDisconnect
    OnRead = Client_SockRead
    OnError = Client_SockError
    Left = 319
    Top = 53
  end
  object TAuto_Reconn: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TAuto_ReconnTimer
    Left = 264
    Top = 48
  end
end
