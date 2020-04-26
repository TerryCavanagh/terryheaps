package terryheaps;

class Gfx{
  public static function init(_c:Core){
    core = _c;
    scene2d = core.s2d;
    scene3d = core.s3d;

    drawto = scene2d;

    linethickness = 1.0;

		imageindex = new Map<String, h2d.Tile>();
		tileindex = new Map<String, Tileset>();
  }

  public static function resizescreen(newwidth:Int, newheight:Int){
		scene2d.scaleMode = LetterBox(newwidth, newheight, false);
  }

  /** Loads an image into the game. */
	public static function loadimage(imagename:String):Bool {
		imagename = imagename.toLowerCase();
		if (imageindex.exists(imagename)) return true; //This is already loaded, so we're done!
		
		//We're just gonna assume this exists already
		var newtile:h2d.Tile = hxd.Res.load("graphics/" + imagename + ".png").toTile();
		imageindex.set(imagename, newtile);
		
		return true;
  }
  
	public static function getimage(imagename:String):h2d.Tile{
		return imageindex.get(imagename);
  }
  
	public static function loadtiles(imagename:String, width:Int, height:Int):Bool {
		imagename = imagename.toLowerCase();
		if (tileindex.exists(imagename)) return true; //This is already loaded, so we're done!
		
		//We're just gonna assume this exists already
		var newtileset:Tileset = new Tileset(imagename, width, height);
		tileindex.set(imagename, newtileset);
		
		return true;
	}
  
	public static function numberoftiles(tileset:String):Int {
		return gettileset(tileset).numtiles;
	}
	
	public static function gettileset(tileset:String):Tileset{
		return tileindex.get(tileset);
  }

  public static function clearscreen(col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.fillbox(0, 0, screenwidth, screenheight, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }

  public static function drawbox(x:Float, y:Float, width:Float, height:Float, col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.drawbox(x, y, width, height, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }

  public static function fillbox(x:Float, y:Float, width:Float, height:Float, col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.fillbox(x, y, width, height, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }

  public static function setpixel(x:Float, y:Float, col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.fillbox(x, y, 1, 1, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }

  public static function drawcircle(x:Float, y:Float, radius:Float, col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.drawcircle(x, y, radius, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }

  public static function fillcircle(x:Float, y:Float, radius:Float, col:Int, alpha:Float = 1.0):Primative {
    var graphics:Primative = new Primative();

    graphics.fillcircle(x, y, radius, col, alpha);
    
    if(drawto != null) drawto.addChild(graphics);
    return graphics;
  }
  
  public static function drawimage(x:Float, y:Float, imagename:String, alpha:Float = 1.0):h2d.Bitmap{
    var t:h2d.Bitmap = new h2d.Bitmap(imageindex.get(imagename));
    t.x = x;
    t.y = y;
    t.alpha = alpha;

    if(drawto != null) drawto.addChild(t);
    return t;
  }

  public static function drawtile(x:Float, y:Float, tilesetname:String, tilenum:Int, alpha:Float = 1.0):h2d.Anim{
    var t:h2d.Anim = new h2d.Anim(tileindex.get(tilesetname).tiles, 0);
    t.x = x;
    t.y = y;
    t.currentFrame = tilenum;
    t.alpha = alpha;

    if(drawto != null) drawto.addChild(t);
    return t;
  }

  public static var linethickness(get,set):Float;
	private static var _linethickness:Float;

	static function get_linethickness():Float {
		return _linethickness;
	}

	static function set_linethickness(size:Float) {
		_linethickness = size;
		if (_linethickness < 0) _linethickness = 0;
		return _linethickness;
	}

  public static var core:Core;
  public static var scene2d:h2d.Scene;
  public static var scene3d:h3d.scene.Scene;

  public static var drawto:h2d.Object;

  public static var screenwidth(get, null):Int;
	@:noCompletion private static function get_screenwidth():Int{ return scene2d.width; }
	public static var screenheight(get, null):Int;
	@:noCompletion private static function get_screenheight():Int{ return scene2d.height; }
	public static var screenwidthmid(get, null):Int;
	@:noCompletion private static function get_screenwidthmid():Int{ return Std.int(scene2d.width / 2); }
	public static var screenheightmid(get, null):Int;
	@:noCompletion private static function get_screenheightmid():Int{ return Std.int(scene2d.height / 2); }
	
  public static var imageindex:Map<String, h2d.Tile>;
	public static var tileindex:Map<String, Tileset>;
}