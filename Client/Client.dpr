program Client;

uses
  Vcl.Forms,
  CMD_Dialect in '..\API\CMD_Dialect.pas',
  Udm.Res in 'VIEWS\DM\Udm.Res.pas' {dm_Res: TDataModule},
  Udm.UX in 'VIEWS\DM\Udm.UX.pas' {dm_UX: TDataModule},
  Udm in 'VIEWS\DM\Udm.pas' {dm: TDataModule},
  Base.Main in 'VIEWS\Abs\Base.Main.pas' {BaseMain},
  UMain in 'UMain.pas' {FrmMain};

{$R *.res}

//var
//  FrmMain: TFrmMain;

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmMain, FrmMain);
  { DataBase }
  Application.CreateForm(Tdm_Res, dm_Res);   {  Resources [PNG/WAV/HINT etc..] }
  Application.CreateForm(Tdm_UX, dm_UX);     { UI/UX Engine Unit [ActionList/Animation/BaseEvents/BaseMethodes/ etc...] }
//  Application.CreateForm(TFrmMain, FrmMain); { MainForm Application => it's the App Container and Should be Empty!! => No Code!! => CleanCode  }
  Application.Run;
end.
