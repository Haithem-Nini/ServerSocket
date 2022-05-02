unit Base.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Forms;

type
  TBaseMain = class(TForm)
  {$REGION '  Components ..'}
    StatusBar_APP: TStatusBar;
    Pnl_Caption: TPanel;
    Pnl_Client: TPanel;
    Pnl_Connection_Page: TPanel;
    GrpBox_ConnectSettings: TGroupBox;
    GrpBox_ServerConfig: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edt_Host: TEdit;
    Edt_Port: TEdit;
    Edt_Password: TEdit;
    GrpBox_ClientConfig: TGroupBox;
    Label4: TLabel;
    Edt_Client_ID: TEdit;
    CheckBox_AutoReconnect: TCheckBox;
    GrpBox_Connection: TGroupBox;
    Btn_Connect: TButton;
  {$ENDREGION}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  BaseMain: TBaseMain;

implementation

uses
  Udm.UX;

{$R *.dfm}

end.
