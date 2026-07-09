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
            
program test1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainform, IBDatabaseEdit, ibdataseteditor, IBEventsEditor,
  ibgeneratoreditor, ibselectsqleditor, IBTransactionEdit, ibserviceeditor,
  dbFieldLinkPropEditor, ibexpress, LResources, IBSQLEditFrame,
  ibinsertsqleditor, ibmodifysqleditor, ibdeletesqleditor, ibsqleditor,
  ibrefreshsqleditor, IBXServiceEditor;

{$IFDEF WINDOWS}{$R test1.rc}{$ENDIF}

begin
  {$I test1.lrs}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TIBInsertSQLEditorForm, IBInsertSQLEditorForm);
  Application.CreateForm(TIBModifySQLEditorForm, IBModifySQLEditorForm);
  Application.CreateForm(TIBDeleteSQLEditorForm, IBDeleteSQLEditorForm);
  Application.CreateForm(TIBSQLEditorForm, IBSQLEditorForm);
  Application.CreateForm(TIBRefreshSQLEditorForm, IBRefreshSQLEditorForm);
  Application.Run;
end.

