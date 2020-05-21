unit Unitz1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Math, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TZ1 }

  TZ1 = class(TForm)
    Button: TButton;
    MainMenu1: TMainMenu;
    Memo: TMemo;
    FileMenu: TMenuItem;
    Open: TMenuItem;
    FOpenDialog: TOpenDialog;
    Save: TMenuItem;
    FSaveDialog: TSaveDialog;
    SaveResult: TMenuItem;
    N1: TMenuItem;
    Quit: TMenuItem;
    lEdit: TEdit;
    gEdit: TEdit;
    lLable: TLabel;
    gLable: TLabel;
    procedure ButtonClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveResultClick(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Z1: TZ1;
  l,g: real;

implementation

{$R *.lfm}

{ TZ1 }

procedure TZ1.ButtonClick(Sender: TObject);
var T: real;
begin
DataFromForm();
g:=strToFloat(gEdit.text);
T:=2*pi*sqrt(l/g);

    Memo.Lines.Add('Длина нити='+ FloatToStr(l)+'           '
   +'Ускорение своб.пад.='+ FloatToStr(g) +'   '
   +'Результат='+FloatToStr(T));
end;

procedure TZ1.OpenClick(Sender: TObject);
var f: textfile;
  FName, s1: string;
begin
  if FOpenDialog.Execute then
begin
FName := FOpenDialog.FileName;
AssignFile(f,FName);
Reset(f);
readln(f,s1);
lEdit.Text:= s1;
end;
closeFile(f);
end;

procedure TZ1.QuitClick(Sender: TObject);
begin
 close;
end;

procedure TZ1.SaveClick(Sender: TObject);
var f: textfile;
  FName, s1: string;
begin
if FSaveDialog.Execute then
FName := FSaveDialog.FileName;
AssignFile(f,FName);
Rewrite(f);
s1:=lEdit.Text;
writeln(f,s1);
closeFile(f);
end;

procedure TZ1.SaveResultClick(Sender: TObject);
begin
  Memo.Lines.SaveToFile('Result.txt');
end;

procedure TZ1.DataFromForm();
begin
  if TryStrToFloat(lEdit.Text, l) = false then
    begin
    lEdit.Color:= clGradientActiveCaption;
    ShowMessage('Неправильно введён параметр l');
    exit;
    end;
end;

end.

