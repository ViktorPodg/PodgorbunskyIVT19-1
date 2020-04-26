unit U136;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Unit136;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    Zupolnmass1: TMenuItem;
    Write1: TMenuItem;
    Rezalt1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    Delete1: TMenuItem;
    Hands1: TMenuItem;
    Writetotextfile1: TMenuItem;
    OpenTxt1: TMenuItem;
    CloseTxtFile1: TMenuItem;
    DenDinMas1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Result1: TMenuItem;
    procedure Hands1Click(Sender: TObject);
    procedure Writetotextfile1Click(Sender: TObject);
    procedure OpenTxt1Click(Sender: TObject);
    procedure CloseTxtFile1Click(Sender: TObject);
    procedure DenDinMas1Click(Sender: TObject);
    procedure Result1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dm: DinMas;
  fDM: Tipfile;
  ftxt: Text;

implementation

{$R *.dfm}
procedure TForm1.OpenTxt1Click(Sender: TObject);
var s:string;
begin
   if not OpenDialog1.Execute then exit;
  s:= OpenDialog1.FileName;
  AssignFile(ftxt,s);
  Append(ftxt);
end;
 procedure TForm1.CloseTxtFile1Click(Sender: TObject);
begin
 CloseFile(ftxt);
end;

 procedure TForm1.DenDinMas1Click(Sender: TObject);
begin
  SetLength(dm,0);
end;
procedure TForm1.Hands1Click(Sender: TObject);
begin
  ZapMassHand(dm);
end;
procedure TForm1.Writetotextfile1Click(Sender: TObject);
begin
  WriteMassText(dm,ftxt);
end;

procedure TForm1.Result1Click(Sender: TObject);
begin
 Result(dm,ftxt);
end;

end.
