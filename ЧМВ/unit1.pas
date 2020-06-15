unit Unit1;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;

     function calc_population(l,g:real):real;
     procedure save_params(l:real; FName: string);
     procedure load_params(var l: Real; FName: string);

implementation


  function calc_population(l,g:real):real;
begin
result:=2*pi*sqrt(l/g);
end;

  procedure save_params(l:real; FName: string);
  var f: textfile;
   begin
     AssignFile(f,FName);
     Rewrite(f);
     writeln(f,l);
     closeFile(f);
end;

  procedure load_params(var l: Real; FName: string);
  var
    //buf: string;
    f: textfile;
   begin
    AssignFile(f,FName);
    Reset(f);
    readln(f,l);  //l := strtofloat(buf);
    closeFile(f);
end;
  end.

