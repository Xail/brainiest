program Brainiest;

uses
  Forms,
  SysUtils,
  unBRN_Global in 'unBRN_Global.pas',
  fmBRN_Config in 'fmBRN_Config.pas' {ConfigForm},
  fmBRN_Main in 'fmBRN_Main.pas' {MainForm};

{$R *.res}

begin
	Application.Initialize;
	Application.MainFormOnTaskbar := True;
	Application.Title := 'Самый умный';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
