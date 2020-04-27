unit U533;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Unit533, Math;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    File1: TMenuItem;
    OpenTxtFile1: TMenuItem;
    CloseTxtFile1: TMenuItem;
    WriteSpTextFile1: TMenuItem;
    Work1: TMenuItem;
    BuildSp1: TMenuItem;
    Sum1: TMenuItem;
    Delete1: TMenuItem;
    DeleteSp1: TMenuItem;
    procedure OpenTxtFile1Click(Sender: TObject);
    procedure CloseTxtFile1Click(Sender: TObject);
    procedure WriteSpTextFile1Click(Sender: TObject);
    procedure BuildSp1Click(Sender: TObject);
    procedure DeleteSp1Click(Sender: TObject);
    procedure Sum1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Sp1:PUzel;
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

procedure TForm1.WriteSpTextFile1Click(Sender: TObject);
var
begin
   Writeln(ftxt,i,'. Содержимое двусвязанного списка');
   WriteSpText(Sp1,ftxt);
   Writeln(ftxt,'')
end;
end;

procedure TForm1.BuildSp1Click(Sender: TObject);
begin
   BuildSpisok(Sp1);
end;



procedure TForm1.DeleteSp1Click(Sender: TObject);
begin
   DelSpisok(Sp1);
end;
procedure TForm1.Sum1Click(Sender: TObject);
begin
 Writeln(ftxt,'');
  write(ftxt,'Искомое произведение равно=');
  Writeln(ftxt,SumElemSp(Sp1):7:2);
end;

end.
