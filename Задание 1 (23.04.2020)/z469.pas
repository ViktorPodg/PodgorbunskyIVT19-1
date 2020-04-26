procedure Stroka(var s:string;d:byte);
var k,v:byte;
    i:integer;
begin
k:=d-length(s);{сколько добавить}
v:=0;{вставки пробелов}
repeat{идем по строке по кругу, добавляю по одному пробелу}
 for i:=length(s) downto 1 do{с конца строки}
 if (s[i]=' ')and(s[i-1]<>' ') then{если пробел и перед ним не пробел}
  begin
   insert(' ',s,i);{вставляем пробел}
   v:=v+1;{считаем}
   if v=k then break;{если все вставили, выходим из цикла}
  end;
until v=k;{конец просмотров строки}
writeln(s);
end;
 
var s:string;
    d:byte;
begin
writeln('Введите текст:');
readln(s);
repeat
write('Новая длина строки от ',length(s)+1,' до 255  d=');
readln(d);
until d in [length(s)+1..255];
Stroka(s,d);
end.