(*
 *  IBX For Lazarus (Firebird Express)
 *
 *  The contents of this file are subject to the Initial Developer's
 *  Public License Version 1.0 (the "License"); you may not use this
 *  file except in compliance with the License. You may obtain a copy
 *  of the License here:
 *
 *    http://www.firebirdsql.org/index.php?op=doc&id=idpl
 *
 *  Software distributed under the License is distributed on an "AS
 *  IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 *  implied. See the License for the specific language governing rights
 *  and limitations under the License.
 *
 *  The Initial Developer of the Original Code is Tony Whyman.
 *
 *  The Original Code is (C) 2015 Tony Whyman, MWA Software
 *  (http://www.mwasoftware.co.uk).
 *
 *  All Rights Reserved.
 *
 *  Contributor(s): ______________________________________.
 *
*) 
            
unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LResources, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DbCtrls, IBCustomDataSet, IBDatabase, IBQuery, IBSQL,
  IBUpdateSQL, IBStoredProc, IBBatchMove, IBServices, IBTable, IBXServices;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    DeptsBUDGET: TIBBCDField;
    DeptsDEPARTMENT: TIBStringField;
    DeptsDEPT_NO: TIBStringField;
    DeptsHEAD_DEPT: TIBStringField;
    DeptsLOCATION: TIBStringField;
    DeptsMNGR_NO: TSmallintField;
    DeptsPHONE_NO: TIBStringField;
    Datasource1: TDatasource;
    DeptSource: TDataSource;
    DBEdit1: TDBEdit;
    IBDatabase1: TIBDatabase;
    IBDataSet1: TIBDataSet;
    IBDataSet1CURRENCYNAME: TIBStringField;
    IBDataSet1CURRENCY_ID: TLongintField;
    IBDataSet1EXCHANGERATE: TFloatField;
    IBDataSet1FORMATSTRING: TIBStringField;
    IBQuery1: TIBQuery;
    IBRestoreService1: TIBRestoreService;
    IBSQL1: TIBSQL;
    Depts: TIBTable;
    Employee: TIBTable;
    EmployeeDEPT_NO: TIBStringField;
    EmployeeFIRST_NAME: TIBStringField;
    EmployeeFULL_NAME: TIBStringField;
    EmployeeHIRE_DATE: TDateTimeField;
    EmployeeJOB_CODE: TIBStringField;
    EmployeeJOB_COUNTRY: TIBStringField;
    EmployeeJOB_GRADE: TSmallintField;
    EmployeeLAST_NAME: TIBStringField;
    EmployeePHONE_EXT: TIBStringField;
    EmployeeSALARY: TIBBCDField;
    IBStoredProc1: TIBStoredProc;
    IBTransaction1: TIBTransaction;
    IBUpdateSQL1: TIBUpdateSQL;
    IBXServicesConnection1: TIBXServicesConnection;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IBDatabase1AfterConnect(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

uses ibselectsqleditor, ibrefreshsqleditor, ibdeletesqleditor, ibmodifysqleditor,
     ibinsertsqleditor, IBDatabaseEdit, IBTransactionEdit, IBGeneratorEditor,
     IBUpdateSQLEditor, IBDataSetEditor, IBSQLEditor, ibserviceeditor,
     dbFieldLinkPropEditor, IBXServiceEditor;

type

  { TIBTableFieldLinkProperty }

  TIBTableFieldLinkProperty = class(TFieldLinkProperty)
  private
    FTable: TIBTable;
  protected
    function GetIndexDefs: TIndexDefs; override;
    function GetIndexFieldNames: string; override;
    function GetMasterFields: string; override;
    procedure SetIndexFieldNames(const Value: string); override;
    procedure SetMasterFields(const Value: string); override;
  public
    constructor Create(aDataset: TDataSet);
    procedure Edit; override;
  end;

{ TIBTableFieldLinkProperty }

 function TIBTableFieldLinkProperty.GetIndexDefs: TIndexDefs;
begin
  Result := FTable.IndexDefs
end;

 function TIBTableFieldLinkProperty.GetIndexFieldNames: string;
begin
  Result := FTable.IndexFieldNames;
end;

 function TIBTableFieldLinkProperty.GetMasterFields: string;
begin
  Result := FTable.MasterFields;
end;

 procedure TIBTableFieldLinkProperty.SetIndexFieldNames( const Value: string);
begin
  FTable.IndexFieldNames := Value;
end;

 procedure TIBTableFieldLinkProperty.SetMasterFields( const Value: string);
begin
  FTable.MasterFields := Value;
end;

  constructor TIBTableFieldLinkProperty.Create(aDataset: TDataSet);
 begin
   inherited Create(nil,1);
   SetPropEntry(0,aDataSet,nil)
 end;

 procedure TIBTableFieldLinkProperty.Edit;
begin
  FTable := DataSet as TIBTable;
  try
    FTable.Database.Connected := true;
  except
    on E: Exception do
        ShowMessage(E.Message)
  end;
  inherited Edit;
end;


{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  ibselectsqleditor.EditSQL(IBDataSet1,IBDataSet1.SelectSQL)
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  IBDataSetEditor.EditIBDataSet(IBDataSet1)
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  IBSQLEditor.EditSQL(IBSQL1)
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  ibserviceeditor.EditIBService(IBRestoreService1)
end;

 procedure TForm1.Button13Click(Sender: TObject);
begin
  with TIBTableFieldLinkProperty.Create(Employee) do
  try
     Edit
  finally
    Free
  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  IBDatabase1.GetFieldNames('EMPLOYEE',Memo1.Lines);
  Memo1.Visible := true;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  IBXServiceEditor.EditIBXService(IBXServicesConnection1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ibrefreshsqleditor.EditSQL(IBDataSet1,IBDataSet1.RefreshSQL)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ibdeletesqleditor.EditSQL(IBDataSet1,IBDataSet1.DeleteSQL)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ibmodifysqleditor.EditSQL(IBDataSet1,IBDataSet1.ModifySQL)
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ibinsertsqleditor.EditSQL(IBDataSet1,IBDataSet1.InsertSQL)
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  IBDatabaseEdit.EditIBDatabase(IBDatabase1)
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  IBGeneratorEditor.EditGenerator(IBDataSet1.GeneratorField)
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  IBTransactionEdit.EditIBtransaction(IBTransaction1)
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  IBUpdateSQLEditor.EditIBUpdateSQL(IBUpdateSQL1)
end;

 procedure TForm1.FormShow(Sender: TObject);
begin
  IBDatabase1.Connected := true;
  IBStoredProc1.FieldDefs.Update
end;

procedure TForm1.IBDatabase1AfterConnect(Sender: TObject);
begin
  Label1.Caption := Format('%s(%d)',[IBDatabase1.DefaultCharSetName,IBDatabase1.DefaultCodePage]);
end;

initialization
  {$I mainform.lrs}

end.

