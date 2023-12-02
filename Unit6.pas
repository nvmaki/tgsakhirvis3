unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm6 = class(TForm)
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
    Label2: TLabel;
    e_5: TEdit;
    e_7: TEdit;
    e_8: TEdit;
    e_6: TEdit;
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
  Form6: TForm6;
  id:string;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm6.b1Click(Sender: TObject);
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
e_5.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
if e_1.Text='' then
  begin
    ShowMessage('ID NOT COMPLETED CORRECTLY');
    end else
    if e_2.Text=''then
    begin
     ShowMessage('AIRLANE NOT COMPLETED CORRECTLY');
    end else
    if e_3.text=''then
    begin
     ShowMessage('DEPARTURE AIRPORT NOT COMPLETED CORRECTLY');
    end else
    if e_4.text=''then
    begin
    ShowMessage('ARRIVAL AIRPORT NOT COMPLETED CORRECTLY');
    end else
    if e_5.Text='' then
  begin
    ShowMessage('DEPARTURE DATE COMPLETED CORRECTLY');
    end else
    if e_6.Text=''then
    begin
     ShowMessage('DEPARTURE TIME COMPLETED CORRECTLY');
    end else
    if e_7.text=''then
    begin
     ShowMessage('PRICE NOT COMPLETED CORRECTLY');
    end else
    if e_8.text=''then
    begin
    ShowMessage('SEATS AVAILABLE COMPLETED CORRECTLY');
    end else
  if Form6.zqry1.Locate('id',e_1.Text,[]) then
  begin
   ShowMessage('THE DATA IS ALREADY IN THE SYSTEM');
  end else
  begin

 zqry1.SQL.Clear;
zqry1.SQL.Add('insert into flights values("'+e_1.Text+'","'+e_2.Text+'","'+e_3.Text+'","'+e_4.Text+'","'+e_5.Text+'","'+e_6.Text+'","'+e_7.Text+'","'+e_8.Text+'")');
 zqry1.ExecSQL ;

 zqry1.SQL.Clear;
 zqry1.SQL.Add('select * from flights');
 zqry1.Open;
ShowMessage('DATA SAVED SUCCESSFULLY!');
posisiawal;
end;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if (e_1.Text= '')or (e_2.Text ='')or (e_3.Text ='')or (e_4.Text ='')or (e_5.Text= '')or (e_6.Text ='')or (e_7.Text ='')or (e_8.Text ='') then
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
zqry1.SQL.Add('Update flights set id= "'+e_1.Text+'",airline="'+e_2.Text+'",departure_airport="'+e_3.Text+'",arrival_airport="'+e_4.Text+'",departure_date= "'+e_5.Text+'",departure_time="'+e_6.Text+'",price="'+e_7.Text+'",seats_available="'+e_8.Text+'" where id="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from flights');
zqry1.Open;

posisiawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('ARE YOU SURE TO DELETE THIS DATA?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from flights where id="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from flights');
zqry1.Open;
ShowMessage('DATA DELETED SUCCESSFULLY');
posisiawal;
end else
begin
 ShowMessage('DATA CANCELED DELETED');
 posisiawal;
end
end;

procedure TForm6.b5Click(Sender: TObject);
begin
posisiawal;
end;



procedure TForm6.b6Click(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

procedure TForm6.dbgrd1CellClick(Column: TColumn);
begin
id:= zqry1.Fields[0].AsString;
e_2.Text:= zqry1.Fields[1].AsString;
e_3.Text:= zqry1.Fields[2].AsString;
e_4.Text:= zqry1.Fields[3].AsString;
e_5.Text:= zqry1.Fields[4].AsString;
e_6.Text:= zqry1.Fields[5].AsString;
e_7.Text:= zqry1.Fields[6].AsString;
e_8.Text:= zqry1.Fields[7].AsString;


e_1.Enabled:= True;
e_2.Enabled:= True;
e_3.Enabled:= True;
e_4.Enabled:= True;
e_5.Enabled:= True;
e_6.Enabled:= True;
e_7.Enabled:= True;
e_8.Enabled:= True;

b1.Enabled:= false;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;
end;

procedure TForm6.posisiawal;
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
e_5.Enabled:= false;
e_6.Enabled:= false;
e_7.Enabled:= false;
e_8.Enabled:= false;
end;

procedure TForm6.bersih;
begin
e_1.Clear;
e_2.Clear;
e_3.Clear;
e_4.Clear;
e_5.Clear;
e_6.Clear;
e_7.Clear;
e_8.Clear;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

end.
