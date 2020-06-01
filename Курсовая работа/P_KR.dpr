program P_KR;

uses
  Forms,
  U_KR in 'U_KR.pas' {Form1},
  Unit_KR in 'Unit_KR.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
