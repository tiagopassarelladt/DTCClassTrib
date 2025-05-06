program DemoCClassTrib;

uses
  Vcl.Forms,
  UntPrincCClass in 'UntPrincCClass.pas' {Form8},
  ReformaTributaria.ClassTrib in 'ReformaTributaria.ClassTrib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
