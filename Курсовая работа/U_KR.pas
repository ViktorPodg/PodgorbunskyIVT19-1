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
    procedure OpenTxtFile1Click(Sender: TObject);  //��������� �������� ���������� �����
    procedure CloseTxtFile1Click(Sender: TObject); //��������� �������� ���������� �����
    procedure OpenTipFile1Click(Sender: TObject);  //��������� �������� ��������������� �����
    procedure CloseTipFile1Click(Sender: TObject); //��������� �������� ��������������� �����
    procedure FormCreate1Click(Sender: TObject);   //��������� ��� �������� �������� ��������
    procedure BuildList1Click(Sender: TObject);    //��������� ���������� ������
    procedure SaveListTxt1Click(Sender: TObject);  //��������� ���������� ������ � ��������� ����
    procedure BuildtipList1Click(Sender: TObject); //��������� ���������� ������ ������� �� ��������������� �����
    procedure SaveTipList1Click(Sender: TObject); //��������� ���������� ������ � �������������� ����
    procedure Exit1Click(Sender: TObject);        //��������� ������ �� ���������
    procedure DelList1Click(Sender: TObject);     //��������� �������� ������
    procedure Result1Click(Sender: TObject);      //��������� ������ ���������� �� ����
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    PList: PUzel;           //��������� �� ������
  ftxt: text;               //�������� ����������
   ftip : FZap;  // FZap � ��� ��������������� �����, �������� ����

implementation

{$R *.dfm}

//��������� �������� ���������� �����
procedure TForm1.OpenTxtFile1Click(Sender: TObject);
var
  s: string;
begin
 if not OpenDialog1.Execute then exit;
 s := OpenDialog1.FileName;
 AssignFile(ftxt,s);
 Append(ftxt);
end;

//��������� �������� ���������� �����
procedure TForm1.CloseTxtFile1Click(Sender: TObject);
begin
      CloseFile(ftxt);
      ShowMessage('�� ������� ��������� ����');
end;

//��������� �������� ��������������� �����
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

//��������� �������� ��������������� �����
procedure TForm1.CloseTipFile1Click(Sender: TObject);
begin
      CloseFile(ftip);
      ShowMessage('�� ������� �������������� ����');
end;

//��������� ��� �������� �������� ��������
procedure TForm1.FormCreate1Click(Sender: TObject);
begin
  StringGRid1.Cells[0,0]:='�';
  StringGRid1.Cells[1,0]:='������������ ������';
  StringGRid1.Cells[2,0]:='����� �������';
  StringGRid1.Cells[3,0]:='��������� �������';
  StringGRid1.Cells[4,0]:='��� ��������';
end;

 //��������� ���������� ������
procedure TForm1.BuildList1Click(Sender: TObject);
begin
    BuildSpisok(PList);
end;

//��������� ���������� ������ � ��������� ����
procedure TForm1.SaveListTxt1Click(Sender: TObject);
  var
s: string;
begin
      writeln(ftxt,'���������� ���� ������: ');
      writeln(ftxt);
      WriteSpText(PList,ftxt);
      writeln(ftxt,' ');
      ShowMessage('������ ������� � ��������� ����');
end;

//��������� ���������� ������ ������� �� ��������������� �����
procedure TForm1.BuildtipList1Click(Sender: TObject);
var
s:string;
begin
BuildTip(ftip);
end;

//��������� ���������� ������ � �������������� ����
procedure TForm1.SaveTipList1Click(Sender: TObject);
var
s:string;
begin
      WriteSpTip(PList,ftip);
      ShowMessage('������ ������� � �������������� ����');
end;


 //��������� ������ �� ���������
procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;


//��������� �������� ������
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
 //��������� ������ ���������� �� ����
procedure TForm1.Result1Click(Sender: TObject);
begin
 Result(PList, ftxt);
end;



end.
