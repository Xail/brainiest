unit unBRN_Global;

interface

uses ConfigFile;

var
	Config: TConfigFile;

implementation

uses Path, Forms, SysUtils;

initialization

Config := TConfigFile.Create(TConfigFile.AppDataPath('Brainiest'));

finalization

FreeAndNil(Config);

end.
