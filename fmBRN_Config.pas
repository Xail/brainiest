unit fmBRN_Config;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
	TConfigForm = class(TForm)
		PageControl1: TPageControl;
		TabSheet1: TTabSheet;
		Panel1: TPanel;
		DistributeColorsHotKey: THotKey;
		TabSheet2: TTabSheet;
		Label1: TLabel;
		Label2: TLabel;
		Label3: TLabel;
		Label4: TLabel;
		ShowAllHotKey: THotKey;
		HideAllHotKey: THotKey;
		FullScreenHotKey: THotKey;
		ColorDialog: TColorDialog;
		Team1Shape: TShape;
		Team2Shape: TShape;
		Team3Shape: TShape;
		NeutralShape: TShape;
		CoverShape: TShape;
		Label5: TLabel;
		Label6: TLabel;
		Label7: TLabel;
		Label8: TLabel;
		Label9: TLabel;
		TabSheet3: TTabSheet;
		Label10: TLabel;
		Label11: TLabel;
		OKBitBtn: TBitBtn;
		Label12: TLabel;
		ConfigHotKey: THotKey;
		Label13: TLabel;
		Label14: TLabel;
		LinkLabel1: TLinkLabel;
		procedure Team1ShapeMouseUp(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
		procedure FormShow(Sender: TObject);
		procedure FullScreenHotKeyChange(Sender: TObject);
		procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
			LinkType: TSysLinkType);

	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

function ShowForm(AOwner: TComponent): TModalResult;

implementation

uses
	StrUtils, fmBRN_Main, shellapi, ConfigFile, unBRN_Global;

function ShowForm(AOwner: TComponent): TModalResult;
var
	f: TConfigForm;
begin
	try
		f := TConfigForm.Create(AOwner);
		Result := f.ShowModal;
	finally
		FreeAndNil(f);
	end;
end;
{$R *.dfm}

procedure TConfigForm.FormShow(Sender: TObject);
begin
	DistributeColorsHotKey.HotKey := Config.Value['Hotkeys', 'DistributeColors',
		Word(VK_F2)];
	ShowAllHotKey.HotKey := Config.Value['Hotkeys', 'ShowAll', Word(VK_F5)];
	HideAllHotKey.HotKey := Config.Value['Hotkeys', 'HideAll', Word(VK_F9)];
	FullScreenHotKey.HotKey := Config.Value['Hotkeys', 'FullScreen', Word
		(VK_F11)];
	ConfigHotKey.HotKey := Config.Value['Hotkeys', 'Config', Word(VK_ESCAPE)
		];
	Team1Shape.Brush.Color := Config.Value['Colors', 'Team1',
		MainForm.TeamColors[0]];
	Team2Shape.Brush.Color := Config.Value['Colors', 'Team2',
		MainForm.TeamColors[1]];
	Team3Shape.Brush.Color := Config.Value['Colors', 'Team3',
		MainForm.TeamColors[2]];
	NeutralShape.Brush.Color := Config.Value['Colors', 'Neutral',
		MainForm.TeamColors[3]];
	CoverShape.Brush.Color := Config.Value['Colors', 'Cover',
		MainForm.TeamColors[4]];
end;

procedure TConfigForm.FullScreenHotKeyChange(Sender: TObject);
var
	h: THotKey;
begin
	if not(Sender is THotKey) then
		exit;
	h := Sender as THotKey;
	Config.Value['Hotkeys', LeftStr(h.name, Length(h.name) - 6), 0] := Word
		(h.HotKey);
end;

procedure TConfigForm.LinkLabel1LinkClick(Sender: TObject; const Link: string;
	LinkType: TSysLinkType);
begin
	shellapi.ShellExecute(0, 'Open', PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TConfigForm.Team1ShapeMouseUp(Sender: TObject; Button: TMouseButton;
	Shift: TShiftState; X, Y: Integer);
var
	s: TShape;
begin
	if not(Sender is TShape) then
		exit;
	s := Sender as TShape;

	if ColorDialog.Execute then
	begin
		s.Brush.Color := ColorDialog.Color;
		Config.Value['Colors', LeftStr(s.name, Length(s.name) - 5), clBlack]
			:= s.Brush.Color;
	end;

end;

end.
