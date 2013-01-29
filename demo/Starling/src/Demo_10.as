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
	import swallow.filters.MaskFilter;
	import swallow.filters.MosaicFilter;
	import swallow.filters.ReliefFilter;
	import swallow.filters.Screenshot;
	import swallow.filters.ShadowFilter;
	import swallow.filters.WaveFilter;
	import swallow.utils.Timer2D;
	/**
	 * 遮罩,这是一个需求很多的效果,目前实现得比较简单,期待有更多的反馈
	 * @-式神-
	 */
	public class Demo_10 extends Sprite 
	{
		[Embed(source="../res/wow.png")]
		private var resc:Class
		
		[Embed(source="../res/swallow.png")]
		private var resc2:Class
		
		private var texture:Texture
		private var texture2:Texture
		
		
		private var maskFilter:MaskFilter
		private var bitmap:Bitmap
		
		private var timer2d:Timer2D
		public function Demo_10() 
		{
			
			texture = Texture.fromBitmap(new resc());
			texture2 = Texture.fromBitmap(new resc2());
			
			var image:Image = new Image(texture);
			image.x = 256 - image.width / 2;
			image.y = 256 - image.height / 2;
			addChild(image);
			
			
			/**
			 * 遮罩滤镜
			 */
			maskFilter=new MaskFilter(texture2)
			image.filter = maskFilter;
			
			
			/*********************************************************以下忽略*************************************************/
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
			
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			maskFilter.centerX = Main.target.mouseX;
			maskFilter.centerY = Main.target.mouseY;
		}
		
		
	}

}