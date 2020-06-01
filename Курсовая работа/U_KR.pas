unit U_KR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, Grids, Unit_KR, jpeg;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    File1: TMenuItem;
    List1: TMenuItem;
    FormCreate1: TMenuItem;
    BuildList1: TMenuItem;
    SaveListTxt1: TMenuItem;
    BuildtipList1: TMenuItem;
    SaveTipList1: TMenuItem;
    Result1: TMenuItem;
    Delete1: TMenuItem;
    DelList1: TMenuItem;
    Exit1: TMenuItem;
    StringGrid1: TStringGrid;
    OpenTxtFile1: TMenuItem;
    OpenTipFile1: TMenuItem;
    CloseTxtFile1: TMenuItem;
    CloseTipFile1: TMenuItem;
    Image1: TImage;
    procedure OpenTxtFile1Click(Sender: TObject);  //Процедура открытия текстового файла
    procedure CloseTxtFile1Click(Sender: TObject); //Процедура закрытия текстового файла
    procedure OpenTipFile1Click(Sender: TObject);  //Процедура открытия типизированного файла
    procedure CloseTipFile1Click(Sender: TObject); //Процедура закрытия типизированного файла
    procedure FormCreate1Click(Sender: TObject);   //Процедура для создания названий столбцов
    procedure BuildList1Click(Sender: TObject);    //Процедура заполнения списка
    procedure SaveListTxt1Click(Sender: TObject);  //Процедура сохранения списка в текстовый файл
    procedure BuildtipList1Click(Sender: TObject); //Процедура заполнения списка данными из типизированного файла
    procedure SaveTipList1Click(Sender: TObject); //Процедура сохранения списка в типизированный файл
    procedure Exit1Click(Sender: TObject);        //Процедура выхода из программы
    procedure DelList1Click(Sender: TObject);     //Процедура удаления списка
    procedure Result1Click(Sender: TObject);      //Процедура вывода информации за день
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    PList: PUzel;           //указатель на список
  ftxt: text;               //файловая переменная
   ftip : FZap;  // FZap – тип типизированного файла, определён выше

implementation

{$R *.dfm}

//Процедура открытия текстового файла
procedure TForm1.OpenTxtFile1Click(Sender: TObject);
var
  s: string;
begin
 if not OpenDialog1.Execute then exit;
 s := OpenDialog1.FileName;
 AssignFile(ftxt,s);
 Append(ftxt);
end;

//Процедура закрытия текстового файла
procedure TForm1.CloseTxtFile1Click(Sender: TObject);
begin
      CloseFile(ftxt);
      ShowMessage('Вы закрыли текстовый файл');
end;

//Процедура открытия типизированного файла
procedure TForm1.OpenTipFile1Click(Sender: TObject);
var
s: string;
begin
  if not OpenDialog1.Execute then exit;
  s := OpenDialog1.FileName;
  AssignFile(ftip,s);
  reset(ftip);
  seek(ftip,filesize(ftip));
end;

//Процедура закрытия типизированного файла
procedure TForm1.CloseTipFile1Click(Sender: TObject);
begin
      CloseFile(ftip);
      ShowMessage('Вы закрыли типизированный файл');
end;

//Процедура для создания названий столбцов
procedure TForm1.FormCreate1Click(Sender: TObject);
begin
  StringGRid1.Cells[0,0]:='№';
  StringGRid1.Cells[1,0]:='Наименование товара';
  StringGRid1.Cells[2,0]:='Объем продажи';
  StringGRid1.Cells[3,0]:='Стоимость покупки';
  StringGRid1.Cells[4,0]:='ФИО продавца';
end;

 //Процедура заполнения списка
procedure TForm1.BuildList1Click(Sender: TObject);
begin
    BuildSpisok(PList);
end;

//Процедура сохранения списка в текстовый файл
procedure TForm1.SaveListTxt1Click(Sender: TObject);
  var
s: string;
begin
      writeln(ftxt,'Содержимое базы данных: ');
      writeln(ftxt);
      WriteSpText(PList,ftxt);
      writeln(ftxt,' ');
      ShowMessage('Список сохранён в текстовый файл');
end;

//Процедура заполнения списка данными из типизированного файла
procedure TForm1.BuildtipList1Click(Sender: TObject);
var
s:string;
begin
BuildTip(ftip);
end;

//Процедура сохранения списка в типизированный файл
procedure TForm1.SaveTipList1Click(Sender: TObject);
var
s:string;
begin
      WriteSpTip(PList,ftip);
      ShowMessage('Список сохранён в типизированный файл');
end;


 //Процедура выхода из программы
procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;


//Процедура удаления списка
procedure TForm1.DelList1Click(Sender: TObject);
var
i,j:integer;
begin
  for i:=1 to StringGRid1.RowCount-1 do
  for j:=0 to StringGRid1.ColCount-1 do
  begin
    StringGRid1.Cells[j, i]:='';
  end;
  DelSpisok(PList);
end;
 //Процедура вывода информации за день
procedure TForm1.Result1Click(Sender: TObject);
begin
 Result(PList, ftxt);
end;



end.
