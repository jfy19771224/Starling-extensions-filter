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
	import swallow.filters.WaveFilter;
	import swallow.utils.Timer2D;
	/**
	 * 波浪滤镜,可以用作海浪,玻璃,
	 * @-式神-
	 */
	public class Demo_6 extends Sprite 
	{
		[Embed(source="../res/swallow.png")]
		private var resc:Class
		
		private var texture:Texture
		
		
		private var waveFilter:WaveFilter
		private var timer2d:Timer2D
		
		
	
	
		
		private var sdirection:Slider;
		private var sthresholdScope:Slider;
		private var sthresholdDensity:Slider;
		private var sfrequency:Slider;
	
		public function Demo_6() 
		{
			
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			image.x = 256 - image.width / 2;
			image.y = 256 - image.height / 2;
			addChild(image);
			
			//波浪滤镜
			waveFilter = new WaveFilter();
			image.filter = waveFilter
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 120;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "direction");
			new Text(panel, 120, 23, "thresholdScope");
			new Text(panel, 120, 43, "thresholdDensity");
			new Text(panel, 120, 63, "frequency");
		
			
			sdirection = new Slider();
			sdirection.maximum = 10;
			sdirection.value = 1;
			sdirection.x = 10;
			sdirection.y = 10;
			panel.addChild(sdirection);
			
			sthresholdScope = new Slider();
			sthresholdScope.maximum = 100;
			sthresholdScope.value = 20;
			sthresholdScope.x = 10;
			sthresholdScope.y = 30;
			panel.addChild(sthresholdScope);
			
			sthresholdDensity = new Slider();
			sthresholdDensity.maximum = 1000;
			sthresholdDensity.value = 100;
			sthresholdDensity.x = 10;
			sthresholdDensity.y = 50;
			panel.addChild(sthresholdDensity);
			
			sfrequency = new Slider();
			sfrequency.maximum = 100;
			sfrequency.value = 10;
			sfrequency.x = 10;
			sfrequency.y = 70;
			panel.addChild(sfrequency);
		
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			waveFilter.direction += sdirection.value;
			waveFilter.thresholdScope = sthresholdScope.value;
			waveFilter.thresholdDensity = sthresholdDensity.value / 10000;
			waveFilter.frequency = sfrequency.value;
		}
		
	}

}