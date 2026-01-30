object MainForm: TMainForm
  Left = 431
  Top = 233
  Width = 776
  Height = 610
  Caption = 'Simple OCR'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object ButtonPnl: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object OpenBtn: TButton
      Left = 133
      Top = 10
      Width = 120
      Height = 25
      Caption = 'Open image...'
      TabOrder = 1
      OnClick = OpenBtnClick
    end
    object RecognizeBtn: TButton
      Left = 259
      Top = 10
      Width = 120
      Height = 25
      Caption = 'Recognize'
      TabOrder = 2
      OnClick = RecognizeBtnClick
    end
    object ProgressBar1: TProgressBar
      Left = 385
      Top = 14
      Width = 150
      Height = 17
      TabOrder = 3
      Visible = False
    end
    object OpenSampleBtn: TButton
      Left = 8
      Top = 10
      Width = 120
      Height = 25
      Caption = 'Open sample'
      TabOrder = 0
      OnClick = OpenSampleBtnClick
    end
  end
  object MainPnl: TPanel
    Left = 0
    Top = 41
    Width = 760
    Height = 530
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 319
      Width = 760
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 760
      Height = 319
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
    end
    object Memo1: TMemo
      Left = 0
      Top = 322
      Width = 760
      Height = 208
      Align = alBottom
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Bitmap files (*.bmp)|*.BMP'
    InitialDir = '..\assets\samples'
    Left = 144
    Top = 56
  end
  object TesseractOCR1: TTesseractOCR
    OnProgress = TesseractOCR1Progress
    Left = 320
    Top = 57
  end
end
