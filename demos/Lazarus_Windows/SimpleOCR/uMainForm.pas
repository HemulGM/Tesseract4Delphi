unit uMainForm;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  uTesseractBaseAPI, uTesseractOCR;

type

  { TMainForm }

  TMainForm = class(TForm)
    OpenSampleBtn: TButton;
    OpenDialog1: TOpenDialog;
    OpenBtn: TButton;
    Memo1: TMemo;
    ButtonPnl: TPanel;
    MainPnl: TPanel;
    Splitter1: TSplitter;
    Image1: TImage;
    RecognizeBtn: TButton;
    TesseractOCR1: TTesseractOCR;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure OpenBtnClick(Sender: TObject);
    procedure OpenSampleBtnClick(Sender: TObject);
    procedure RecognizeBtnClick(Sender: TObject);
    procedure TesseractOCR1Progress(Sender: TObject; progress, left, right, top,
      bottom: Integer);
  private
    { Private declarations }
    procedure OpenImage(const aFileName : string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

uses
  uLeptonicaLoader, uTesseractLoader;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not(TesseractOCR1.Initialize('org.sw.demo.danbloomberg.leptonica-1.86.0.dll',
                                  'google.tesseract.libtesseract-main.dll',
                                  '..\assets\tessdata\',
                                  'eng')) then
    begin
      Memo1.Lines.Add('There was an issue initializing Tesseract.');
      ButtonPnl.Enabled := False;
    end;
end;

procedure TMainForm.OpenImage(const aFileName : string);
var
  TempImage : TBitmap;
begin
  if FileExists(aFileName) then
    begin
      TempImage := TBitmap.Create;
      TempImage.LoadFromFile(aFileName);
      Image1.Picture.Assign(TempImage);
      TempImage.Free;

      TesseractOCR1.BaseAPI.SetImage(aFileName);
    end;
end;

procedure TMainForm.OpenBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    OpenImage(OpenDialog1.FileName);
end;

procedure TMainForm.OpenSampleBtnClick(Sender: TObject);
begin
  OpenImage('..\assets\samples\eng-text.bmp');
end;

procedure TMainForm.RecognizeBtnClick(Sender: TObject);
begin
  if TesseractOCR1.Recognize then
    Memo1.Lines.SetText(PChar(TesseractOCR1.BaseAPI.GetText))
   else
    Memo1.Lines.Clear;

  ProgressBar1.Visible := False;
end;

procedure TMainForm.TesseractOCR1Progress(Sender: TObject; progress, left,
  right, top, bottom: Integer);
begin
  if (progress in [0..99]) then
    begin
      ProgressBar1.Visible  := True;
      ProgressBar1.Position := progress;
    end
   else
    ProgressBar1.Visible := False;
end;

end.
