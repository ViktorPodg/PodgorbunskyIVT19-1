object Form1: TForm1
  Left = 268
  Top = 502
  Width = 928
  Height = 480
  Caption = 'Form1'
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
    Left = 103
    Top = 69
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
      object WriteTxtFile1: TMenuItem
        Caption = 'WriteTxtFile'
        OnClick = WriteTxtFile1Click
      end
    end
    object Build1: TMenuItem
      Caption = 'Build'
      object BuildSp11: TMenuItem
        Caption = 'BuildSp1'
        OnClick = BuildSp11Click
      end
      object BuildSp21: TMenuItem
        Caption = 'BuildSp2'
        OnClick = BuildSp21Click
      end
      object EndElem1: TMenuItem
        Caption = 'EndElem'
        OnClick = EndElem1Click
      end
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      object DeleteSp11: TMenuItem
        Caption = 'DeleteSp1'
        OnClick = DeleteSp11Click
      end
      object DeleteSp21: TMenuItem
        Caption = 'DeleteSp2'
        OnClick = DeleteSp21Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 152
    Top = 70
  end
end
