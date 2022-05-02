unit Base.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Forms;

type
  TBaseMain = class(TForm)
  {$REGION '  Components ...'}
    Edt_Port: TEdit;
    Label1: TLabel;
    Btn_ServerSwitcher: TBitBtn;
    LV_Clients: TListView;
    StatusBar_APP: TStatusBar;
    Pnl_Caption: TPanel;
    Pnl_Client: TPanel;
  {$ENDREGION}
  private
    function Get_Port: Integer;
    procedure Set_Port(const Value: Integer);
    { Private declarations }
  protected
  public
    { Public declarations }
    procedure UpdateUI(const aValue: Boolean);
    property Port: Integer Read Get_Port write Set_Port;
  end;

//var
//  BaseMain: TBaseMain;

implementation

{$R *.dfm}

{ TBase_Main }

function TBaseMain.Get_Port: Integer;
begin
  Result := StrToInt(Edt_Port.Text);
end;

procedure TBaseMain.Set_Port(const Value: Integer);
begin
  Edt_Port.Text := InttoStr(Value);
end;

procedure TBaseMain.UpdateUI(const aValue: Boolean);
begin
  if aValue then
  begin
    LV_Clients.Enabled := True;
    Edt_Port.Enabled := False;
  //========
    Btn_ServerSwitcher.Caption := 'Stop Server !';
    StatusBar_APP.Panels.Items[1].Text := 'Server is Activated , Listening for New comming Connections on the Port: ' + intToStr(Port);
  end else begin
    LV_Clients.Clear;
    LV_Clients.Enabled := False;
    Edt_Port.Enabled := True;
  //========
    Btn_ServerSwitcher.Caption := 'Start Server';
    StatusBar_APP.Panels.Items[1].Text := 'Server is Stopped';
  end;
end;

end.