unit Udm.UX;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Actions,
  Vcl.ActnList,
  Vcl.ExtCtrls,
  System.Win.ScktComp,
//
  Base.Main;

type
  Tdm_UX = class(TDataModule)
    ActionLst_Client: TActionList;
    Act_Switcher: TAction;
    CSock_Main: TClientSocket;
    Timer_AutoReconnect: TTimer;
    procedure Act_SwitcherExecute(Sender: TObject);
    procedure Timer_AutoReconnectTimer(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CSock_MainRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSock_MainError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure CSock_MainDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSock_MainConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSock_MainConnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
    procedure Client_Switcher(aClient: TClientSocket);
    procedure Update_UI(aState: Boolean);
    function GetMainForm: TBaseMain;
  public
    { Public declarations }
    property APP: TBaseMain read GetMainForm; // ReadOnly ..!!
  end;

var
  dm_UX: Tdm_UX;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdm_UX.GetMainForm: TBaseMain;
begin
  Result := (Application.MainForm as TBaseMain);
end;

procedure Tdm_UX.Act_SwitcherExecute(Sender: TObject);
begin
  Client_Switcher(CSock_Main);

 if APP.CheckBox_AutoReconnect.Checked then
   Timer_AutoReconnect.Enabled := True
 else
   Timer_AutoReconnect.Enabled := False;
end;

procedure Tdm_UX.CSock_MainConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  APP.StatusBar_APP.Panels.Items[1].Text := 'Client is Connected on Server IP: ' +Socket.LocalAddress;
  APP.Btn_Connect.Enabled:= True;
end;

procedure Tdm_UX.CSock_MainConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  APP.StatusBar_APP.Panels.Items[1].Text := 'Connecting...';
  APP.Btn_Connect.Enabled:= False;
end;

procedure Tdm_UX.CSock_MainDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  APP.StatusBar_APP.Panels.Items[1].Text := 'Client is Stopped';
//==========
  APP.Btn_Connect.Caption := 'Start Client';
  APP.Edt_Port.Enabled:= True;
  APP.Edt_Host.Enabled:= True;
  APP.Btn_Connect.Tag := 0;
end;

procedure Tdm_UX.CSock_MainError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  APP.StatusBar_APP.Panels.Items[1].Text := 'Connection Error !!';
//==========
  APP.Btn_Connect.Enabled:= True;
  APP.Btn_Connect.Caption := 'Start Client';
  APP.Edt_Port.Enabled:= True;
  APP.Edt_Host.Enabled:= True;
  APP.Btn_Connect.Tag := 0;
end;

procedure Tdm_UX.CSock_MainRead(Sender: TObject; Socket: TCustomWinSocket);
var
  StrCommand: string;
begin
  StrCommand := Socket.ReceiveText;
//=======
  if StrCommand = '22' then
  begin
    CSock_Main.Active := False;
  end;
//=======
end;

procedure Tdm_UX.DataModuleDestroy(Sender: TObject);
begin
  if CSock_Main.Active then CSock_Main.Active := False;
end;


procedure Tdm_UX.Timer_AutoReconnectTimer(Sender: TObject);
begin
 if not CSock_Main.Active then
    CSock_Main.Active := True;
end;

{$REGION '  Client On Switch Event..'}
procedure Tdm_UX.Client_Switcher(aClient: TClientSocket);
begin
  if not (aClient.Active) then
  begin
    aClient.Host   := APP.Edt_Host.Text;
    aClient.Port   := strToInt(APP.Edt_Port.Text);
    aClient.Active := True;
    Update_UI(True);
  end else begin
    aClient.Active := False;
    Update_UI(False);
  end;
end;

procedure Tdm_UX.Update_UI(aState: Boolean);
begin
  if aState then begin
    APP.StatusBar_APP.Panels.Items[1].Text := 'Connected Successfully...';
    APP.Btn_Connect.Enabled := False;
    APP.Edt_Host.Enabled := False;
    APP.Edt_Port.Enabled := False;
    APP.Edt_Password.Enabled := False;
    APP.Edt_Client_ID.Enabled := False;
  end else begin
    APP.StatusBar_APP.Panels.Items[1].Text := 'Disconnected !!';
    APP.Btn_Connect.Enabled := True;
    APP.Edt_Host.Enabled := True;
    APP.Edt_Port.Enabled := True;
    APP.Edt_Password.Enabled := True;
    APP.Edt_Client_ID.Enabled := True;
  end;
end;
{$ENDREGION}

end.
