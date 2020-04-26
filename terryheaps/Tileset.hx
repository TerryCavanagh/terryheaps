package terryheaps;

class Tileset{
	public function new(tilesetname:String, w:Int, h:Int){
		tiles = [];

		tilesetdata = hxd.Res.load("graphics/" + tilesetname + ".png").toTile();
		
		tiles = [
			for(y in 0 ... Std.int(tilesetdata.height / h)) 
				for(x in 0...Std.int(tilesetdata.width / w)) 
					tilesetdata.sub(x * w, y * h, w, h)
		];
		
		name = tilesetname;
		width = w; height = h;
		numtiles = tiles.length;
	}

	public var name:String;
	public var width:Int;
	public var height:Int;
	public var numtiles:Int;

	public var tilesetdata:h2d.Tile;
	public var tiles:Array<h2d.Tile>;

	public var halign:Int;
	public var valign:Int;
}