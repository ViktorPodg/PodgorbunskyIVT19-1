unit Unit533;

interface
    uses SysUtils,Dialogs;
    type
      PUzel=^Zp2;
      Zp2=record
      x:Real;
      next:PUzel;
      pred:PUzel;
      end;
      FZap=file of Real;
      procedure AddFirst(var f:PUzel; a:PUzel);
    procedure AddAfter(var old:PUzel;a:PUzel);
    procedure BuildSpisok(var f:PUzel);
    procedure WriteSpText(var f:PUzel;var ftxt:Text);
    procedure DelFirstElement(var f,a:PUzel);
    procedure DelElement(var old,a:PUzel);
    procedure DelSpisok(var f:PUzel);
    function SumElemSp(var f:PUzel):Real;
implementation
     procedure AddFirst(var f:PUzel;a:PUzel);
    begin
      a^.next:=f;
      f:=a;
    end;
    procedure AddAfter(var old:PUzel; a:PUzel);
     begin
       a^.next:= old^.next;
       old^.next:=a;
       if a^.next<>nil then a^.next^.pred:=a;
       a^.pred:=old;
     end;
    procedure BuildSpisok(var f:PUzel);
     var
      a,d:PUzel;
      ch:Char;
        begin
      f:=nil;
      repeat
      New(a);
      a^.x:=StrToFloat(InputBox('Введите реальное число','',''));
      a^.next:=nil;
      if(f=nil) then
       begin
       AddFirst(f,a);
       d:=f;
       end
       else
        begin
        AddAfter(d,a);
        d:=a;
        end;
        ch:=InputBox('Для завершения ввода нажмите Y','','')[1];
        until (ch='Y') or (ch='y');
        end;
     procedure WriteSpText(var f:PUzel;var ftxt:Text);
       var
         p:PUzel;
         s:string;
         y:Real;
         begin
           p:=f;
           while not(p=nil) do
           begin
             y:=p^.x;
             s:=Format('%-7.3g',[y]);
             write(ftxt,s);
             p:=p^.next;
             end;
           end;

    function SumElemSp(var f:PUzel):Real;
    var
      p,d:PUzel;
      s:Real;
      begin
        p:=f;
        while not(p=nil) do
        begin
          if (p^.next=nil) then d:=p;
          p:=p^.next;
        end;
        p:=f;
        s:=(p^.x+d^.x);
        while not(p^.next=nil) do
        begin
          s:=s*(p^.x+d^.x);
          p:=p^.next;
          d:=d^.pred;
          end;
          result:=s;
        end;
   procedure DelFirstElement(var f,a:PUzel);
     begin
       a:=f;
       f:=f^.next;
       a^.next:=nil;
       if f<>nil then f^.pred:=nil;
     end;
   procedure DelElement(var old,a:PUzel);
    begin
      if (old^.next=nil) then a:=nil
      else
       if (old^.next^.next=nil) then
        begin
      a:=old^.next;
      a^.pred:=nil;
      old^.next:=nil;
    end
    else
     begin
       a:=old^.next;
       old^.next:=a^.next;
       old^.next^.pred:=old;
       a^.next:=nil;
       a^.pred:=nil;
       end;
     end;
   procedure DelSpisok(var f:PUzel);
    var
      a:PUzel;
      begin
        while (f<>nil) do
        begin
          DelFirstElement(f,a);
          Dispose(a);
        end;
      end;
end.
