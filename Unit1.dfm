object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Exportador '
  ClientHeight = 671
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 289
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 34
      Width = 29
      Height = 13
      Caption = 'Driver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 67
      Width = 29
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 103
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 143
      Width = 30
      Height = 13
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 183
      Width = 40
      Height = 13
      Caption = 'Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 223
      Width = 26
      Height = 13
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ComboBoxDriver: TComboBox
      Left = 61
      Top = 31
      Width = 705
      Height = 22
      Style = csOwnerDrawVariable
      ItemIndex = 0
      TabOrder = 0
      Text = 'Firebird'
      Items.Strings = (
        'Firebird'
        'Interbase'
        'MSSQL'
        'MySQL'
        'Oracle'
        'PostgreSQL'
        'SQLite')
    end
    object EditBAnco: TEdit
      Left = 61
      Top = 64
      Width = 660
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BitBtnBucaBanco: TBitBtn
      Left = 723
      Top = 64
      Width = 43
      Height = 21
      Hint = 'Procurar banco'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtnBucaBancoClick
    end
    object EditUsuario: TEdit
      Left = 61
      Top = 100
      Width = 705
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'sysdba'
    end
    object EditSenha: TEdit
      Left = 61
      Top = 140
      Width = 705
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
      Text = 'masterkey'
    end
    object EditServidor: TEdit
      Left = 61
      Top = 180
      Width = 705
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '127.0.0.1'
    end
    object EditPorta: TEdit
      Left = 61
      Top = 220
      Width = 705
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 6
      Text = '3050'
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 774
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Conex'#227'o'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
    end
    object Button2: TButton
      Left = 344
      Top = 244
      Width = 75
      Height = 42
      Caption = 'Conectar'
      TabOrder = 8
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 289
    Width = 776
    Height = 382
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 312
    ExplicitTop = 376
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 16
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Tabelas'
    end
    object ComboBoxTabelas: TComboBox
      Left = 61
      Top = 32
      Width = 705
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnClick = ComboBoxTabelasClick
    end
    object Panel4: TPanel
      Left = 1
      Top = 340
      Width = 774
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clGrayText
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 72
      ExplicitTop = 368
      ExplicitWidth = 185
      object Button1: TButton
        Left = 343
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 60
      Width = 774
      Height = 280
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object FDBatchMoveTextWriter1: TFDBatchMoveTextWriter
    DataDef.Fields = <>
    Left = 576
    Top = 448
  end
  object FDConnectionOrigem: TFDConnection
    Params.Strings = (
      'ConnectionDef=pdv')
    LoginPrompt = False
    Left = 60
    Top = 500
  end
  object FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader
    Left = 168
    Top = 488
  end
  object FDBatchMove1: TFDBatchMove
    Reader = FDBatchMoveDataSetReader1
    Writer = FDBatchMoveTextWriter1
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 560
    Top = 376
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = '*.CSV'
    Left = 496
    Top = 520
  end
  object OpenDialogDb: TOpenDialog
    FileName = 'G:\Projetos\Replicador\Bancos teste\DESTINO.FDB'
    Left = 748
    Top = 368
  end
  object FDMetaInfoQuery: TFDMetaInfoQuery
    Connection = FDConnectionOrigem
    Left = 609
    Top = 400
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 144
    Top = 417
  end
  object Table: TFDTable
    Connection = FDConnectionOrigem
    Left = 392
    Top = 441
  end
end
