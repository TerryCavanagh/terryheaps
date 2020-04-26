package terryheaps;

class Text{
  public static function init(){
    fontindex = new Map<String, h2d.Font>();
    fontindex.set("default", hxd.res.DefaultFont.get());
    _fontobj = fontindex.get("default");
    size = 1;
    align = Left;
  }

  public static function loadfont(fontname:String, fontresouce:h2d.Font){
    if(fontindex.exists(fontname)){
      trace("Warning: font \"" + fontname + "\" is already loaded.");
      return;
    }else{
      fontindex.set(fontname, fontresouce);
    }
  }
  
  public static function display(x:Float, y:Float, text:Dynamic, color:Int = 0xFFFFFF, alpha:Float = 1.0):h2d.Text {
    var tf:h2d.Text = new h2d.Text(_fontobj);
    
    if (Std.is(text, Array)){
			text = text.toString();
		}else if (!Std.is(text, String)){
			text = Std.string(text);
    }
    
    tf.x = x;
		tf.y = y;
		tf.text = text;
		tf.textColor = color;
		tf.alpha = alpha;
		tf.setScale(size);
    tf.textAlign = align;
    
    if(Gfx.drawto != null) Gfx.drawto.addChild(tf);

    return tf;
  }

  public static var font(get, set):String;
  private static var _font:String;
  private static var _fontobj:h2d.Font;
  private static function get_font():String{ return _font; }
  private static function set_font(newfont:String):String{
    if(fontindex.exists(newfont)){
      _fontobj = fontindex.get(newfont);
      _font = newfont;
    }else{
      trace("Error: font \"" + newfont + "\" not found, falling back to default");
      _fontobj = fontindex.get("default");
      _font = "default";
    }
    return _font; 
  }

  private static var fontindex:Map<String, h2d.Font>;
  public static var size:Float;
  public static var align:h2d.Text.Align;
}