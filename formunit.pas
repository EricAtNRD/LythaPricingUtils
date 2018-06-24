unit FormUnit;

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
    EtsyFormulaLabel: TLabel;
    EtsyPriceLabel: TLabel;
    procedure BasePriceEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

const
  ETSYITEMSALEPERC = 5.0;       (* Etsy.com Sales fee - percentage *)
  ETSYITEMLISTINGFEE = 0.20;    (* Etsy.com Listing fee - flat rate in USD *)

var
  LythaPricingUtilsForm: TLythaPricingUtilsForm;

implementation

{$R *.lfm}

{ TLythaPricingUtilsForm }


procedure TLythaPricingUtilsForm.BasePriceEditChange(Sender: TObject);
begin
     (* Update item price (caption). *)
     EtsyPriceLabel.Caption := '$' +
       FloatToStrF(
         BasePriceEdit.Value+BasePriceEdit.Value*(ETSYITEMSALEPERC/100)+ETSYITEMLISTINGFEE,
         ffFixed,5,2);
end;

procedure TLythaPricingUtilsForm.FormCreate(Sender: TObject);
begin
     (* Open on top right of screen. *)
     Top := 0;
     Left := Screen.Width-Width;

     (* Display price formula (caption). *)
     EtsyFormulaLabel.Caption := 'x' +
       FloatToStrF(ETSYITEMSALEPERC,ffFixed,2,1) +
       '%+$' +
       FloatToStrF(ETSYITEMLISTINGFEE,ffFixed,5,2) +
       '=';

     (* Calculate initial price based by manually calling event handler. *)
     BasePriceEditChange(LythaPricingUtilsForm);
end;


end.

