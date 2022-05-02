unit UServer.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.ComCtrls,
  System.Win.ScktComp;

type
  TLV_Server_CRUD = record
  private
    fLstItem : TListItem;
  public
    procedure Add_ListView_Item(aListView: TListView; aSocket: TCustomWinSocket);
    procedure Delete_ListView_Item(aListView: TListView; aSocket: TCustomWinSocket);
  end;

implementation

procedure TLV_Server_CRUD.Add_ListView_Item(aListView: TListView; aSocket: TCustomWinSocket);
begin
  fLstItem := aListView.Items.Add;
  fLstItem.Caption := IntToStr(aSocket.Handle);
  fLstItem.SubItems.Add(aSocket.RemoteHost);
  fLstItem.SubItems.Add(aSocket.RemoteAddress);
  fLstItem.SubItems.Add(IntToStr(aSocket.RemotePort));
end;

procedure TLV_Server_CRUD.Delete_ListView_Item(aListView: TListView; aSocket: TCustomWinSocket);
begin
  fLstItem := aListView.FindCaption(0, intToStr(aSocket.Handle), False, True, False);
  fLstItem.Delete;
end;

end.
