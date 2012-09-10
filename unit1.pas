unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin;

type

  { TLythaPricingUtilsForm }

  TLythaPricingUtilsForm = class(TForm)
    BasePriceEdit: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EtsyPriceLabel: TLabel;
    procedure BasePriceEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  LythaPricingUtilsForm: TLythaPricingUtilsForm;

implementation

{$R *.lfm}

{ TLythaPricingUtilsForm }


procedure TLythaPricingUtilsForm.BasePriceEditChange(Sender: TObject);
begin
     EtsyPriceLabel.Caption := FloatToStrF(
       BasePriceEdit.Value+BasePriceEdit.Value*0.035+0.2
       ,ffCurrency,5,2);
end;

procedure TLythaPricingUtilsForm.FormCreate(Sender: TObject);
begin
     Top := 0;
     Left := Screen.Width-Width;
end;


end.

