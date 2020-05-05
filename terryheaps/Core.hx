package terryheaps;

import haxe.Constraints.Function;
import haxe.Timer;

class Core extends hxd.App {
	override function init() {
		super.init();
		Gfx.core = this;
		assetsloaded = false;

		#if generatemanifestfs
		cherry.fs.ManifestBuilder.generate("data", null, "manifest.json");
		#end

		#if manifestfs
		var loader:cherry.res.ManifestLoader = cherry.fs.ManifestBuilder.initManifest("data");
		cherry.res.ManifestLoader.concurrentFiles = 4;
		var preloader = new TerryManifestProgress(loader, Col.BLACK, completeinit, s2d);
		preloader.start();
		#else
		hxd.Res.initEmbed();
    completeinit();
		#end
	}

	function completeinit(){
		Gfx.init();
		Text.init();
		Sound.init();
		Music.init();
		Random.seed = 0;

		deltatime = 0;
		Main.init();
		assetsloaded = true;
	}
	
	override function update(dt:Float) {
		deltatime = dt;
		if(assetsloaded) Main.update();
	}
	
	public static function delaycall(f:Function, time:Float) {
		Timer.delay(function() { f(); }, Std.int(time * 1000));	
	}
	
	public static var deltatime:Float;
	public static var assetsloaded:Bool;
}