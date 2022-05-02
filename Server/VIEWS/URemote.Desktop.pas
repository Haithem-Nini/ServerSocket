unit URemote.Desktop;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
//
  Base.View;

type
  TURemote_Desktop = class(TBaseView)
    StatusBar_APP: TStatusBar;
    Pnl_Bottom: TPanel;
    Btn_OK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  URemote_Desktop: TURemote_Desktop;

implementation

uses
  System.Win.ScktComp,
  Base.Main,
  Udm.UX;

{$R *.dfm}

procedure TURemote_Desktop.Btn_OKClick(Sender: TObject);
 var send_text : AnsiString; client_Send: TCustomWinSocket; I : Integer;
begin
 for I := 0 to dm_UX.SSock_Main.Socket.ActiveConnections-1 do   //
  begin
   client_Send := dm_UX.SSock_Main.Socket.Connections[I];
   if client_Send.RemoteAddress = dm_UX.APP.LV_Clients.Selected.SubItems[1] then
    begin
     client_Send.SendText(send_text);
     break;
    end;
  end;
end;

procedure TURemote_Desktop.FormShow(Sender: TObject);
begin
 if dm_UX.SSock_Main.Active then
  StatusBar_APP.Panels.Items[1].Text := 'Server is Activated , Port :  ' + intToStr(dm_UX.SSock_Main.Port) + '   IP : ' + dm_UX.APP.LV_Clients.Selected.SubItems[1]
 else
  StatusBar_APP.Panels.Items[1].Text := 'Server is Stopped';

end;

end.
