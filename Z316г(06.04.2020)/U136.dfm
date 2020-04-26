object Form1: TForm1
  Left = 217
  Top = 478
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 61
    Top = 70
    object Zupolnmass1: TMenuItem
      Caption = 'Zupoln_mass'
      object Hands1: TMenuItem
        Caption = 'Hands'
        OnClick = Hands1Click
      end
    end
    object Write1: TMenuItem
      Caption = 'Write'
      object Writetotextfile1: TMenuItem
        Caption = 'Writetotextfile'
        OnClick = Writetotextfile1Click
      end
    end
    object Rezalt1: TMenuItem
      Caption = 'Rezalt'
      object Result1: TMenuItem
        Caption = 'Result'
        OnClick = Result1Click
      end
    end
    object Open1: TMenuItem
      Caption = 'Open'
      object OpenTxt1: TMenuItem
        Caption = 'OpenTxt'
        OnClick = OpenTxt1Click
      end
    end
    object Close1: TMenuItem
      Caption = 'Close'
      object CloseTxtFile1: TMenuItem
        Caption = 'CloseTxtFile'
        OnClick = CloseTxtFile1Click
      end
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      object DenDinMas1: TMenuItem
        Caption = 'DenDinMas'
        OnClick = DenDinMas1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 109
    Top = 70
  end
end
