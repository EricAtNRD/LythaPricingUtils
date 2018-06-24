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
  ITEMSALEPERC = 5.0;       (* Sales fee - percentage *)
  ITEMLISTINGFEE = 0.20;    (* Listing fee - flat rate in USD *)

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
         BasePriceEdit.Value+BasePriceEdit.Value*(ITEMSALEPERC/100)+ITEMLISTINGFEE,
         ffFixed,5,2);
end;

procedure TLythaPricingUtilsForm.FormCreate(Sender: TObject);
begin
     (* Open on top right of screen. *)
     Top := 0;
     Left := Screen.Width-Width;

     (* Display price formula (caption). *)
     FormulaLabel.Caption := 'x' +
       FloatToStrF(ITEMSALEPERC,ffFixed,2,1) +
       '%+$' +
       FloatToStrF(ITEMLISTINGFEE,ffFixed,5,2) +
       '=';

     (* Calculate initial price based by manually calling event handler. *)
     BasePriceEditChange(LythaPricingUtilsForm);
end;


end.
