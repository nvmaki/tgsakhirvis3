unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm4 = class(TForm)
    lbll2: TLabel;
    lbll1: TLabel;
    lbll3: TLabel;
    lbll4: TLabel;
    lbll7: TLabel;
    dbgrd1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    e_1: TEdit;
    e_3: TEdit;
    e_2: TEdit;
    e_4: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    zqry2: TZQuery;
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure posisiawal;
    procedure bersih;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  id:string;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm4.b1Click(Sender: TObject);
begin
bersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
b6.Enabled:= True;
e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
end;

procedure TForm4.b2Click(Sender: TObject);
begin
if e_1.Text='' then
  begin
    ShowMessage('ID NOT COMPLETED CORRECTLY');
    end else
    if e_2.Text=''then
    begin
     ShowMessage('ID USER NOT COMPLETED CORRECTLY');
    end else
    if e_3.text=''then
    begin
     ShowMessage('ID FLIGHT NOT COMPLETED CORRECTLY');
    end else
    if e_4.text=''then
    begin
    ShowMessage('BOOKING DATE NOT COMPLETED CORRECTLY');
    end else
  if Form4.zqry1.Locate('id',e_1.Text,[]) then
  begin
   ShowMessage('THE DATA IS ALREADY IN THE SYSTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into bookings values("'+e_1.Text+'","'+e_2.Text+'","'+e_3.Text+'","'+e_4.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from bookings');
 zqry1.Open;
ShowMessage('DATA SAVED SUCCESSFULLY!');
posisiawal;
end;
end;

procedure TForm4.b3Click(Sender: TObject);
begin
if (e_1.Text= '')or (e_2.Text ='')or (e_3.Text ='')or (e_4.Text ='') then
begin
  ShowMessage('DATA IS REQUIRED TO BE FILLED IN!');
end else
if e_1.Text = zqry1.Fields[1].AsString then
begin
 ShowMessage('DATA DOESNT CHANGE');
 posisiawal;
end else
begin
 ShowMessage('DATA UPDATED SUCCESSFULLY!');
zqry1.SQL.Clear;
zqry1.SQL.Add('Update bookings set id= "'+e_1.Text+'",user_id="'+e_2.Text+'",flight_id="'+e_3.Text+'",booking_date="'+e_4.Text+'" where id="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from bookings');
zqry1.Open;

posisiawal;
end;
end;

procedure TForm4.b4Click(Sender: TObject);
begin
if MessageDlg('ARE YOU SURE TO DELETE THIS DATA?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from bookings where id="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from bookings');
zqry1.Open;
ShowMessage('DATA DELETED SUCCESSFULLY');
posisiawal;
end else
begin
 ShowMessage('DATA CANCELED DELETED');

end
end;

procedure TForm4.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm4.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm4.dbgrd1CellClick(Column: TColumn);
begin
id:= zqry1.Fields[0].AsString;
e_2.Text:= zqry1.Fields[1].AsString;
e_3.Text:= zqry1.Fields[2].AsString;
e_4.Text:= zqry1.Fields[3].AsString;

e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;

b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

procedure TForm4.posisiawal;
begin
bersih;
b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
b6.Enabled:= False;
e_1.Enabled:= false;
e_2.Enabled:= false;
e_3.Enabled:= false;
e_4.Enabled:= false;

end;

procedure TForm4.bersih;
begin
e_1.Clear;
e_2.Clear;
e_3.Clear;
e_4.Clear;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
posisiawal;

end;

end.
 