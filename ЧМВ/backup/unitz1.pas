unit Unitz1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, Unit1;

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
  g,l,T:real;

implementation

{$R *.lfm}

{ TZ1 }

procedure TZ1.ButtonClick(Sender: TObject);
begin
  DataFromForm();
  g:=strToFloat(gEdit.text);
  T:=calc_population(l,g);
  Memo.Lines.Add('Длина нити='+ FloatToStr(l)+'           '
   +'Ускорение своб.пад.='+ FloatToStr(g) +'   '
   +'Результат='+FloatToStr(T));
end;

procedure TZ1.OpenClick(Sender: TObject);
begin
  if FSaveDialog.Execute then
      begin
        if FSaveDialog.FileName <> '' then  // пользователь мог не выбрать имя файла, а просто закрыть окно//
          begin
          load_params(l, FSaveDialog.FileName);
          lEdit.Text:= floattostr( l );
          end;
      end;
end;

procedure TZ1.QuitClick(Sender: TObject);
begin
 close;
end;

procedure TZ1.SaveClick(Sender: TObject);
var f: textfile;
  FName: string;
begin
  if FSaveDialog.Execute then
      if FSaveDialog.FileName <> '' then
        begin
          DataFromForm();
          save_params(l, FSaveDialog.FileName);
end;
end;

procedure TZ1.SaveResultClick(Sender: TObject);
begin
  if FSaveDialog.Execute then
      if FSaveDialog.FileName <> '' then
          Memo.Lines.SaveToFile( FSaveDialog.FileName );
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

