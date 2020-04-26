unit U531;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Unit531;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    File1: TMenuItem;
    OpenTxtFile1: TMenuItem;
    CloseTxtFile1: TMenuItem;
    WriteTxtFile1: TMenuItem;
    Build1: TMenuItem;
    BuildSp11: TMenuItem;
    BuildSp21: TMenuItem;
    EndElem1: TMenuItem;
    Delete1: TMenuItem;
    DeleteSp11: TMenuItem;
    DeleteSp21: TMenuItem;
    procedure OpenTxtFile1Click(Sender: TObject);
    procedure CloseTxtFile1Click(Sender: TObject);
    procedure WriteTxtFile1Click(Sender: TObject);
    procedure BuildSp11Click(Sender: TObject);
    procedure BuildSp21Click(Sender: TObject);
    procedure EndElem1Click(Sender: TObject);
    procedure DeleteSp11Click(Sender: TObject);
    procedure DeleteSp21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Sp1,Sp2:PUzel;
  ftxt:Text;
implementation

{$R *.dfm}

procedure TForm1.OpenTxtFile1Click(Sender: TObject);
var
  s:string;
begin
  if not OpenDialog1.Execute then Exit;
  s:=OpenDialog1.FileName;
  AssignFile(ftxt,s);
  Append(ftxt);
end;

procedure TForm1.CloseTxtFile1Click(Sender: TObject);
begin
  CloseFile(ftxt);

end;

procedure TForm1.WriteTxtFile1Click(Sender: TObject);
var
  n:Integer;
  P:PUzel;
begin
  n:=StrToInt(InputBox('Для нач-го списка n=1, для результата n=2','',''));
  if (n=1) then p:=Sp1 else p:=Sp2;
  if (n=1) then Writeln(ftxt,'Begin spisok')
       else Writeln(ftxt,'Rezult spisok');
  while not (p=nil) do
   begin
     write(ftxt, p^.x:5:2,'');
     p:=p^.next;
     end;
     Writeln(ftxt,'');
   end;

procedure TForm1.BuildSp11Click(Sender: TObject);
begin
  BuildSpisok(Sp1);
end;

procedure TForm1.BuildSp21Click(Sender: TObject);
begin
  NewSpisok(Sp1,Sp2);
end;

procedure TForm1.EndElem1Click(Sender: TObject);
 var n:Real;
begin
  n:=EndElemSp(Sp1);
  ShowMessage('n='+FloatToStr(n));
end;

procedure TForm1.DeleteSp11Click(Sender: TObject);
begin
  DelSpisok(Sp1);
end;

procedure TForm1.DeleteSp21Click(Sender: TObject);
begin
  DelSpisok(Sp2);
end;

end.
