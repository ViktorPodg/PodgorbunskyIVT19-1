unit Unit_KR;

interface

uses SysUtils, Dialogs,Controls;          //Модули для ввода/вывода данных
 type
 magaz = record                           //Тип магазин
        NazTov:string[20];                //Наименование товара
        ObTov:Integer;                    //Объем продажи
        StoimPok:Real;                    //Стоимость покупки
        Fam,Nam,Otch:string[20];          //ФИО продавца
         end;
   PUzel = ^Zp;                           //Тип указателя на узел
   Zp = record                            //Тип узла списка
         x: magaz;                        //Сведения о магазине
         next: PUzel;                     //Указатель на следующий узел
         pred: PUzel;                     //Указатель на предыдущий узел
        end;
   FZap = file of magaz; //Файловый тип для хранения данных о магазине


   procedure AddFirst(var f: PUzel; a: PUzel);  {Вставить узел а первым в список}

   procedure AddAfter(var old:PUzel; a: PUzel); {Вставить узел а после old}

   procedure BuildSpisok(var f: PUzel);{Построить список; f-указатель на голову списка}

   procedure WriteSpText(var f: PUzel;var ftxt:Text);{Вывод списка в текстовый файл}

   procedure DelFirstElement(var f,a: PUzel); {Выделить из списка первый узел
   и вернуть его пользователю}

   procedure DelSpisok(var f: PUzel);   //Удалить список

   procedure WriteSpTip(var f: PUzel; var ftip: FZap);  //запись в типизированный файл

   procedure BuildTip(var ftip: FZap);{Вывод списка в типизированный файл}

   procedure Result(var t: PUzel; var ftxt: Text); {Выводит итоговый результат}

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
       NazTov := InputBox('Наименование товара', ' ', ' ');
      Form1.StringGRid1.Cells[1, i] := a^.x.NazTov;
      ObTov := StrToInt(InputBox('Объем продажи', ' ', ' '));
      Form1.StringGRid1.Cells[2, i] :=IntToStr(a^.x.ObTov);
      StoimPok:= StrToFloat(InputBox('Стоимость покупки', ' ', ' '));
     Form1.StringGRid1.Cells[3, i] := FloatToStr(a^.x.StoimPok);
      Fam := InputBox('Введите фамилию продавца', ' ', ' ');
      Nam := InputBox('Введите имя продавца', ' ', ' ');
      Otch := InputBox('Введите отчество продавца', ' ', ' ');
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
      ch:= InputBox('Для завершения ввода нажмите Y',' ',' ')[1];
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
     if (old^.next = nil) then a:= nil                     //old последний узел в списке
      else
       if (old^.next^.next = nil) then             //old предпоследний узел в списке
          begin
           a := old^.next;
           a^.pred:= nil;
           old^.next:= nil;
          end
         else
          begin                                            //за old не менее двух узлов в списке
           a := old^.next;
           old^.next := a^.next;
           old^.next^.pred:= old;
           a^.next := nil;
           a^.pred:= nil;
          end;
    end;

   procedure DelSpisok(var f: PUzel);  //Удалить список
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
      writeln(ftxt,'Сумма продажи за день: ',FloatToStr(s),'р');
      writeln(ftxt);
      if p=nil then
       begin
         p:=PList;
       end;
    end;
    ShowMessage('Итоговая сумма продажи за день : '+FloatToStr(s)+'р');
end;
end.


