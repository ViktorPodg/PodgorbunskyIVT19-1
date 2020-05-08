program P506;

uses
  Forms,
  U506 in 'U506.pas' {Form1},
  Unit506 in 'Unit506.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
