unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Calculation = record
    a,x: Real;
  end;


  function calc(x: Real): real;
  procedure save_params(x: Real; filename: string);
  procedure load_params(var x: Real; filename: string);

implementation

  function calc(x: Real): real;
  var  a: real;
  begin
  a:=(((2*x-3)*x+4)*x-5)*x+6;
  calc:=a;
  end;

  procedure save_params(x: Real; filename: string);
  var
    f: text;
  begin
       Assign(f, filename);
       Rewrite(f);
       Writeln(f, x);
       Close(f);
  end;

  procedure load_params(var x: Real; filename: string);
  var
    f: text;
  begin
      Assign(f, filename);
      Reset(f);
      Readln(f, x);
      Close(f);
  end;

end.

