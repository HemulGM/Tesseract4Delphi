{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit Tesseract4Delphi;

{$warn 5023 off : no warning about unused units}
interface

uses
  uLeptonicaBox, uLeptonicaBoxArray, uLeptonicaConstants, 
  uLeptonicaLibFunctions, uLeptonicaLoader, uLeptonicaMiscFunctions, 
  uLeptonicaPix, uLeptonicaPixArray, uLeptonicaTypes, uTesseractBaseAPI, 
  uTesseractChoiceIterator, uTesseractConstants, uTesseractIntegerArray, 
  uTesseractLibFunctions, uTesseractLoader, uTesseractMiscFunctions, 
  uTesseractMonitor, uTesseractOCR, uTesseractPageIterator, 
  uTesseractResultIterator, uTesseractTypes, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('uTesseractOCR', @uTesseractOCR.Register);
end;

initialization
  RegisterPackage('Tesseract4Delphi', @Register);
end.
