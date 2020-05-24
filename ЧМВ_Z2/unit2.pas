unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Grids, Logic;

type

  { TZ3 }

  TZ3 = class(TForm)
    Button: TButton;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    Help: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    SaveResult: TMenuItem;
    N1: TMenuItem;
    Quit: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    xEdit: TEdit;
    xLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveResultClick(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Z3: TZ3;
  x, a: real;
  calculations: array [1..128] of Calculation;
  last_ind: integer;

implementation

{$R *.lfm}

{ TZ3 }
procedure TZ3.FormCreate(Sender: TObject);
begin
  last_ind := 0;
end;

procedure TZ3.ButtonClick(Sender: TObject);
var
last_calc: Calculation;
begin
DataFromForm();
a:= calc(x);
last_calc.x:=x;
last_calc.a:=a;
inc(last_ind);
calculations[last_ind]:=last_calc;
StringGrid1.RowCount:= last_ind + 1;
StringGrid1.Cells[1, last_ind] := floattostr(x);
StringGrid1.Cells[2, last_ind] := floattostr(a);
end;

procedure TZ3.HelpClick(Sender: TObject);
begin
ShowMessage('Программа вычисляет многочлен при заданном значении x');
end;

procedure TZ3.OpenClick(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
if OpenDialog1.FileName <> '' then
begin
load_params(x, OpenDialog1.FileName);
xEdit.Text:= floattostr(x);
end;
end;
end;

procedure TZ3.QuitClick(Sender: TObject);
begin
  close;
end;

procedure TZ3.SaveClick(Sender: TObject);
begin
if SaveDialog1.Execute then
if SaveDialog1.FileName <> '' then
begin
DataFromForm();
save_params(a, SaveDialog1.FileName);
end;
end;

procedure TZ3.SaveResultClick(Sender: TObject);
begin
 //Memo.Lines.SaveToFile('Результат.txt');
end;

procedure TZ3.DataFromForm();
begin
if TryStrToFloat(xEdit.Text, x) = false then
begin
ShowMessage('Неправильно введён параметр x');
exit;
end;
end;

end.

