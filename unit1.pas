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
    FormulaLabel: TLabel;
    EtsyPriceLabel: TLabel;
    procedure BasePriceEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

const
  ITEMSALEPERC = 3.5;       (* Sales fee - percentage *)
  ITEMLISTINGFEE = 0.20;    (* Listing fee - flat rate in USD *)

var
  LythaPricingUtilsForm: TLythaPricingUtilsForm;

implementation

{$R *.lfm}

{ TLythaPricingUtilsForm }


procedure TLythaPricingUtilsForm.BasePriceEditChange(Sender: TObject);
begin
     EtsyPriceLabel.Caption := '$' +
       FloatToStrF(
         BasePriceEdit.Value+BasePriceEdit.Value*(ITEMSALEPERC/100)+ITEMLISTINGFEE,
         ffFixed,5,2);
end;

procedure TLythaPricingUtilsForm.FormCreate(Sender: TObject);
begin
     Top := 0;
     Left := Screen.Width-Width;
     FormulaLabel.Caption := 'x' +
       FloatToStrF(ITEMSALEPERC,ffFixed,2,1) +
       '%+$' +
       FloatToStrF(ITEMLISTINGFEE,ffFixed,5,2) +
       '=';
     BasePriceEditChange(LythaPricingUtilsForm);
end;


end.
