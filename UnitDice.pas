unit UnitDice;

interface
uses SysUtils, WinTypes,Classes,Graphics,math, unit1;
type
  TDice = class

    pCenter: TPoint;
    ArrowLength:Integer;
    Angle: Integer;
    p1,p2,p3,p4, rotated: TPoint;
    tmp: TBitmap;
    DiceBackGround: TBitmap;
    constructor CreateDice(h,w: Integer);
    procedure DrawArrow(alpha: Integer);
    function RotatePoint(point: TPoint; alpha: real): TPoint;
    function GetValue: Integer;
    function GetSituation: string;
  private

    function Between(Check, Left, Right: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

constructor TDice.CreateDice(h,w: Integer);
var a, b: Integer;
begin
  ArrowLength := Round(0.8 * w);
  pCenter.x := w div 2;
  pCenter.y := h div 2;

  a := 10;
  b := 30;
  Angle := 0;
  p1.x := pCenter.X;
  p1.y := pCenter.Y - ArrowLength div 2;

  p2.x := pCenter.X;
  p2.y := pCenter.Y + ArrowLength div 2;
  p3.x := p2.X - a;
  p3.y := p2.Y - b;
  p4.x := p2.X + a;
  p4.y := p2.Y - b;

  tmp:=TBitmap.Create;
  tmp.TransparentColor:=clWhite;
  tmp.Transparent:=True;
  tmp.LoadFromFile(appPath+'\dice.bmp' );


  DiceBackGround := TBitmap.Create;
  DiceBackGround.Height := 200;
  DiceBackGround.Width := 200;
 // DiceBackGround.TransparentColor :=clWhite;
 // DiceBackGround.Transparent:=True;


  DrawArrow(Angle);
end;

function TDice.Between(Check, Left, Right: Integer): Boolean;
begin
  Result := (Check >= Left) and (Check <= Right);
end;


function TDice.RotatePoint(point: TPoint; alpha: real): TPoint;
var rotated: TPoint;
begin
  rotated.x := Round( cos(alpha*pi/180)*(point.x - pCenter.x) + sin(alpha*pi/180)*(point.y - pCenter.y) ) + pCenter.x;
  rotated.y := Round( cos(alpha*pi/180)*(point.y - pCenter.y) - sin(alpha*pi/180)*(point.x - pCenter.x) ) + pCenter.y;
  Result := rotated;
end;

Procedure TDice.DrawArrow(alpha: Integer);
var  dp1, dp2, dp3, dp4: TPoint;
Begin
  Angle := alpha;
  dp1 := RotatePoint(p1,Angle);
  dp2 := RotatePoint(p2,Angle);
  dp3 := RotatePoint(p3,Angle);
  dp4 := RotatePoint(p4,Angle);

  //DiceBackGround.Canvas.Rectangle(DiceBackGround.Canvas.ClipRect);


  DiceBackGround.Canvas.StretchDraw(DiceBackGround.Canvas.ClipRect,tmp);
  DiceBackGround.Canvas.Pen.Width:=3;

  DiceBackGround.Canvas.MoveTo(dp2.X,dp2.Y);
  DiceBackGround.Canvas.LineTo(dp1.X,dp1.Y);

  DiceBackGround.Canvas.MoveTo(dp2.X,dp2.Y);
  DiceBackGround.Canvas.LineTo(dp3.X,dp3.Y);

  DiceBackGround.Canvas.MoveTo(dp2.X,dp2.Y);
  DiceBackGround.Canvas.LineTo(dp4.X,dp4.Y);

  DiceBackGround.Canvas.MoveTo(pCenter.x, pCenter.y);
  DiceBackGround.Canvas.Ellipse(pCenter.x-5,pCenter.y-5,pCenter.x+5,pCenter.y+5);

End;

function TDice.GetValue: Integer;
var a:Integer;
begin
  if Between(Angle, -59,   0) then Result := 4;
  if Between(Angle,-119, -60) then Result := 5;
  if Between(Angle,-179,-119) then Result := 6;
  if Between(Angle,-239,-180) then Result := 1;
  if Between(Angle,-299,-240) then Result := 2;
  if Between(Angle,-359,-300) then Result := 3;
end;

function TDice.GetSituation: string;
begin
  if Between(Angle, -59,   0) then Result := 'GOOL';
  if Between(Angle,-119, -60) then Result := 'SAVE';
  if Between(Angle,-179,-119) then Result := 'CORNER';
  if Between(Angle,-239,-180) then Result := 'GOOL';
  if Between(Angle,-299,-240) then Result := 'SAVE';
  if Between(Angle,-359,-300) then Result := 'CORNER';
end;
end.
