unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,Unit1, jpeg;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  i:integer = 0;

implementation

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 i:=i+1;
 If i = 2 then
    begin
      Form1.Show;
      Form2.Destroy;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Top:=round(Screen.Height/2-Form2.Height/2);
  Form2.Left:=round(Screen.Width/2-Form2.Width/2);
end;

end.
