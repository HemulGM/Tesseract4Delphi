unit uTesseractTypes;

{$IFDEF FPC}
  {$MODE OBJFPC}{$H+}
{$ENDIF}

{$I tesseract.inc}

{$IFNDEF TARGET_64BITS}{$ALIGN ON}{$ENDIF}
{$MINENUMSIZE 4}

interface

uses
  uLeptonicaTypes;

type
  TFileDescriptor = type integer;
  PFileDescriptor = ^TFileDescriptor;

  PPUTF8Char = ^PUTF8Char;
  PPInteger  = ^PInteger;

  TessResultRenderer  = Pointer;
  TessBaseAPI         = Pointer;
  TessPageIterator    = Pointer;
  TessResultIterator  = Pointer;
  TessMutableIterator = Pointer;
  TessChoiceIterator  = Pointer;
  PETEXT_DESC         = Pointer;

  TessOcrEngineMode = (OEM_TESSERACT_ONLY,
                       OEM_LSTM_ONLY,
                       OEM_TESSERACT_LSTM_COMBINED,
                       OEM_DEFAULT);

  TessPageSegMode = (PSM_OSD_ONLY,
                     PSM_AUTO_OSD,
                     PSM_AUTO_ONLY,
                     PSM_AUTO,
                     PSM_SINGLE_COLUMN,
                     PSM_SINGLE_BLOCK_VERT_TEXT,
                     PSM_SINGLE_BLOCK,
                     PSM_SINGLE_LINE,
                     PSM_SINGLE_WORD,
                     PSM_CIRCLE_WORD,
                     PSM_SINGLE_CHAR,
                     PSM_SPARSE_TEXT,
                     PSM_SPARSE_TEXT_OSD,
                     PSM_RAW_LINE,
                     PSM_COUNT);

  TessPageIteratorLevel = (RIL_BLOCK,
                           RIL_PARA,
                           RIL_TEXTLINE,
                           RIL_WORD,
                           RIL_SYMBOL);

  TessPolyBlockType = (PT_UNKNOWN,
                       PT_FLOWING_TEXT,
                       PT_HEADING_TEXT,
                       PT_PULLOUT_TEXT,
                       PT_EQUATION,
                       PT_INLINE_EQUATION,
                       PT_TABLE,
                       PT_VERTICAL_TEXT,
                       PT_CAPTION_TEXT,
                       PT_FLOWING_IMAGE,
                       PT_HEADING_IMAGE,
                       PT_PULLOUT_IMAGE,
                       PT_HORZ_LINE,
                       PT_VERT_LINE,
                       PT_NOISE,
                       PT_COUNT);

  TessOrientation = (ORIENTATION_PAGE_UP,
                     ORIENTATION_PAGE_RIGHT,
                     ORIENTATION_PAGE_DOWN,
                     ORIENTATION_PAGE_LEFT);

  TessParagraphJustification = (JUSTIFICATION_UNKNOWN,
                                JUSTIFICATION_LEFT,
                                JUSTIFICATION_CENTER,
                                JUSTIFICATION_RIGHT);

  TessWritingDirection = (WRITING_DIRECTION_LEFT_TO_RIGHT,
                          WRITING_DIRECTION_RIGHT_TO_LEFT,
                          WRITING_DIRECTION_TOP_TO_BOTTOM);

  TessTextlineOrder = (TEXTLINE_ORDER_LEFT_TO_RIGHT,
                       TEXTLINE_ORDER_RIGHT_TO_LEFT,
                       TEXTLINE_ORDER_TOP_TO_BOTTOM);

  /// <summary>
  /// <para>Single character.</para>
  /// <para>It should be noted that the format for char_code for version 2.0 and beyond
  /// is UTF8 which means that ASCII characters will come out as one structure
  /// but other characters will be returned in two or more instances of this
  /// structure with a single byte of the  UTF8 code in each, but each will have
  /// the same bounding box. Programs which want to handle languages with
  /// different characters sets will need to handle extended characters
  /// appropriately, but *all* code needs to be prepared to receive UTF8 coded
  /// characters for characters such as bullet and fancy quotes.</para>
  /// </summary>
  /// <remarks>
  /// <para><see href="https://github.com/tesseract-ocr/tesseract/blob/main/include/tesseract/ocrclass.h">Tesseract source file: /include/tesseract/ocrclass.h (EANYCODE_CHAR)</see></para>
  /// </remarks>
  EANYCODE_CHAR = record
    /// <summary>
    /// character itself
    /// </summary>
    char_code  : word;
    /// <summary>
    /// of char (-1)
    /// </summary>
    left       : Smallint;
    /// <summary>
    /// of char (-1)
    /// </summary>
    right      : Smallint;
    /// <summary>
    /// of char (-1)
    /// </summary>
    top        : Smallint;
    /// <summary>
    /// of char (-1)
    /// </summary>
    bottom     : Smallint;
    /// <summary>
    /// what font (0)
    /// </summary>
    font_index : Smallint;
    /// <summary>
    /// 0=perfect, 100=reject (0/100)
    /// </summary>
    confidence : byte;
    /// <summary>
    /// of char, 72=i inch, (10)
    /// </summary>
    point_size : byte;
    /// <summary>
    /// no of spaces before this char (1)
    /// </summary>
    blanks     : Shortint;
    /// <summary>
    /// char formatting (0)
    /// </summary>
    formatting : byte;
  end;

  CANCEL_FUNC    = function(cancel_this: Pointer; words: Integer): Boolean; cdecl;
  PROGRESS_FUNC  = function(progress, left, right, top, bottom: Integer): Boolean; cdecl;
  PROGRESS_FUNC2 = function(ths: PETEXT_DESC; left, right, top, bottom: Integer): Boolean; cdecl;

  TessCancelFunc   = type CANCEL_FUNC;
  TessProgressFunc = type PROGRESS_FUNC2;

  /// <summary>
  /// Status of TTesseractLoader.
  /// </summary>
  TTesseractLoaderStatus = (tlsLoading,
                            tlsInitialized,
                            tlsShuttingDown,
                            tlsUnloaded,
                            tlsErrorMissingFiles,
                            tlsErrorDLLVersion,
                            tlsErrorWindowsVersion,
                            tlsErrorLoadingLibrary,
                            tlsErrorInitializingLibrary);

implementation

end.
