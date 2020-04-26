package terryheaps;

class Primative extends h2d.Object{
  public function new(){
    super();
    graphics = new h2d.Graphics(this);
    drawn = false;
  }

  public function fillbox(x:Float, y:Float, width:Float, height:Float, col:Int, alpha:Float = 1.0) {
    if(drawn) graphics.clear();
    graphics.beginFill(col, alpha);
    graphics.drawRect(x, y, width, height);
    graphics.endFill();

    drawn = true;
  }

  public function drawbox(x:Float, y:Float, width:Float, height:Float, col:Int, alpha:Float = 1.0) {
    if(drawn) graphics.clear();
    graphics.lineStyle(Gfx.linethickness, col, alpha);
    graphics.drawRect(x, y, width, height);

    drawn = true;
  }

  public function fillcircle(x:Float, y:Float, radius:Float, col:Int, alpha:Float = 1.0){
    if(drawn) graphics.clear();
    graphics.beginFill(col, alpha);
    graphics.drawCircle(x, y, radius);
    graphics.endFill();

    drawn = true;
  }

  public function drawcircle(x:Float, y:Float, radius:Float, col:Int, alpha:Float = 1.0){
    if(drawn) graphics.clear();
    graphics.lineStyle(Gfx.linethickness, col, alpha);
    graphics.drawCircle(x, y, radius);

    drawn = true;
  }

  public var graphics:h2d.Graphics;  
  public var drawn:Bool;
}