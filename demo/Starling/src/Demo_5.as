package  
{
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import flash.ui.Mouse;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import swallow.events.TimerEvent2D;
	import swallow.filters.AdvancedFilter;
	import swallow.filters.HdrFilter;
	import swallow.filters.LightFilter;
	import swallow.filters.MosaicFilter;
	import swallow.utils.Timer2D;
	/**
	 * 马赛克滤镜,女神护盾
	 * @-式神-
	 */
	public class Demo_5 extends Sprite 
	{
		[Embed(source="../res/av.jpg")]
		private var resc:Class
		
		private var texture:Texture
		
		private var mosaicFilter:MosaicFilter
		
		private var timer2d:Timer2D
		
		
	
		private var sthresholdX:Slider
		private var sthresholdY:Slider
		
		public function Demo_5() 
		{
			
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			image.x = 256 - image.width / 2;
			image.y = 256 - image.height / 2;
			addChild(image);
			
			//马赛克滤镜
			mosaicFilter = new MosaicFilter();
			image.filter = mosaicFilter;
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 75;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "thresholdX");
			new Text(panel, 120, 23, "thresholdY");
			
		
			
			sthresholdX = new Slider();
			sthresholdX.maximum = 100;
			sthresholdX.value = 10;
			sthresholdX.x = 10;
			sthresholdX.y = 10;
			panel.addChild(sthresholdX);
			
			sthresholdY = new Slider();
			sthresholdY.maximum = 100;
			sthresholdY.value = 10;
			sthresholdY.x = 10;
			sthresholdY.y = 30;
			panel.addChild(sthresholdY);
		
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			mosaicFilter.thresholdX = sthresholdX.value;
			mosaicFilter.thresholdY = sthresholdY.value;
		}
		
	}

}