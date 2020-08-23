object Form1: TForm1
  Left = 958
  Top = 174
  Width = 243
  Height = 341
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object img_Do: TImage
    Left = 8
    Top = 8
    Width = 209
    Height = 200
    Transparent = True
  end
  object l_DiceValue: TLabel
    Left = 8
    Top = 264
    Width = 25
    Height = 13
    Caption = #1061#1086#1076': '
  end
  object l_DiceSituation: TLabel
    Left = 8
    Top = 280
    Width = 151
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1091#1076#1072#1088#1072' '#1087#1086' '#1074#1086#1088#1086#1090#1072#1084': '
  end
  object b_Throw: TButton
    Left = 8
    Top = 224
    Width = 209
    Height = 25
    Caption = #1041#1088#1086#1089#1086#1082
    TabOrder = 0
    OnClick = b_ThrowClick
  end
end
