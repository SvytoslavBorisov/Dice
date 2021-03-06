unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,math;

type
  TForm1 = class(TForm)
    b_Throw: TButton;
    img_Do: TImage;
    l_DiceValue: TLabel;
    l_DiceSituation: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure b_ThrowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var appPath:string;

implementation

{$R *.dfm}
 uses UnitDice;

var dice:TDice;

procedure TForm1.FormCreate(Sender: TObject);
var a, b: Integer;
begin
  Randomize;
  appPath := ExtractFilePath(Application.ExeName);
  dice := TDice.CreateDice(200,200);
  Form1.img_Do.Canvas.Draw(0,0,dice.DiceBackGround);
end;

procedure TForm1.b_ThrowClick(Sender: TObject);
var tmr, i, angle: Integer;
begin
  Angle := 0;
  tmr := RandomRange(100,200);
  for i:=1 to tmr do
   begin
      Angle := Angle - Random(25);
      If (Angle > 359) Or (Angle < -359) Then Angle := 0;
      Sleep(10);
      Form1.Caption := IntToStr(Angle);
      dice.DrawArrow(Angle);
      Form1.img_Do.Canvas.Draw(0,0,dice.DiceBackGround);
      Application.ProcessMessages;
   end;
   l_DiceValue.Caption :='���:  ' +intToStr(dice.GetValue);
   l_DiceSituation.Caption :='��������� ����� �� �������:  ' +dice.GetSituation;
end;

end.
