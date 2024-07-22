unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uCalculator;

type
  TMainFm = class(TForm)
    lblOutput: TLabel;
    lblHistory: TLabel;
    btnEqual: TButton;
    btn1: TButton;
    btn4: TButton;
    btn2: TButton;
    btn5: TButton;
    btn3: TButton;
    btn6: TButton;
    btn9: TButton;
    btn7: TButton;
    btn8: TButton;
    btnMultiply: TButton;
    btnDivide: TButton;
    btnMinus: TButton;
    btnPlus: TButton;
    btn0: TButton;
    btnC: TButton;
    btnCe: TButton;
    btnDot: TButton;
    btnBackspace: TButton;
    procedure btnEqualClick(Sender: TObject);
    procedure btnNumClick(Sender: TObject);
    procedure btnActClick(Sender: TObject);
    procedure btnDotClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFm: TMainFm;

implementation

{$R *.dfm}


procedure TMainFm.btnNumClick(Sender: TObject);
begin
  if (lblOutput.Caption = '0') or (lblOutput.Caption = 'Невозможно деление на 0')
  or (lblOutput.Caption = 'Некорректная запись') then
  begin
    lblOutput.Caption := '';
  end;
  lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnActClick(Sender: TObject);
var
  str : string;
begin
  str := lblOutput.Caption;
  if not(lblOutput.Caption[str.Length] in ['+','-','/','*']) and
  ((lblOutput.Caption <> 'Невозможно деление на 0') and
  (lblOutput.Caption <> 'Некорректная запись')) then
    lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnCClick(Sender: TObject);
begin
   lblOutput.Caption := '0';
   lblHistory.Caption := '';
end;

procedure TMainFm.btnDotClick(Sender: TObject);
var
  I: ShortInt;
  str: string;
begin
  str := lblOutput.Caption;
  I := str.Length;
  while (not (lblOutput.Caption[I] in ['+', '-', '*', '/'])) and (I > 1) do
  begin
    if lblOutput.Caption[I] = ',' then
      exit ;
    I := I - 1;
  end;
  lblOutput.Caption := lblOutput.Caption + (Sender as TButton).Caption;
end;

procedure TMainFm.btnEqualClick(Sender: TObject);
var
  str: string;
  calc: TCalculator;
begin
  str := lblOutput.Caption;
  lblHistory.Caption := str + ' =';
  lblOutput.Caption:= calc.CalculateAll(str);
end;
end.

