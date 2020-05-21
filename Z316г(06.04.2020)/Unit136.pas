unit Unit136;

interface
  uses SysUtils,Dialogs;
  type
    DinMas=array of integer;
    Tipfile=file of integer;
    procedure ZapMassHand(var a:DinMas);
    procedure WriteMassText(var a:array of integer; var f:text);
    procedure result(var a:array of Integer;var f:text);
implementation
    procedure ZapMassHand(var a: DinMas);
    var
      n,i:Word;
      k:string[10];
      begin
        n:=StrToInt(InputBox('Количество элементов в массиве','',''));
        SetLength(a,n);
        for i:=0 to n-1 do
        begin
        k:=IntToStr(i);
        a[i]:=StrToInt(InputBox('input'+k+'element','',''));
        end;
      end;
    procedure WriteMassText(var a:array of Integer; var f: text);
    var
      n,i:Integer;
      begin
        n:=StrToInt(InputBox('введите кол. элементов в строке','',''));
        Writeln(f,'Заданный массив');
        write(f,a[0]:5,'');
        for i:=1 to High(a) do
        if (i mod n=0) then writeln(f,a[i]:5)
        else write(f, a[i]:5,'');
        Writeln(f,'');
      end;
procedure result(var a:array of Integer; var f:text);
var
  n,i:Integer;
  proiz:integer;
  begin
    n:=StrToInt(InputBox('введите кол. элементов в строке','',''));
    proiz:=1;
    for i:=0 to n-1 do
      proiz:=Abs(proiz) * Abs(a[i]);
      Writeln(f,'Результат',proiz:5);
  end;

end.
