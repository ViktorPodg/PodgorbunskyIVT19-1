program P533;

uses
  Forms,
  U533 in 'U533.pas' {Form1},
  Unit533 in 'Unit533.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
