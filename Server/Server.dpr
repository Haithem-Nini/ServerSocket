program Server;

uses
  Vcl.Forms,
  CMD_Dialect in '..\API\CMD_Dialect.pas',
  UServer.Utils in 'API\UServer.Utils.pas',
  UServer.ClientTasks in 'API\UServer.ClientTasks.pas',
  Udm in 'VIEWS\DM\Udm.pas' {dm: TDataModule},
  Udm.RES in 'VIEWS\DM\Udm.RES.pas' {dm_Res: TDataModule},
  Udm.UX in 'VIEWS\DM\Udm.UX.pas' {dm_UX: TDataModule},
  Base.Main in 'VIEWS\Abs\Base.Main.pas' {BaseMain},
  UMain in 'UMain.pas' {FrmMain},
  Base.View in 'VIEWS\Abs\Base.View.pas' {BaseView},
  URemote.Desktop in 'VIEWS\URemote.Desktop.pas' {URemote_Desktop};

{$R *.res}

var
  FrmMain: TFrmMain;

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  { DataBase }
  Application.CreateForm(Tdm_Res, dm_Res);   {  Resources [PNG/WAV/HINT etc..] }
  Application.CreateForm(Tdm_UX, dm_UX);     { UI/UX Engine Unit [ActionList/Animation/BaseEvents/BaseMethodes/ etc...] }
  Application.CreateForm(TFrmMain, FrmMain); { MainForm Application => it's the App Container and Should be Empty!! => No Code!! => CleanCode  }
  Application.Run;
end.
