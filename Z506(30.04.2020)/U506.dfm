object Form1: TForm1
  Left = 360
  Top = 10
  Width = 928
  Height = 480
  Caption = 'F506'
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
    Left = 66
    Top = 110
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
    end
    object List1: TMenuItem
      Caption = 'List'
      object BuildList1: TMenuItem
        Caption = 'BuildList'
        OnClick = BuildList1Click
      end
      object SaveListTxt1: TMenuItem
        Caption = 'SaveListTxt'
        OnClick = SaveListTxt1Click
      end
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      object DelList1: TMenuItem
        Caption = 'DelList'
        OnClick = DelList1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 112
  end
end
