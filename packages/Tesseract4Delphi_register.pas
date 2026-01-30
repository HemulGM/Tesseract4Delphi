unit Tesseract4Delphi_register;

{$R res\ttesseractocr.dcr}

{$I ..\source\tesseract.inc}

interface

procedure Register;

implementation

uses
  {$IFDEF DELPHI16_UP}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}
  uTesseractOCR;

procedure Register;
begin
  RegisterComponents('Tesseract4Delphi', [TTesseractOCR]);
end;

end.
