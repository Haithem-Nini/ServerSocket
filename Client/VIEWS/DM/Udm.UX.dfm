object dm_UX: Tdm_UX
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 164
  Width = 541
  object ActionLst_Client: TActionList
    Left = 48
    Top = 8
    object Act_Switcher: TAction
      Caption = 'Connect to the Server'
      OnExecute = Act_SwitcherExecute
    end
  end
  object CSock_Main: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnecting = CSock_MainConnecting
    OnConnect = CSock_MainConnect
    OnDisconnect = CSock_MainDisconnect
    OnRead = CSock_MainRead
    OnError = CSock_MainError
    Left = 47
    Top = 54
  end
  object Timer_AutoReconnect: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer_AutoReconnectTimer
    Left = 48
    Top = 102
  end
end
