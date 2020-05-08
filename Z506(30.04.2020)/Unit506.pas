unit Unit506;

interface
    uses SysUtils, Dialogs;
    type
      Bag=record
       Fam,Nam,Otch:string[20];
       ColV:Byte;
       VesV:Real;
       Npasp:string[20];
       end;
      PUzel=^Zp2;
      Zp2=record
         x:Bag;
         next:PUzel;
         pred:PUzel;
         end;
      FZap=file of Bag;
      procedure AddFirst(var f:PUzel;a:PUzel);
      procedure AddAfter(var old:PUzel; a:PUzel);
      procedure BuildSpisok(var f:PUzel);
      procedure WriteSpText(var f:PUzel; var ftxt:Text);
      procedure DelFirstElement(var f,a:PUzel);
      procedure DelElement(var old,a:PUzel);
      procedure DelSpisok(var f:PUzel);

implementation
    procedure AddFirst(var f:PUzel; a:PUzel);
     begin
       a^.next:=f;
       if f<>nil then f^.pred:=a;
       f:=a;
       end;
    procedure AddAfter(var old:PUzel;a:PUzel);
     begin
       a^.next:=old^.next;
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
         with a^.x do
          begin
            Fam:=InputBox('¬ведите фамилию','','');
            Nam:=InputBox('¬ведите им€','','');
            Otch:=InputBox('¬ведите отчество','','');
            Npasp:=InputBox('¬ведите серию и номер паспорта','','');
            ColV:=StrToInt(InputBox('¬ведите количество вещей','',''));
            VesV:=StrToFloat(InputBox('¬ведите вес вещей','',''));
          end;
         a^.next:=nil;
         a^.pred:=nil;
         if (f=nil) then
          begin
            AddFirst(f,a);
            d:=f;
          end
          else
           begin
             AddAfter(d,a);
             d:=a;
           end;
          ch:= InputBox('ƒл€ завершени€ ввода нажмите Y','','')[1];
          until (ch='Y') or (ch='y');
     end;
     procedure WriteSpText(var f:PUzel; var ftxt:Text);
     var
       p:PUzel;
       s:string;
       y:Bag;
     begin
       p:=f;
       while not(p=nil) do
       begin
         y:=p^.x;
         s:=y.Fam +'  '+y.Nam+'  '+y.Otch+'  '+y.Npasp+'  '+IntToStr(y.ColV)+'  '+FloatToStr(y.VesV);
         Writeln(ftxt,s);
         p:=p^.next;
       end;
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
            old^.next:=nil;
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
