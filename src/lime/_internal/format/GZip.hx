package lime._internal.format;

import haxe.io.Bytes;
import lime._internal.backend.html5.HTML5Libraries.*;
import lime._internal.backend.native.NativeCFFI;

#if !lime_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime._internal.backend.native.NativeCFFI)
class GZip
{
	public static function compress(bytes:Bytes):Bytes
	{
		#if (lime_cffi && !macro)
		#if !cs
		return NativeCFFI.lime_gzip_compress(bytes, Bytes.alloc(0));
		#else
		var data:Dynamic = NativeCFFI.lime_gzip_compress(bytes, null);
		if (data == null) return null;
		return @:privateAccess new Bytes(data.length, data.b);
		#end
		#elseif js
		return Bytes.ofData(pako.gzip(bytes.getData()));
		#else
		return null;
		#end
	}

	public static function decompress(bytes:Bytes):Bytes
	{
		#if (lime_cffi && !macro)
		#if !cs
		return NativeCFFI.lime_gzip_decompress(bytes, Bytes.alloc(0));
		#else
		var data:Dynamic = NativeCFFI.lime_gzip_decompress(bytes, null);
		if (data == null) return null;
		return @:privateAccess new Bytes(data.length, data.b);
		#end
		#elseif js
		return Bytes.ofData(pako.ungzip(bytes.getData()));
		#else
		return null;
		#end
	}
}
