unit UAnimation;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Types,
  Vcl.Controls,
  Vcl.Forms,
// ThirdParty Units ...
  IKAnimation,
  IKTypes,
  se_ani,
  acWavPlayer;

  procedure Wait(aMillSec: Double; aNextProc: TProc; aOnProcessEvent: TAnimationProcess = nil);
  procedure Animate_Transition(ACtrl: TControl; AANI: TseAnimation; AProc: TProc; AFinishEvent: TNotifyEvent = nil); overload;
  procedure Animate_Transition(ACtrl: TControl; AANI: TseAnimation; AProc: TProc; aPlayer: TacWavPlayer = nil; AFinishEvent: TNotifyEvent = nil); overload;
  procedure Animate_Ctrl(AObject: TObject; AProperty: String; AValue: Integer; ADuration: Double; AFinishProc: TProc = nil; aOnProcessEvent: TAnimationProcess = nil);

implementation

procedure Wait(aMillSec: Double; aNextProc: TProc; aOnProcessEvent: TAnimationProcess = nil);
var
  aTempObj: TComponent;
begin
  aTempObj := TComponent.Create(nil);
  try
    if Assigned(aOnProcessEvent) then begin
      Animate_Ctrl(aTempObj, 'Tag', 100, aMillSec,
        procedure
        begin
          aTempObj.Free;
          aNextProc;
        end, aOnProcessEvent);
    end else
    Animate_Ctrl(aTempObj, 'Tag', 100, aMillSec,
      procedure
      begin
        aTempObj.Free;
        aNextProc;
      end);
  finally

  end;
end;

procedure Animate_Transition(ACtrl: TControl; AANI: TseAnimation; AProc: TProc; AFinishEvent: TNotifyEvent = nil);
begin
  with AANI do
  begin
    if Assigned(AFinishEvent) then  OnFinish := AFinishEvent;
    ForceControlUpdate := True;
    FreezeControlClient(ACtrl, ACtrl.ClientRect);
    try
      AProc;
      Execute;
    finally
      Restore;
    end;
  end;
end;

procedure Animate_Transition(ACtrl: TControl; AANI: TseAnimation; AProc: TProc; aPlayer: TacWavPlayer = nil; AFinishEvent: TNotifyEvent = nil);
begin
  with AANI do
  begin
    if Assigned(AFinishEvent) then  OnFinish := AFinishEvent;
    if Assigned(aPlayer) then  begin
      aPlayer.Asynchronous := True; // to async with Method below ..
      aPlayer.Play;
    end;
    ForceControlUpdate := True;
    FreezeControlClient(ACtrl, ACtrl.ClientRect);
    try
      AProc;
      Execute;
    finally
      Restore;
    end;
  end;
end;

procedure Animate_Ctrl(AObject: TObject; AProperty: String; AValue: Integer; ADuration: Double; AFinishProc: TProc = nil; aOnProcessEvent: TAnimationProcess = nil);
var
  Animation: TIKPropertyAnimation;
begin
  if Assigned(AFinishProc) then
  begin
    Animation := TIKPropertyAnimation.Create(AObject, AProperty, Avalue, AFinishProc);
  end else
    Animation := TIKPropertyAnimation.Create(AObject, AProperty, Avalue);

  Animation.Duration := ADuration / 1000;
  Animation.OnProcess := aOnProcessEvent;
//  Animation.OnFinish := AFinishEvent;
  Animation.FreeOnFinished := True;
  Animation.Start;
end;

end.