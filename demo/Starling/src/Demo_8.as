package  
{
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.ui.Mouse;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import swallow.events.TimerEvent2D;
	import swallow.filters.AdvancedFilter;
	import swallow.filters.HdrFilter;
	import swallow.filters.LightFilter;
	import swallow.filters.MosaicFilter;
	import swallow.filters.ReliefFilter;
	import swallow.filters.Screenshot;
	import swallow.filters.ShadowFilter;
	import swallow.filters.WaveFilter;
	import swallow.utils.Timer2D;
	/**
	 * 截图,可以用做游戏截图,保存缩图,微博分享
	 * @-式神-
	 */
	public class Demo_8 extends Sprite 
	{
		[Embed(source="../res/wow.png")]
		private var resc:Class
		private var texture:Texture
		
		private var bitmap:Bitmap
		public function Demo_8() 
		{
			
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			image.x = 256 - image.width / 2;
			image.y = 256 - image.height / 2;
			addChild(image);
			
			//截图
			var screenshot:Screenshot = new Screenshot(this,512,512,function(value:BitmapData):void{
			   //value是当前截图的数据,回调会一直执行,你可以通过自己判断选择截图几次
			   if (bitmap == null)
			   {
				   bitmap = new Bitmap(value)
				   bitmap.scaleX = bitmap.scaleY = .5;
				   Main.target.addChild(bitmap);
			   }
			 });
		}
		
		
	}

}