unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    mm1: TMainMenu;
    AIRPORTS1: TMenuItem;
    AIRPORTS2: TMenuItem;
    BOOKINGS1: TMenuItem;
    CITIES1: TMenuItem;
    FLIGHTS1: TMenuItem;
    LOGOUT1: TMenuItem;
    Image1: TImage;
    procedure AIRPORTS2Click(Sender: TObject);
    procedure BOOKINGS1Click(Sender: TObject);
    procedure CITIES1Click(Sender: TObject);
    procedure FLIGHTS1Click(Sender: TObject);
    procedure LOGOUT1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm2.AIRPORTS2Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm2.BOOKINGS1Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm2.CITIES1Click(Sender: TObject);
begin
Form5.show;
end;

procedure TForm2.FLIGHTS1Click(Sender: TObject);
begin
Form6.show;
end;

procedure TForm2.LOGOUT1Click(Sender: TObject);
begin
if application.MessageBox('Are You Sure You Want To Logout?','Reconfirm',MB_YesNo)=ID_Yes then
begin
Form2.Close;
end;
end;

end.
