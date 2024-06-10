package lime._internal.backend.html5;

#if !js

class HTML5Libraries { }

#else

class HTML5Libraries {
	public static var pako(get, never):Pako;
	private static inline function get_pako():Pako {
		return #if haxe4 js.Syntax.code #else untyped __js__ #end
			(#if commonjs "require (\"pako\")" #else "pako" #end);
	}
}

extern class Pako {
	public function deflate(data:haxe.io.BytesData):haxe.io.BytesData;
	public function deflateRaw(data:haxe.io.BytesData):haxe.io.BytesData;
	public function inflate(data:haxe.io.BytesData):haxe.io.BytesData;
	public function inflateRaw(data:haxe.io.BytesData):haxe.io.BytesData;
	public function gzip(data:haxe.io.BytesData):haxe.io.BytesData;
	public function ungzip(data:haxe.io.BytesData):haxe.io.BytesData;
}

#end
