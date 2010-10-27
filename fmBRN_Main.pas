unit fmBRN_Main;

interface

uses
	Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, Grids, ActnList, sSkinManager;

type
	TColorGrid = array [0 .. 5, 0 .. 5] of Tcolor;
	PColorGrid = ^TColorGrid;

	TMainForm = class(TForm)
		DrawGrid: TDrawGrid;
		ActionList: TActionList;
		DistributeColorsAction: TAction;
		ShowAllAction: TAction;
		ShowCellAction: TAction;
		HideAllAction: TAction;
		FullScreenAction: TAction;
		ConfigAction: TAction;
    sSkinManager1: TsSkinManager;
		procedure FormResize(Sender: TObject);
		procedure DistributeColorsActionExecute(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
			Rect: TRect; State: TGridDrawState);
		procedure ShowAllActionExecute(Sender: TObject);
		procedure HideAllActionExecute(Sender: TObject);
		procedure FullScreenActionExecute(Sender: TObject);
		procedure DrawGridClick(Sender: TObject);
		procedure DrawGridSelectCell(Sender: TObject; ACol, ARow: Integer;
			var CanSelect: Boolean);
		procedure ConfigActionExecute(Sender: TObject);

	private
		{ Private declarations }
	public
		RealColors, ShowColors: TColorGrid;
		TeamColors: array [0 .. 4] of Tcolor;
		PColors: PColorGrid;
		procedure ReadConfig;
	end;

var
	MainForm: TMainForm;

implementation

uses

	fmBRN_Config, unBRN_Global;
{$R *.dfm}

procedure TMainForm.ConfigActionExecute(Sender: TObject);
begin
	fmBRN_Config.ShowForm(self);
	ReadConfig;
end;

procedure TMainForm.DistributeColorsActionExecute(Sender: TObject);
var
	R, C, Idx, ColorIdx: Integer;
begin
	for R := 0 to 5 do
	begin
		for C := 0 to 5 do
		begin
			RealColors[R, C] := clBlack;
			ShowColors[R, C] := TeamColors[4];
		end;
	end;
	Randomize;
	for ColorIdx := 0 to 3 do
	begin
		for Idx := 1 to 9 do
		begin
			repeat
				R := Random(6);
				C := Random(6);
			until RealColors[R, C] = clBlack;
			RealColors[R, C] := TeamColors[ColorIdx];
		end;
	end;
	DrawGrid.Repaint
end;

procedure TMainForm.DrawGridClick(Sender: TObject);
var
	M: TPoint;
	ACol, ARow: Integer;
begin
	M := ScreenToClient(Mouse.CursorPos);
	DrawGrid.MouseToCell(M.X, M.Y, ACol, ARow);
	ShowColors[ARow, ACol] := RealColors[ARow, ACol];
	DrawGrid.Repaint;
end;

procedure TMainForm.DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
	Rect: TRect; State: TGridDrawState);
var
	Number: string;
begin
	with DrawGrid.Canvas do
	begin
		Brush.Color := PColors^[ARow, ACol];
		FillRect(Rect);
		Font.Color := $FFFFFF xor DrawGrid.Canvas.Brush.Color;
		Font.Height := trunc(DrawGrid.DefaultRowHeight * 0.8);
		Number := IntToStr(ARow * 6 + ACol + 1);
		TextOut(Rect.Left + (DrawGrid.DefaultColWidth - TextWidth(Number)) div 2,
			Rect.Top, Number);
	end;
end;

procedure TMainForm.DrawGridSelectCell(Sender: TObject; ACol, ARow: Integer;
	var CanSelect: Boolean);
begin
	CanSelect := false;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
	ReadConfig;
	ConfigActionExecute(self);
	DistributeColorsActionExecute(self);
	PColors := @ShowColors;
end;

procedure TMainForm.FormResize(Sender: TObject);
var
	cw, rh: Integer;
begin
	cw := (self.ClientWidth - 8) div 6;
	rh := (self.ClientHeight - 6) div 6;
	DrawGrid.DefaultColWidth := cw;
	DrawGrid.DefaultRowHeight := rh;
end;

procedure TMainForm.FullScreenActionExecute(Sender: TObject);
begin
	if BorderStyle <> bsNone then
	begin
		BorderStyle := bsNone;
		WindowState := wsMaximized;
	end
	else
	begin
		BorderStyle := bsSizeable;
	end;
	FormResize(self);
end;

procedure TMainForm.HideAllActionExecute(Sender: TObject);
begin
	PColors := @ShowColors;
	DrawGrid.Repaint;
end;

procedure TMainForm.ReadConfig;
begin
	TeamColors[0] := Config.Value['Colors', 'Team1', clRed];
	TeamColors[1] := Config.Value['Colors', 'Team2', clYellow];
	TeamColors[2] := Config.Value['Colors', 'Team3', clBlue];
	TeamColors[3] := Config.Value['Colors', 'Neutral', clSilver];
	TeamColors[4] := Config.Value['Colors', 'Cover', RGB(253, 225, 176)];
	DistributeColorsAction.ShortCut := Config.Value['Hotkeys',
		'DistributeColors', Word(VK_F2)];
	ShowAllAction.ShortCut := Config.Value['Hotkeys', 'ShowAll', Word(VK_F5)
		];
	HideAllAction.ShortCut := Config.Value['Hotkeys', 'HideAll', Word(VK_F9)
		];
	FullScreenAction.ShortCut := Config.Value['Hotkeys', 'FullScreen', Word
		(VK_F11)];
	ConfigAction.ShortCut := Config.Value['Hotkeys', 'Config', Word
		(VK_ESCAPE)];
end;

procedure TMainForm.ShowAllActionExecute(Sender: TObject);
begin
	PColors := @RealColors;
	DrawGrid.Repaint;
end;

end.
