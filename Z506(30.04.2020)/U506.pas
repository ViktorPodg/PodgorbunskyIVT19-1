unit U506;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Unit506;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    File1: TMenuItem;
    OpenTxtFile1: TMenuItem;
    CloseTxtFile1: TMenuItem;
    List1: TMenuItem;
    BuildList1: TMenuItem;
    SaveListTxt1: TMenuItem;
    Delete1: TMenuItem;
    DelList1: TMenuItem;
    procedure OpenTxtFile1Click(Sender: TObject);
    procedure CloseTxtFile1Click(Sender: TObject);
    procedure BuildList1Click(Sender: TObject);
    procedure SaveListTxt1Click(Sender: TObject);
    procedure DelList1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PList:PUzel;
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

procedure TForm1.BuildList1Click(Sender: TObject);
begin
   BuildSpisok(PList);
end;

procedure TForm1.SaveListTxt1Click(Sender: TObject);
begin
  Writeln(ftxt,'Содержимое двусвязанного списка');
  WriteSpText(PList,ftxt);
  Writeln(ftxt,'')
end;

procedure TForm1.DelList1Click(Sender: TObject);
begin
   DelSpisok(PList);
end;

end.
