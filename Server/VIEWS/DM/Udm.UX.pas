unit Udm.UX;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Actions,
  Vcl.Menus,
  Vcl.Forms,
  Vcl.ActnList,
  System.Win.ScktComp,
  UServer.Utils,
//
  Base.Main;

type
  Tdm_UX = class(TDataModule)
  {$REGION '  Components ..'}
    Menu_Main: TMainMenu;
    MenuItem_About: TMenuItem;
    PopupMenu_Client: TPopupMenu;
    MenuItem_RemoteDevice: TMenuItem;
    MenuItem_StartChatting: TMenuItem;
    MenuItem_CloseHosting: TMenuItem;
    SSock_Main: TServerSocket;
    ActionLst_Server: TActionList;
    Act_Switcher: TAction;
    Act_DeleteClient: TAction;
    procedure SSock_MainClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure SSock_MainClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
//
    procedure DataModuleDestroy(Sender: TObject);
    procedure Act_Switcher_Execute(Sender: TObject);
    procedure Act_DeleteClient_Execute(Sender: TObject);
    procedure MenuItem_AboutClick(Sender: TObject);
  {$ENDREGION}
  private
    fLV_CRUD: TLV_Server_CRUD;
    fClient: TCustomWinSocket;
    { Private declarations }
    function GetMainForm: TBaseMain;
    procedure Server_Switcher(aServer: TServerSocket);
  public
    { Public declarations }
    property App: TBaseMain read GetMainForm; // ReadOnly ..!!
  end;

var
  dm_UX: Tdm_UX;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdm_UX.GetMainForm: TBaseMain;
begin
  Result := (Application.MainForm as TBaseMain);
end;

procedure Tdm_UX.Act_DeleteClient_Execute(Sender: TObject);
var
  I: Byte;
begin
//  dm_UX.SSock_Main.Socket.Connections[LV_Clients.Selected.Index].SendText(CMD_CLOSE);
 if Assigned(App.LV_Clients.Selected) then
  begin
   for I := 0 to SSock_Main.Socket.ActiveConnections-1 do
    begin
     fClient := SSock_Main.Socket.Connections[i];
     if fClient.RemoteAddress = App.LV_Clients.Selected.SubItems[1] then
      begin
       fClient.SendText('22');
       //fMainRef.LV_Clients.Selected.Delete ;
       break;
      end;
    end;
  end;
end;

procedure Tdm_UX.Act_Switcher_Execute(Sender: TObject);
begin
  Server_Switcher(SSock_Main);
end;

{$REGION '  Server On Switch Event..'}
procedure Tdm_UX.DataModuleDestroy(Sender: TObject);
begin
  if SSock_Main.Active then SSock_Main.Active := False;
end;

procedure Tdm_UX.MenuItem_AboutClick(Sender: TObject);
begin
  Application.MessageBox('Created by MR.HAITHEM NINI ,Contact: Haithem.Nini20@Gmail.Com', 'About', 64);
end;

procedure Tdm_UX.Server_Switcher(aServer: TServerSocket);
begin
  if not (aServer.Active) then
  begin
    aServer.Port   := App.Port;
    aServer.Active := True;
    App.UpdateUI(True);
  end else begin
    aServer.Active := False;
    App.UpdateUI(False);
  end;
end;
{$ENDREGION}

{$REGION '  Server On Client''s is (Connect/Disconnect) Events ..'}
procedure Tdm_UX.SSock_MainClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  fLV_CRUD.Add_ListView_Item(App.LV_Clients, Socket);
end;

procedure Tdm_UX.SSock_MainClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  fLV_CRUD.Delete_ListView_Item(App.LV_Clients, Socket);
end;
{$ENDREGION}


end.
