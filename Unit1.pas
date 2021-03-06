unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, Grids, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, IniFiles, DateUtils;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Main1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TrackBar1: TTrackBar;
    Edit3: TEdit;
    Label8: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Image1: TImage;
    StringGrid1: TStringGrid;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Visualisation1: TMenuItem;
    N2: TMenuItem;
    Chart1: TChart;
    Series1: TPointSeries;
    Button7: TButton;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    TrackBar2: TTrackBar;
    Label13: TLabel;
    Label14: TLabel;
    Image2: TImage;
    Button6: TButton;
    Button8: TButton;
    Button9: TButton;
    Memo1: TMemo;
    Label15: TLabel;
    ProgressBar1: TProgressBar;
    Button10: TButton;
    Label16: TLabel;
    procedure Open1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Visualisation1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1MouseLeave(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure WriteLog(s: String);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    loaded: boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;
  BtmImgArr: array of TBitmap;
  BtmImgArr_Temp: array of TBitmap;
  FileCount:integer;
  Timei: integer = 0;
  S_data: array of array of real;
  x0, y0, x1, y1:integer;
  FirstPoint, SecondPoint,fire_direction: boolean;
  gr_grad: integer;
  ShowLog:boolean;
  DateToLog:string;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.WriteLog(s: String);
var
  logFile: TextFile;
begin
  AssignFile(logFile, 'log\'+DateToStr(now)+'.log');
  {$I-}
  Append(logFile);
  {$I+}
  if IOresult <> 0 then
  begin
    rewrite(logFile);
  end;
  Writeln(logFile,s);
  Closefile(logFile);
end;

function  CreateBlackRedLogPalette: HPalette;
var
  lp: PLogPalette;
  i: integer;
begin
  Result := 0;
  GetMem(lp, 4 + 4*256);              // получаем память для вспомогательного массива
  if lp = nil then exit;              // если не получили, то выход
  lp^.palVersion := $300;             // версия - 768
  lp^.palNumEntries := 256;           // число цветов
  lp^.palPalEntry[0].peRed   := 0; // Цвет 0 чёрный
  lp^.palPalEntry[0].peGreen := 0;
  lp^.palPalEntry[0].peBlue  := 0;
  lp^.palPalEntry[0].peflags := 0;
  for i := 1 to 255 do
    with lp^.palPalEntry[i] do
      begin
        peRed   := 255; // Остальные цвета - красный
        peGreen :=   0;
        peBlue  :=   0;
        peflags :=   0;
      end;
  Result := CreatePalette(lp^); // создаем палитру
  FreeMem(lp);                  // освобождаем память массива
end;

procedure TForm1.Open1Click(Sender: TObject);
var
  i: integer;
begin
  OpenDialog1.Options := [ofAllowMultiSelect, ofFileMustExist];
  OpenDialog1.Filter := 'BitMap (*.bmp)|*.bmp|All files (*.*)|*.*';
  if not OpenDialog1.Execute then Exit;
  SetLength(BtmImgArr, OpenDialog1.Files.Count);
  SetLength(S_data,2, OpenDialog1.Files.Count);
  SetLength(BtmImgArr_Temp, OpenDialog1.Files.Count);
  FileCount:=OpenDialog1.Files.Count;
  for i := 0 to OpenDialog1.Files.Count - 1 do
    begin
      BtmImgArr[i] := TBitmap.Create;
      BtmImgArr_Temp[i] := TBitmap.Create;
      BtmImgArr[i].LoadFromFile(OpenDialog1.Files.Strings[i]);
      BtmImgArr[i].PixelFormat := pf8bit;
      BtmImgArr_temp[i].LoadFromFile(OpenDialog1.Files.Strings[i]);
      BtmImgArr_Temp[i].PixelFormat := pf8bit;
    end;
  //////////////////////////////////////////////////////////////////////////////
  Image1.Height:=BtmImgArr[0].Height;
  Image1.Width:=BtmImgArr[0].Width;
  Image1.Top:=round(Groupbox4.Height/2 - Image1.Height/2);
  Image1.left:=round(Groupbox4.Width/2 - Image1.Width/2)-20;
  image1.Picture.Bitmap:=BtmImgArr[0];
  TrackBar1.Max:=FileCount-1;
  Button1.Enabled:=true;
  Button2.Enabled:=true;
  Button3.Enabled:=true;
  Button4.Enabled:=true;
  Button5.Enabled:=true;
  LAbel12.Caption:='Summary count of frames: '+ IntToStr(OpenDialog1.Files.Count);
  TrackBar1.Enabled:=true;
  Button6.Enabled:=true;
  Memo1.Lines.Add(datetolog+'All frames loaded, count: ' +IntToStr(FileCount));
  //////////////////////////////////////////////////////////////////////////////
  loaded:=True;
  ProgressBar1.Min:=0;
  ProgressBar1.Max:=FileCount;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Timei = FileCount then
    Timei:=0;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
  TrackBar1.Position:=Timei;
  Timei:=Timei+1;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if Button10.Caption = '---->' then
    begin
      Button10.Caption := '<----';
      fire_direction:=false;
    end                                  //if fire direction = false then from right to left
  else                                   //if fire direction = true then from left to right
    begin
      Button10.Caption := '---->';
      fire_direction:=true;
    end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Timei = 0 then
    Timei:=Filecount;
  Timei:=Timei-1;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
  TrackBar1.Position:=Timei;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Timei:=Timei+1;
  if Timei = FileCount then
    Timei:=0;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
  TrackBar1.Position:=Timei;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Timer1.Interval:=Round(1000/StrToInt(Edit1.Text))
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Timei:=0;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
  TrackBar1.Position:=Timei;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Timei:=TrackBar1.Position;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
var i,j,x,y: integer;
    spb: PByteArray; // spb значит Source Pointer Byte, чтобы самому не путаться
    dpb: PByteArray;
begin
  gr_grad:= TrackBar2.max - TrackBar2.Position;
  Label14.Caption:= IntToStr(gr_grad);
  With Image2.Canvas do
    begin
      j:=0;
      for i := 0 to Image2.Height do
        begin
          Pen.Color:=rgb(255-i,255-i,255-i);
          Moveto(0,i);
          Lineto(Image1.Width,i);
          Inc(j);
        end;
      Pen.Color:=clRed;
      Pen.Width:=3;
      for I := 0 to Image2.Height-1 do
        if Pixels[15,i] = rgb(gr_grad,gr_grad,gr_grad) then
          begin
            moveto(0,i);
            Lineto(Image2.Width,i);
          end;
    end;

  if loaded then
    begin
      BtmImgArr_Temp[timei].Palette := CreateBlackRedLogPalette;
      for y := 0 to BtmImgArr[timei].Height-1 do
        begin
          spb := BtmImgArr[timei].ScanLine[y]; // Теперь spb указывает на массив байтов y-ой строки битмапа
          dpb := BtmImgArr_Temp[timei].ScanLine[y];
          for x := 0 to BtmImgArr[timei].Width-1 do
            begin
              dpb^[x] := $F9 * byte(spb^[x] > gr_grad);
            end;
        end;
      Label15.Visible:=true;
      Image1.Picture.Bitmap:=BtmImgArr_Temp[timei];
      Image1.repaint;
    end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var TempBtm: TBitMap;
    i:integer;
begin
  if loaded then
    begin
      label2.Caption:='Pos X:' + IntToStr(X);
      label3.Caption:='Pos Y:' + IntToStr(Y);

      Image1.Picture.Bitmap:=BtmImgArr[Timei];
      Image1.Picture.Bitmap.PixelFormat:=pf32bit;
      Image1.Canvas.Pen.Color:=clRed;
      Image1.Canvas.MoveTo(X,0);
      Image1.Canvas.LineTo(X,Image1.Height);
      Image1.Canvas.MoveTo(0,Y);
      Image1.Canvas.LineTo(Image1.Width,Y);
      image1.Canvas.TextOut(x+10,y-35, 'X: '+ IntToStr(X));
      image1.Canvas.TextOut(x+10,y-20, 'Y: '+ IntToStr(Y));
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var time1,time2:extended;
    spb: PByteArray; // spb значит Source Pointer Byte, чтобы самому не путаться
    dpb: PByteArray; // dpb значит Dest Pointer Byte, чтобы самому не путаться
    x, y,i: integer;
begin
  time1:=now();
  Label15.Visible:=false;
  for i := 0 to Length(BtmImgArr)-1 do
    begin
      BtmImgArr_Temp[i].Palette := CreateBlackRedLogPalette;
      for y := 0 to BtmImgArr[i].Height-1 do
        begin
          spb := BtmImgArr[i].ScanLine[y]; // Теперь spb указывает на массив байтов y-ой строки битмапа
          dpb := BtmImgArr_Temp[i].ScanLine[y];
          for x := 0 to BtmImgArr[i].Width-1 do
            begin
              dpb^[x] := $F9 * byte(spb^[x] >= gr_grad);
            end;
        end;
      Memo1.Lines.Add(datetolog+'Binarization frame ' +IntToStr(i) + ' complete!');
      ProgressBar1.Position:=ProgressBar1.Position+1;
    end;
  Button8.Enabled:=true;
  Image1.Picture.Bitmap:=BtmImgArr_Temp[timei];
  Image1.Repaint;
  time2:=now();
  Memo1.Lines.Add(datetolog+'Binarization is done! Time spent: '+inttostr(MilliSecondsBetween(Time2,time1))+'ms');
  ProgressBar1.Position:=0;
end;

procedure TForm1.Button8Click(Sender: TObject);
var fps,i,x,y: integer;
    sample_length:double;
    spb: PByteArray;
    time1,time2,sum,color:extended;
begin
  if FirstPoint and SecondPoint then
    begin
      time1:=now();
      sum:=0;
      Series1.Clear;
      FPS:= StrToInt(Edit3.Text);
      sample_length:=StrToInt(Edit2.Text)/1000;
      if not fire_direction then
        begin
          for i := 0 to Length(BtmImgArr)-1 do
            begin
              for y := y1 to y0 do
                begin
                  spb := BtmImgArr_temp[i].ScanLine[y]; // Теперь spb указывает на массив байтов y-ой строки битмапа
                  for x := x0 to x1 do
                    begin
                      if (spb^[x+2] = $F9) and (spb^[x] = $F9) and (spb^[x-1] = 0) then
                        begin
                          sum:=sum+(x1-x)*(sample_length/(x1-x0));
                          break;
                        end;
                    end;
                end;
              Memo1.Lines.Add(datetolog+'Calculation frame ' +IntToStr(i) + ' complete!');
              S_data[0,i]:=i*(1/fps);
              S_data[1,i]:=sum/(y0-y1);
              sum:=0;
              ProgressBar1.Position:=ProgressBar1.Position+1;
            end;
        end
      else
        begin
          for i := 0 to Length(BtmImgArr)-1 do
            begin
              for y := y1 to y0 do
                begin
                  spb := BtmImgArr_temp[i].ScanLine[y]; // Теперь spb указывает на массив байтов y-ой строки битмапа
                  for x := x1 downto x0 do
                    begin
                      if (spb^[x-2] = $F9) and (spb^[x] = $F9) and (spb^[x+1] = 0) then
                        begin
                          sum:=sum+(x-x0)*(sample_length/(x1-x0));
                          break;
                        end;
                    end;
                end;
              Memo1.Lines.Add(datetolog+'Calculation frame ' +IntToStr(i) + ' complete!');
              S_data[0,i]:=i*(1/fps);
              S_data[1,i]:=sum/(y0-y1);
              sum:=0;
              ProgressBar1.Position:=ProgressBar1.Position+1;
            end;
        end;
      StringGrid1.RowCount:=Length(BtmImgArr);
      for i := 0 to Length(BtmImgArr)-1 do
        begin
          StringGrid1.Cells[0,i+1]:=FloatToStr(S_data[0,i]);
          StringGrid1.Cells[1,i+1]:=FloatToStr(S_data[1,i]);
          Series1.AddXY(S_data[0,i]*1000000,S_data[1,i]*1000);
        end;

      time2:=now();
      Save1.Enabled:=true;
      Memo1.Lines.Add(datetolog+'Calculation is done! Time spent: '+inttostr(MilliSecondsBetween(Time2,time1))+'ms');
      ProgressBar1.Position:=0;
    end
  else
    ShowMessage('One or more points are not determined!')
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if not ShowLog then
    begin
      ShowLog:=true;
      Form1.Height:=Form1.Height+150;
      Memo1.Visible:=true;
      Button9.Caption:='↑';
      Button9.Hint:='Hide logs';
    end
  else
    begin
      ShowLog:=false;
      Button9.Caption:='↓';
      Button9.Hint:='Show logs';
      Form1.Height:=Form1.Height-150;
      Memo1.Visible:=false;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var Ini: TIniFile;
    i:integer;
begin
  if Memo1.Lines.Count <> 0 then
    begin
      writelog('----------------------------------------');
      for i := 0 to Memo1.Lines.Count-1 do
        writelog(Memo1.Lines[i]);
      writelog('----------------------------------------');
    end;
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Options.ini');
  Ini.WriteInteger('Options','FPS',StrToInt(Edit3.Text));
  Ini.WriteInteger('Options','Sample Length',StrToInt(Edit2.Text));
  Ini.WriteBool('Options','ShowLogs',ShowLog);

  Ini.WriteBool('Options','Fire Direction',fire_direction);
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Ini: TIniFile;
    i,j:integer;
begin
  Ini:=TiniFile.Create(extractfilepath(paramstr(0))+'Options.ini');
  Edit3.Text:=IntToStr(Ini.ReadInteger('Options','FPS',360000));
  Edit2.Text:=IntToStr(Ini.ReadInteger('Options','Sample Length',80));
  fire_direction:=Ini.ReadBool('Options','Fire Direction',True);
  if fire_direction then
    begin
      Button10.Caption := '---->';
      fire_direction:=true;
    end
  else
    begin
      Button10.Caption := '<----';
      fire_direction:=false;
    end;

  ShowLog:=Ini.ReadBool('Options','ShowLogs',false);
  if ShowLog then
    begin
      Form1.Height:=Form1.Height+150;
      Memo1.Top:=Button9.Top+23;
      Memo1.Width:=Form1.Width-22;
      Memo1.Visible:=true;
      Button9.Caption:='↑';
      Button9.Hint:='Hide logs';
    end
  else
    begin
      Button9.Caption:='↓';
      Button9.Hint:='Show logs';
      Memo1.Visible:=false;
    end;
  Loaded:=False;
  gr_grad:= TrackBar2.max - TrackBar2.Position;
  Label14.Caption:=IntToStr(gr_grad);
  With Image2.Canvas do
    begin
      Brush.Color:=rgb(gr_grad,gr_grad,gr_grad);
      Pen.Color:=rgb(gr_grad,gr_grad,gr_grad);
      rectangle(0,0,Image2.Width,Image2.Height)
    end;
  StringGrid1.Cells[0,0]:='Time, sec';
  StringGrid1.Cells[1,0]:='Length, m';
  Button8.Enabled:=false;
  Form1.Top:=round(Screen.Height/2-Form1.Height/2);
  Form1.Left:=round(Screen.Width/2-Form1.Width/2);
  datetolog:='['+DateToStr(now)+' | '+ TimeToStr(now) +'] ';
  with Image2.Canvas do
    begin
      j:=0;
      for i := 0 to Image1.Height-1 do
        begin
          Pen.Color:=rgb(255-i,255-i,255-i);
          Moveto(0,i);
          Lineto(Image1.Width,i);
          Inc(j);
        end;
      Pen.Color:=clRed;
      pen.Width:=3;
      for I := 0 to Image2.Height-1 do
        if Pixels[15,i] = rgb(gr_grad,gr_grad,gr_grad) then
          begin
            moveto(0,i);
            Lineto(Image2.Width,i);
          end;
    end;
end;

procedure TForm1.Save1Click(Sender: TObject);
var savefile : textfile;
    i : integer;
    savefilename, savefilepath: string;
    temptxt: string;
begin
  SaveDialog1.Execute;
  savefilename:=savedialog1.FileName;
  SysUtils.ForceDirectories(SaveFileName);
  savefilename := savefilename+'\'+'Data.txt';
  assignfile (savefile,savefilename);
  rewrite(savefile);
  for i:=1 to Length(S_data[1])-1 do
    if S_data[1,i] <= StrToInt(Edit3.Text)/1000 then
      Writeln(savefile, FloatToStr(S_data[0,i]) + #9 + FloatToStr(S_data[1,i]))
    else break;
  closefile(savefile);
  savefilename:=savedialog1.FileName;
  for i:=0 to Length(BtmImgArr_temp)-1 do
    begin
      with BtmImgArr_temp[i].Canvas do
        begin
          Pen.Width:=3;
          pen.Color:=clRed;
          moveto(0,0);
          lineto(0,BtmImgArr_temp[i].Height);
          lineto(10,BtmImgArr_temp[i].Height-10);
          moveto(0,0);
          lineto(BtmImgArr_temp[i].Width,0);
          lineto(BtmImgArr_temp[i].Width-10,10);
          Font.Size:=12;
          TextOut(BtmImgArr_temp[i].Width-20,20,'X');
          TextOut(20,BtmImgArr_temp[i].Height-20,'Y');
        end;
      BtmImgArr_temp[i].SaveToFile(savefilename+'\'+IntToStr(i) + '.bmp');
    end;
  Memo1.Lines.Add(datetolog+'All frames saved, count: ' +IntToStr(FileCount));
  Memo1.Lines.Add(datetolog+'Saved to dir: ' + savefilename);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    begin
      x0:=X;
      Label4.Caption:= 'X0 Pos: ' + IntToStr(X);
      y0:=Y;
      Label5.Caption:= 'Y0 Pos: ' + IntToStr(Y);
      FirstPoint:=true;
      button7.Enabled:=True;
      If (FirstPoint = true)and(SecondPoint = true) then
        button6.Enabled:=True;
    end;
  if Button = mbRight then
    begin
      x1:=X;
      Label6.Caption:= 'X1 Pos: ' + IntToStr(X);
      y1:=Y;
      Label7.Caption:= 'Y1 Pos: ' + IntToStr(Y);
      SecondPoint:=true;
      button7.Enabled:=True;
      If (FirstPoint = true)and(SecondPoint = true) then
        button6.Enabled:=True;
    end;
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  if loaded then
    Image1.Picture.Bitmap:=BtmImgArr_Temp[Timei];
end;


procedure TForm1.Visualisation1Click(Sender: TObject);
begin
  if  Visualisation1.Checked = false then
    Visualisation1.Checked:=True
  else
    Visualisation1.Checked:=false;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i:integer;
begin
  for i := 0 to OpenDialog1.Files.Count - 1 do
    begin
      BtmImgArr[i] := TBitmap.Create;
      BtmImgArr_Temp[i] := TBitmap.Create;
      BtmImgArr[i].LoadFromFile(OpenDialog1.Files.Strings[i]);
    end;

  Timei:=0;
  Image1.Height:=BtmImgArr[Timei].Height;
  Image1.Width:=BtmImgArr[Timei].Width;
  Image1.Picture.Bitmap:=BtmImgArr[Timei];

  Series1.Clear;
  StringGrid1.RowCount:=2;
  StringGrid1.Cells[0,1]:='';
  StringGrid1.Cells[1,1]:='';

  x0:=0;
  Label4.Caption:= 'X0 Pos:';
  y0:=0;
  Label5.Caption:= 'Y0 Pos:';
  x1:=0;
  Label6.Caption:= 'X1 Pos:';
  y1:=0;
  Label7.Caption:= 'Y1 Pos:';

  FirstPoint:=false;
  SecondPoint:=false;
  Button6.Enabled:=false;
  button7.Enabled:=false;
end;

end.
