unit uTesseractConstants;

{$IFDEF FPC}
  {$MODE OBJFPC}{$H+}
{$ENDIF}

interface

const
  {$I uTesseractVersion.inc}

  CRLF = #13 + #10;

  {$IFDEF DELPHI16_UP}
  {$IF NOT DECLARED(pidWin32)}
  pidWin32 = 0;
  {$IFEND}
  {$IF NOT DECLARED(pidWin64)}
  pidWin64 = 0;
  {$IFEND}
  {$IF NOT DECLARED(pfidWindows)}
  pfidWindows = pidWin32 or pidWin64;
  {$IFEND}
  {$ENDIF}

implementation

end.
