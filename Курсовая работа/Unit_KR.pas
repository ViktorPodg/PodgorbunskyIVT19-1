unit Unit_KR;

interface

uses SysUtils, Dialogs,Controls;          //������ ��� �����/������ ������
 type
 magaz = record                           //��� �������
        NazTov:string[20];                //������������ ������
        ObTov:Integer;                    //����� �������
        StoimPok:Real;                    //��������� �������
        Fam,Nam,Otch:string[20];          //��� ��������
         end;
   PUzel = ^Zp;                           //��� ��������� �� ����
   Zp = record                            //��� ���� ������
         x: magaz;                        //�������� � ��������
         next: PUzel;                     //��������� �� ��������� ����
         pred: PUzel;                     //��������� �� ���������� ����
        end;
   FZap = file of magaz; //�������� ��� ��� �������� ������ � ��������


   procedure AddFirst(var f: PUzel; a: PUzel);  {�������� ���� � ������ � ������}

   procedure AddAfter(var old:PUzel; a: PUzel); {�������� ���� � ����� old}

   procedure BuildSpisok(var f: PUzel);{��������� ������; f-��������� �� ������ ������}

   procedure WriteSpText(var f: PUzel;var ftxt:Text);{����� ������ � ��������� ����}

   procedure DelFirstElement(var f,a: PUzel); {�������� �� ������ ������ ����
   � ������� ��� ������������}

   procedure DelSpisok(var f: PUzel);   //������� ������

   procedure WriteSpTip(var f: PUzel; var ftip: FZap);  //������ � �������������� ����

   procedure BuildTip(var ftip: FZap);{����� ������ � �������������� ����}

   procedure Result(var t: PUzel; var ftxt: Text); {������� �������� ���������}

implementation

uses U_KR;

procedure AddFirst(var f: PUzel; a: PUzel);
    begin
     a^.next := f;
     if f<> nil then f^.pred := a;
     f:=a;
    end;


   procedure AddAfter(var old:PUzel; a: PUzel);
    begin
     a^.next := old^.next;
     old^.next := a;
     if a^.next <> nil then a^.next^.pred := a;
     a^.pred := old;
    end;

   procedure BuildSpisok(var f: PUzel);
    var
     a,d :PUzel;
     ch: char;
     i: integer;
    begin
       i:=1;
  while  Form1.StringGRid1.Cells[1,i]<>'' do
    begin
      inc(i);
    end;
     f:= nil;
     repeat
      new(a);
      with a^.x do
       begin
       Form1.StringGRid1.Cells[0, i] := IntTostr(i);
       NazTov := InputBox('������������ ������', ' ', ' ');
      Form1.StringGRid1.Cells[1, i] := a^.x.NazTov;
      ObTov := StrToInt(InputBox('����� �������', ' ', ' '));
      Form1.StringGRid1.Cells[2, i] :=IntToStr(a^.x.ObTov);
      StoimPok:= StrToFloat(InputBox('��������� �������', ' ', ' '));
     Form1.StringGRid1.Cells[3, i] := FloatToStr(a^.x.StoimPok);
      Fam := InputBox('������� ������� ��������', ' ', ' ');
      Nam := InputBox('������� ��� ��������', ' ', ' ');
      Otch := InputBox('������� �������� ��������', ' ', ' ');
      Form1.StringGRid1.Cells[4, i] := a^.x.Fam + ' ' + a^.x.Nam + ' ' + a^.x.Otch;
      inc(i);
       end;
      a^.next := nil;                                             
      a^.pred := nil;                                             
      if (f = nil) then
         begin
          AddFirst(f,a);
          d:= f;
         end
        else
         begin
          AddAfter(d,a);
          d := a;
         end;
      ch:= InputBox('��� ���������� ����� ������� Y',' ',' ')[1];
     until (ch = 'Y') or (ch ='y');
    end;


   procedure WriteSpText(var f: PUzel; var ftxt:Text);
    var
     p: PUzel;
     s: string;
     y: magaz;
    begin
     p:= f;
     while not(p = nil) do
      begin
       y:= p^.x;
       s:=y.NazTov +' '+ IntToStr(y.ObTov) + ' '+ FloatToStr(y.StoimPok) +' '+y.Fam +' ' + y.Nam +' '+ y.Otch;
       writeln(ftxt, s);
       p:= p^.next;
      end;
    end;

    procedure DelFirstElement(var f,a: PUzel);
    begin
      a := f;
      f := f^.next;
      a^.next := nil;
      if f<>nil then f^.pred := nil;
    end;
    
   procedure DelElement(var old,a: PUzel);
    begin
     if (old^.next = nil) then a:= nil                     //old ��������� ���� � ������
      else
       if (old^.next^.next = nil) then             //old ������������� ���� � ������
          begin
           a := old^.next;
           a^.pred:= nil;
           old^.next:= nil;
          end
         else
          begin                                            //�� old �� ����� ���� ����� � ������
           a := old^.next;
           old^.next := a^.next;
           old^.next^.pred:= old;
           a^.next := nil;
           a^.pred:= nil;
          end;
    end;

   procedure DelSpisok(var f: PUzel);  //������� ������
    var
     a: PUzel;
    begin
     while (f <> nil) do
      begin
       DelFirstElement(f,a);
       Dispose(a);
      end;
    end;

    procedure WriteSpTip(var f: PUzel; var ftip: FZap);
var
  p: PUzel;
begin
  p := f;
  while not (p = nil) do
  begin
    write(ftip, p^.x);
    p := p^.next;
  end;
end;

procedure BuildTip(var ftip: FZap);
var
  a: PUzel;
  i: integer;
begin
  seek(ftip, 0);
  i := 1;
  while  Form1.StringGRid1.Cells[1, i] <> '' do
  begin
    inc(i);
  end;
  while not eof(ftip) do
  begin
    New(a);
    read(ftip, a^.x);
    if PList = nil then
    begin
      AddFirst(PList, a);
      Form1.StringGRid1.Cells[0, i] := IntToStr(i);
      Form1.StringGRid1.Cells[1, i] := a^.x.NazTov;
      Form1.StringGRid1.Cells[2, i] := IntToStr(a^.x.ObTov);
      Form1.StringGRid1.Cells[3, i] := FloatToStr(a^.x.StoimPok);
      Form1.StringGRid1.Cells[4, i] := a^.x.Fam + ' ' + a^.x.Nam + ' ' + a^.x.Otch;
      inc(i);
    end
     else
    begin
      AddAfter(PList, a);
      Form1.StringGRid1.Cells[0, i] := IntToStr(i);
      Form1.StringGRid1.Cells[1, i] := a^.x.NazTov;
      Form1.StringGRid1.Cells[2, i] := IntToStr(a^.x.ObTov);
      Form1.StringGRid1.Cells[3, i] := FloatToStr(a^.x.StoimPok);
      Form1.StringGRid1.Cells[4, i] := a^.x.Fam + ' ' + a^.x.Nam + ' ' + a^.x.Otch;
      inc(i);
    end;
  end;
end;


procedure Result(var t: PUzel; var ftxt: Text);
var
  p: PUzel;
  s:real;
begin
  s:=0;
  writeln(ftxt,'');
  p:=PList;
    begin
      if p^.next=nil then
        begin
              s:=s+(p^.x.ObTov)*p^.x.StoimPok;
        end;
      while not(p=nil) do
        begin
            begin
              s:=s+(p^.x.ObTov)*p^.x.StoimPok;
            end;
            p:=p^.next;
        end;
      writeln(ftxt,'����� ������� �� ����: ',FloatToStr(s),'�');
      writeln(ftxt);
      if p=nil then
       begin
         p:=PList;
       end;
    end;
    ShowMessage('�������� ����� ������� �� ���� : '+FloatToStr(s)+'�');
end;
end.


