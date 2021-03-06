unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Win.ScktComp, Vcl.ComCtrls, Vcl.Menus;

type
  TUMain = class(TForm)
    Edt_Port: TEdit;
    Label1: TLabel;
    Btn_Start: TBitBtn;
    Serv_Sock: TServerSocket;
    LV_Clients: TListView;
    PopupMenu_Client: TPopupMenu;
    MenuItem_CloseHosting_: TMenuItem;
    StatusBar_APP: TStatusBar;
    Main_Menu: TMainMenu;
    N5451: TMenuItem;
    RemoteAccesstothisDevice1: TMenuItem;
    StartChattingwiththisDevice1: TMenuItem;
    procedure Btn_StartClick(Sender: TObject);
    procedure Serv_SockClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure MenuItem_CloseHosting_Click(Sender: TObject);
    procedure Serv_SockClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormDestroy(Sender: TObject);
    procedure N5451Click(Sender: TObject);
    procedure RemoteAccesstothisDevice1Click(Sender: TObject);
  private
    procedure Update_UI(aSocket: TCustomSocket);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UMain: TUMain;

implementation

uses
  CMD_Dialect, Remote_Desktop;

{$R *.dfm}

procedure TUMain.Btn_StartClick(Sender: TObject);
begin
 if not Serv_Sock.Active then
  begin
    Serv_Sock.Port   := strToInt(Edt_Port.Text);
    Serv_Sock.Active := True;
    Update_UI(Serv_Sock);
  end
 else
 begin
    Serv_Sock.Active := False;
    Update_UI(Serv_Sock);
 end;

end;

procedure TUMain.FormDestroy(Sender: TObject);
begin
   Serv_Sock.Active := False;
end;

procedure TUMain.MenuItem_CloseHosting_Click(Sender: TObject);
var  client: TCustomWinSocket; I : Integer;
begin
 if Assigned(LV_Clients.Selected) then
  begin
   for I := 0 to Serv_Sock.Socket.ActiveConnections-1 do
    begin
     client := Serv_Sock.Socket.Connections[i];
     if client.RemoteAddress = LV_Clients.Selected.SubItems[1] then
      begin
       client.SendText('22');
       //LV_Clients.Selected.Delete ;
       break;
      end;
    end;
  end;
end;

procedure TUMain.N5451Click(Sender: TObject);
begin
 Application.MessageBox('Created by MR.HAITHEM NINI ,Contact: Haithem.Nini20@Gmail.Com', 'About', 64);
end;

procedure TUMain.RemoteAccesstothisDevice1Click(Sender: TObject);
begin
   URemote_Desktop.ShowModal;
end;

procedure TUMain.Serv_SockClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
 var List_client : TListItem;
begin
  List_client := LV_Clients.Items.Add;
  List_client.Caption := IntToStr(socket.Handle);
  List_client.SubItems.Add(Socket.RemoteHost);
  List_client.SubItems.Add(Socket.RemoteAddress);
  List_client.SubItems.Add(IntToStr(Socket.RemotePort));
end;

procedure TUMain.Serv_SockClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var FLstItem : TListItem;
begin
   FLstItem := LV_Clients.FindCaption(0, intToStr(Socket.Handle), False, True, False);
   FLstItem.Delete;
end;

procedure TUMain.Update_UI(aSocket: TCustomSocket);
begin
 if(ASocket is TServerSocket) then
  begin
    if (ASocket as TServerSocket).Active then
    begin
      LV_Clients.Enabled := True;
      Edt_Port.Enabled := False;
    //========
      Btn_Start.Caption := 'Stop Server !';
      StatusBar_APP.Panels.Items[1].Text := 'Server is Activated , Server is Listening...,Connections on the Port: ' + intToStr(Serv_Sock.Port);
    end
    else
    begin
      LV_Clients.Clear;
      LV_Clients.Enabled := False;
      Edt_Port.Enabled := True;
    //========
      Btn_Start.Caption := 'Start Server..';
      StatusBar_APP.Panels.Items[1].Text := 'Server is Stopped';
    end;
  end;

end;

end.
