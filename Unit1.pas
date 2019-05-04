unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.ExtDlgs, Vcl.StdCtrls,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.BatchMove.Text,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    FDBatchMoveTextWriter1: TFDBatchMoveTextWriter;
    FDConnectionOrigem: TFDConnection;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMove1: TFDBatchMove;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Panel1: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBoxDriver: TComboBox;
    EditBAnco: TEdit;
    BitBtnBucaBanco: TBitBtn;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    EditServidor: TEdit;
    EditPorta: TEdit;
    Panel2: TPanel;
    OpenDialogDb: TOpenDialog;
    Button2: TButton;
    Panel3: TPanel;
    ComboBoxTabelas: TComboBox;
    Label1: TLabel;
    FDMetaInfoQuery: TFDMetaInfoQuery;
    Panel4: TPanel;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table: TFDTable;
    procedure Button1Click(Sender: TObject);
    procedure BitBtnBucaBancoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBoxTabelasClick(Sender: TObject);
  private
    procedure Conectar(Driver: string; Conn: TFDConnection; Server, Database,
      User, Pass: string; Port: Integer=0);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBoxTabelasClick(Sender: TObject);
begin
  Table.Active    := False;
  Table.TableName := ComboBoxTabelas.Text;
  Table.Active    := True;
end;

procedure TForm1.Conectar(Driver: string; Conn: TFDConnection;
  Server, Database, User, Pass: string; Port: Integer = 0);
const
  DBOracle = '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=%s)(PORT=%s))(CONNECT_DATA=(SERVICE_NAME=XE)))';
begin
  Conn.Connected:= false;
  if (Driver = 'MSSQL') then
  begin
    Conn.Params.Clear;
    Conn.DriverName := 'MSSQL';
    Conn.Params.DriverID := 'MSSQL';
    Conn.Params.Values['Server']:= Server;
    Conn.Params.Values['DataBase']:= Database;
    if (Length(Trim(User)) = 0)and(Length(Trim(Pass)) = 0) then
    begin
      Conn.Params.Values['OSAuthent'] := 'Yes';
      Conn.Params.Values['User_Name'] := '';//User;
      Conn.Params.Values['Password']  := '';//Pass;
    end
    else
    begin
      Conn.Params.Values['OSAuthent'] := 'No';
      Conn.Params.Values['User_Name'] := User;
      Conn.Params.Values['Password']  := Pass;
    end;
    Conn.Params.Values['MetaDefSchema'] := 'dbo';
    Conn.Params.Values['MetaDefCatalog'] := Database;
    Conn.Params.Values['DriverID']  := 'MSSQL';
  end
  else
  if (Driver = 'Firebird') then
  begin
     Conn.Params.Clear;
     Conn.DriverName := 'FB';
     Conn.Params.DriverID := 'FB';
     Conn.Params.Values['DriverID']  := 'FB';
     Conn.Params.Values['Server']:= Server;
     if Port > 0 then
        Conn.Params.Values['Port']:= IntToStr(Port);
     Conn.Params.Values['DataBase']  := Database;
     Conn.Params.Values['User_Name'] := User;
     Conn.Params.Values['Password']  := Pass;
  end
  else
  if (Driver = 'Interbase') then
  begin
     Conn.Params.Clear;
     Conn.DriverName := 'IB';
     Conn.Params.DriverID := 'IB';
     Conn.Params.Values['DriverID']  := 'IB';
     Conn.Params.Values['Server']:= Server;
     if Port > 0 then
        Conn.Params.Values['Port']:= IntToStr(Port);
     Conn.Params.Values['DataBase']  := Database;
     Conn.Params.Values['User_Name'] := User;
     Conn.Params.Values['Password']  := Pass;
  end
  else
  if ( Driver = 'Oracle') then
  begin
     Conn.Params.Clear;
     Conn.DriverName := 'Ora';
     Conn.Params.DriverID := 'Ora';
     Conn.Params.Values['DataBase'] := Format(DBOracle, [Server, IntToStr(Port)]);
     Conn.Params.Values['User_Name'] := User;
     Conn.Params.Values['Password']  := Pass;
  end
  else
  if ( Driver = 'MySQL') then
  begin
     Conn.Params.Clear;
     Conn.DriverName := 'MySQL';
     Conn.Params.DriverID := 'MySQL';
     Conn.Params.Values['Server']:= Server;
     if Port > 0 then
        Conn.Params.Values['Port']:= IntToStr(Port);
     Conn.Params.Values['DataBase']:= Database;
     Conn.Params.Values['User_Name'] := User;
     Conn.Params.Values['Password']  := Pass;
  end
  else
  if ( Driver = 'SQLite') then
  begin
     Conn.DriverName := 'SQLite';
     Conn.Params.Clear;
     Conn.Params.DriverID := 'SQLite';
     Conn.Params.Values['HostName']:= '';
     Conn.Params.Values['DataBase']:= Database;
     Conn.Params.Values['User_Name'] := '';
     Conn.Params.Values['Password']  := '';
  end
  else
  if ( Driver = 'PostgreSQL') then
  begin
     Conn.DriverName := 'PG';
     Conn.Params.Clear;
     Conn.Params.DriverID := 'PG';
     Conn.Params.Values['Server']:= Server;
     if Port > 0 then
        Conn.Params.Values['Port']:= IntToStr(Port);
     Conn.Params.Values['DataBase']:= Database;
     Conn.Params.Values['User_Name'] := User;
     Conn.Params.Values['Password']  := Pass;
  end;
  Conn.Connected:= true;
end;
procedure TForm1.BitBtnBucaBancoClick(Sender: TObject);
begin
  if OpenDialogDb.Execute then
     EditBAnco.Text := OpenDialogDb.FileName;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Diretorio : string;
begin
  if not FDConnectionOrigem.Connected then
    raise Exception.Create('Banco de Dados de Origem não conectado');
  if SaveTextFileDialog1.Execute then
  begin
    Diretorio := SaveTextFileDialog1.FileName;
    if ExtractFileExt(Diretorio)='' then
      Diretorio := Diretorio +'.CSV'
    else
    if UpperCase(ExtractFileExt(Diretorio)) <>'.CSV' then
    begin
      raise Exception.Create('Formato de arquivo não suportado.');
    end;


    FDBatchMoveTextWriter1.FileName := SaveTextFileDialog1.FileName;
    FDBatchMove1.Execute;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Driver,
  Server,
  Database,
  User,
  Pass : string;
  Port : integer;

  Tipo : string;
begin
  Driver   := ComboBoxDriver.Text;
  Database := EditBAnco.Text;
  User     := EditUsuario.Text;
  Pass     := EditSenha.Text;
  Server   := EditServidor.Text;
  if EditPorta.Text<>'' then
    Port   := StrToInt(EditPorta.Text);

  Conectar(Driver,FDConnectionOrigem,Server,Database,User,Pass,Port);
  if FDConnectionOrigem.Connected then
  begin
    ComboBoxTabelas.Items.Clear;
    FDMetaInfoQuery.Connection := FDConnectionOrigem;
    FDMetaInfoQuery.Connection.GetTableNames('', '', '', ComboBoxTabelas.Items, [osMy], [tkTable],false);
    if ComboBoxTabelas.Items.Count>0 then
      ComboBoxTabelas.ItemIndex := 0;
  end;
end;

end.
