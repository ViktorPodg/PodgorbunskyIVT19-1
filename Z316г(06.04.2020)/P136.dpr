program P136;

uses
  Forms,
  U136 in 'U136.pas' {Form1},
  Unit136 in 'Unit136.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
