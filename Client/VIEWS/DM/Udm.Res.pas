unit Udm.Res;

interface

uses
  System.SysUtils, System.Classes;

type
  Tdm_Res = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Res: Tdm_Res;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
