object Form1: TForm1
  Left = 35
  Top = 10
  BorderStyle = bsToolWindow
  Caption = 'Video Processor'
  ClientHeight = 655
  ClientWidth = 956
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    956
    655)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 689
    Top = 367
    Width = 257
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 223
      Top = 23
      Width = 26
      Height = 16
      Caption = 'FPS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 80
      Top = 19
      Width = 30
      Height = 30
      Caption = '>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 48
      Top = 19
      Width = 30
      Height = 30
      Caption = '| |'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 19
      Width = 30
      Height = 30
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 120
      Top = 19
      Width = 30
      Height = 30
      Caption = '>>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 160
      Top = 19
      Width = 25
      Height = 25
      Caption = '0F'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button5Click
    end
    object Edit1: TEdit
      Left = 192
      Top = 19
      Width = 25
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '30'
      OnChange = Edit1Change
    end
  end
  object TrackBar1: TTrackBar
    Left = 0
    Top = 336
    Width = 953
    Height = 25
    Enabled = False
    TabOrder = 1
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TrackBar1Change
  end
  object GroupBox2: TGroupBox
    Left = 200
    Top = 504
    Width = 105
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 11
      Top = 41
      Width = 70
      Height = 16
      Caption = 'Pos Y: NaN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 9
      Width = 69
      Height = 16
      Caption = 'Pos X: NaN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 200
    Top = 367
    Width = 105
    Height = 131
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 9
      Width = 45
      Height = 16
      Caption = 'X0 Pos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 31
      Width = 46
      Height = 16
      Caption = 'Y0 Pos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 71
      Width = 45
      Height = 16
      Caption = 'X1 Pos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 93
      Width = 46
      Height = 16
      Caption = 'Y1 Pos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 8
    Width = 835
    Height = 322
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object Image1: TImage
      Left = 8
      Top = 16
      Width = 824
      Height = 297
      Stretch = True
      OnMouseDown = Image1MouseDown
      OnMouseLeave = Image1MouseLeave
      OnMouseMove = Image1MouseMove
    end
    object Label15: TLabel
      Left = 235
      Top = 288
      Width = 441
      Height = 31
      Caption = 'Need to binarize and recalculate again!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
  object StringGrid1: TStringGrid
    Left = 689
    Top = 446
    Width = 257
    Height = 185
    Color = clBlack
    ColCount = 2
    DefaultColWidth = 74
    FixedColor = clDefault
    FixedCols = 0
    RowCount = 7
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
    ColWidths = (
      126
      108)
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 464
    Width = 177
    Height = 167
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object Label10: TLabel
      Left = 15
      Top = 8
      Width = 86
      Height = 16
      Caption = 'First fire frame:'
    end
    object Label11: TLabel
      Left = 15
      Top = 38
      Width = 153
      Height = 33
      AutoSize = False
      Caption = 'Time from experiment start: '
      WordWrap = True
    end
    object Label12: TLabel
      Left = 15
      Top = 77
      Width = 97
      Height = 33
      AutoSize = False
      Caption = 'Summary count of frames:'
      WordWrap = True
    end
    object Button6: TButton
      Left = 3
      Top = 116
      Width = 80
      Height = 45
      Caption = 'Binarize'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button6Click
    end
    object Button8: TButton
      Left = 93
      Top = 116
      Width = 81
      Height = 45
      Caption = 'Calculate'
      TabOrder = 1
      OnClick = Button8Click
    end
  end
  object Chart1: TChart
    Left = 315
    Top = 367
    Width = 361
    Height = 264
    BackWall.Brush.Style = bsClear
    Title.Font.Color = clYellow
    Title.Text.Strings = (
      'S/t (mm/mks)')
    BottomAxis.AxisValuesFormat = '#.##0;(#.##0)'
    BottomAxis.LabelsFormat.Font.Color = clWhite
    BottomAxis.Title.Caption = 'Time (mks)'
    BottomAxis.Title.Font.Color = clWhite
    LeftAxis.LabelsFormat.Font.Color = clWhite
    LeftAxis.Title.Caption = 'Length (mm)'
    LeftAxis.Title.Font.Color = clWhite
    View3D = False
    Color = -1
    TabOrder = 7
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPointSeries
      SeriesColor = clLime
      ClickableLine = False
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Button7: TButton
    Left = 200
    Top = 580
    Width = 105
    Height = 45
    Caption = 'Reset'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button7Click
  end
  object GroupBox6: TGroupBox
    Left = 9
    Top = 367
    Width = 176
    Height = 91
    TabOrder = 9
    object Label8: TLabel
      Left = 14
      Top = 35
      Width = 65
      Height = 16
      Caption = 'Video FPS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 14
      Top = 9
      Width = 90
      Height = 16
      Caption = 'Sample Length'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 14
      Top = 61
      Width = 79
      Height = 16
      Caption = 'Fire Direction'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 110
      Top = 35
      Width = 49
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '360000'
    end
    object Edit2: TEdit
      Left = 110
      Top = 9
      Width = 49
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '70'
    end
    object Button10: TButton
      Left = 109
      Top = 61
      Width = 51
      Height = 23
      Caption = '---->'
      TabOrder = 2
      OnClick = Button10Click
    end
  end
  object GroupBox7: TGroupBox
    Left = 849
    Top = 8
    Width = 99
    Height = 322
    Color = clBlack
    ParentBackground = False
    ParentColor = False
    TabOrder = 10
    object Label13: TLabel
      Left = 7
      Top = 8
      Width = 92
      Height = 16
      Caption = 'Gray gradation:'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 31
      Top = 30
      Width = 21
      Height = 16
      Caption = '255'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Image2: TImage
      Left = 16
      Top = 52
      Width = 49
      Height = 255
    end
    object TrackBar2: TTrackBar
      Left = 72
      Top = 40
      Width = 23
      Height = 279
      Max = 255
      Orientation = trVertical
      Position = 125
      TabOrder = 0
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TrackBar2Change
    end
  end
  object Button9: TButton
    Left = 8
    Top = 631
    Width = 19
    Height = 19
    Hint = 'Show logs'
    Caption = #8595
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = Button9Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 237
    Width = 49
    Height = 141
    Anchors = []
    BevelEdges = []
    ScrollBars = ssVertical
    TabOrder = 12
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 33
    Top = 631
    Width = 915
    Height = 19
    TabOrder = 13
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 48
    object Main1: TMenuItem
      Caption = 'Main'
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
        Enabled = False
        OnClick = Save1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Visualisation1: TMenuItem
        Caption = 'Visualisation'
        OnClick = Visualisation1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 464
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 464
    Top = 48
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 33
    OnTimer = Timer1Timer
    Left = 432
    Top = 16
  end
end
