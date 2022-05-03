unit UServer.ClientTasks;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.Win.ScktComp;

type
  TClientTask = (ctService_1, ctService_2, ctService_3); // Just an example!!

  TClient = class
  private
    fID: Cardinal;
    fTask: TClientTask;
  protected

  public
    constructor Create(aClientHandle: Cardinal; aTask: TClientTask);
    destructor Destroy; override;
  end;


implementation

{ TClient }

constructor TClient.Create(aClientHandle: Cardinal; aTask: TClientTask);
begin
  fID   := aClientHandle;
  fTask := aTask;
end;

destructor TClient.Destroy;
begin
//
  inherited;
end;

end.
