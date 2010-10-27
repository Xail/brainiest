object ConfigForm: TConfigForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 222
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 310
    Height = 187
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    Style = tsButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 12
        Top = 15
        Width = 105
        Height = 13
        Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1094#1074#1077#1090#1072
      end
      object Label2: TLabel
        Left = 12
        Top = 40
        Width = 108
        Height = 13
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1077
      end
      object Label3: TLabel
        Left = 12
        Top = 65
        Width = 86
        Height = 13
        Caption = #1057#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1087#1086#1083#1077
      end
      object Label4: TLabel
        Left = 12
        Top = 90
        Width = 132
        Height = 13
        Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1074#1077#1089#1100' '#1101#1082#1088#1072#1085
      end
      object Label12: TLabel
        Left = 12
        Top = 115
        Width = 54
        Height = 13
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      end
      object DistributeColorsHotKey: THotKey
        Left = 160
        Top = 12
        Width = 121
        Height = 19
        HotKey = 113
        Modifiers = []
        TabOrder = 0
        OnChange = FullScreenHotKeyChange
      end
      object ShowAllHotKey: THotKey
        Left = 160
        Top = 37
        Width = 121
        Height = 19
        HotKey = 116
        Modifiers = []
        TabOrder = 1
        OnChange = FullScreenHotKeyChange
      end
      object HideAllHotKey: THotKey
        Left = 160
        Top = 62
        Width = 121
        Height = 19
        HotKey = 120
        Modifiers = []
        TabOrder = 2
        OnChange = FullScreenHotKeyChange
      end
      object FullScreenHotKey: THotKey
        Left = 160
        Top = 87
        Width = 121
        Height = 19
        HotKey = 122
        Modifiers = []
        TabOrder = 3
        OnChange = FullScreenHotKeyChange
      end
      object ConfigHotKey: THotKey
        Left = 160
        Top = 112
        Width = 121
        Height = 19
        HotKey = 27
        Modifiers = []
        TabOrder = 4
        OnChange = FullScreenHotKeyChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1062#1074#1077#1090#1072
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Team1Shape: TShape
        Left = 160
        Top = 12
        Width = 121
        Height = 19
        OnMouseUp = Team1ShapeMouseUp
      end
      object Team2Shape: TShape
        Left = 160
        Top = 37
        Width = 121
        Height = 19
        OnMouseUp = Team1ShapeMouseUp
      end
      object Team3Shape: TShape
        Left = 160
        Top = 62
        Width = 121
        Height = 19
        OnMouseUp = Team1ShapeMouseUp
      end
      object NeutralShape: TShape
        Left = 160
        Top = 87
        Width = 121
        Height = 19
        OnMouseUp = Team1ShapeMouseUp
      end
      object CoverShape: TShape
        Left = 160
        Top = 112
        Width = 121
        Height = 19
        OnMouseUp = Team1ShapeMouseUp
      end
      object Label5: TLabel
        Left = 12
        Top = 15
        Width = 53
        Height = 13
        Caption = #1050#1086#1084#1072#1085#1076#1072' 1'
      end
      object Label6: TLabel
        Left = 12
        Top = 40
        Width = 53
        Height = 13
        Caption = #1050#1086#1084#1072#1085#1076#1072' 2'
      end
      object Label7: TLabel
        Left = 12
        Top = 65
        Width = 53
        Height = 13
        Caption = #1050#1086#1084#1072#1085#1076#1072' 3'
      end
      object Label8: TLabel
        Left = 12
        Top = 90
        Width = 69
        Height = 13
        Caption = #1053#1077#1081#1090#1088#1072#1083#1100#1085#1099#1081
      end
      object Label9: TLabel
        Left = 12
        Top = 115
        Width = 84
        Height = 13
        Caption = #1057#1082#1088#1099#1090#1072#1103' '#1103#1095#1077#1081#1082#1072
      end
      object Label14: TLabel
        Left = 12
        Top = 137
        Width = 244
        Height = 13
        Caption = '['#1053#1072#1078#1084#1080#1090#1077' '#1085#1072' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1094#1074#1077#1090#1072']'
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054' '#1055#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label10: TLabel
        Left = 16
        Top = 101
        Width = 156
        Height = 13
        Caption = #1040#1074#1090#1086#1088':  '#1052#1080#1093#1072#1080#1083' '#1043#1083#1072#1076#1082#1080#1093'. 2010'
      end
      object Label11: TLabel
        Left = 16
        Top = 16
        Width = 68
        Height = 13
        Caption = #1057#1072#1084#1099#1081' '#1091#1084#1085#1099#1081
      end
      object Label13: TLabel
        Left = 16
        Top = 120
        Width = 88
        Height = 13
        Caption = 'ICQ: 266-236-623'
      end
      object LinkLabel1: TLinkLabel
        Left = 16
        Top = 139
        Width = 32
        Height = 17
        Caption = '<a href="mailto:mgladk@gmail.com">e-mail</a>'
        TabOrder = 0
        OnLinkClick = LinkLabel1LinkClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 187
    Width = 310
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OKBitBtn: TBitBtn
      AlignWithMargins = True
      Left = 196
      Top = 3
      Width = 111
      Height = 29
      Align = alRight
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object ColorDialog: TColorDialog
    Left = 121
    Top = 80
  end
end
