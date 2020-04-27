object Form1: TForm1
  Left = 333
  Top = 100
  Width = 928
  Height = 480
  Caption = 'Form533'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 88
    Top = 88
    object File1: TMenuItem
      Caption = 'File'
      object OpenTxtFile1: TMenuItem
        Caption = 'OpenTxtFile'
        OnClick = OpenTxtFile1Click
      end
      object CloseTxtFile1: TMenuItem
        Caption = 'CloseTxtFile'
        OnClick = CloseTxtFile1Click
      end
      object WriteSpTextFile1: TMenuItem
        Caption = 'WriteSpTextFile'
        OnClick = WriteSpTextFile1Click
      end
    end
    object Work1: TMenuItem
      Caption = 'Work'
      object BuildSp1: TMenuItem
        Caption = 'BuildSp'
        OnClick = BuildSp1Click
      end
      object Sum1: TMenuItem
        Caption = 'Proizv'
        OnClick = Sum1Click
      end
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      object DeleteSp1: TMenuItem
        Caption = 'DeleteSp'
        OnClick = DeleteSp1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 144
    Top = 88
  end
end
