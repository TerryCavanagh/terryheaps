package terryheaps;

import haxe.Constraints.Function;
import haxe.Timer;

class Core extends hxd.App {
	override function init() {
		hxd.Res.initEmbed();
		
		Gfx.init(this);
		Text.init();
		Sound.init();
		Music.init();
		Random.seed = 0;

		deltatime = 0;
		Main.init();
	}
	
	override function update(dt:Float) {
		deltatime = dt;
		Main.update();
	}
	
	public static function delaycall(f:Function, time:Float) {
		Timer.delay(function() { f(); }, Std.int(time * 1000));	
	}
	
	public static var deltatime:Float;
}