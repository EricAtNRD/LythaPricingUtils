program LythaPricingUtils;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1
  { you can add units after this };

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLythaPricingUtilsForm, LythaPricingUtilsForm);
  Application.Run;
end.

