object dm_UX: Tdm_UX
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object Menu_Main: TMainMenu
    Left = 136
    Top = 6
    object MenuItem_About: TMenuItem
      Caption = 'About !'
      OnClick = MenuItem_AboutClick
    end
  end
  object PopupMenu_Client: TPopupMenu
    Left = 136
    Top = 62
    object MenuItem_RemoteDevice: TMenuItem
      Caption = 'Remote Access to this Device'
      Enabled = False
    end
    object MenuItem_StartChatting: TMenuItem
      Caption = 'Start Chatting with this Device'
      Enabled = False
    end
    object MenuItem_CloseHosting: TMenuItem
      Action = Act_DeleteClient
    end
  end
  object SSock_Main: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = SSock_MainClientConnect
    OnClientDisconnect = SSock_MainClientDisconnect
    Left = 32
    Top = 62
  end
  object ActionLst_Server: TActionList
    Left = 32
    Top = 8
    object Act_Switcher: TAction
      Caption = 'Start Server'
      OnExecute = Act_Switcher_Execute
    end
    object Act_DeleteClient: TAction
      Caption = 'Delete this Device'
      OnExecute = Act_DeleteClient_Execute
    end
  end
end
