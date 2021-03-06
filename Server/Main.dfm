object UMain: TUMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Server'
  ClientHeight = 513
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  Menu = Main_Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
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
  object Edt_Port: TEdit
    Left = 8
    Top = 31
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
    TabOrder = 0
    Text = '8081'
  end
  object Btn_Start: TBitBtn
    Left = 8
    Top = 72
    Width = 162
    Height = 33
    Caption = 'Start Server..'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn_StartClick
  end
  object LV_Clients: TListView
    Left = 176
    Top = 8
    Width = 768
    Height = 480
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
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = PopupMenu_Client
    TabOrder = 2
    ViewStyle = vsReport
  end
  object StatusBar_APP: TStatusBar
    Left = 0
    Top = 494
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
  object Serv_Sock: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = Serv_SockClientConnect
    OnClientDisconnect = Serv_SockClientDisconnect
    Left = 48
    Top = 120
  end
  object PopupMenu_Client: TPopupMenu
    Left = 48
    Top = 176
    object RemoteAccesstothisDevice1: TMenuItem
      Caption = 'Remote Access to this Device'
      OnClick = RemoteAccesstothisDevice1Click
    end
    object StartChattingwiththisDevice1: TMenuItem
      Caption = 'Start Chatting with this Device'
    end
    object MenuItem_CloseHosting_: TMenuItem
      Caption = 'Close Connection for this Device'
      OnClick = MenuItem_CloseHosting_Click
    end
  end
  object Main_Menu: TMainMenu
    Left = 48
    Top = 232
    object N5451: TMenuItem
      Caption = 'About !'
      OnClick = N5451Click
    end
  end
end
