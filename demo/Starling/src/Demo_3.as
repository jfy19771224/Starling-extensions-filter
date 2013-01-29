package  
{
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import swallow.events.TimerEvent2D;
	import swallow.filters.AdvancedFilter;
	import swallow.filters.HdrFilter;
	import swallow.utils.Timer2D;
	/**
	 * HDR滤镜,可以用做场景特效,那种回忆录,蒙蒙的感觉,或者寂静岭昏暗的感觉.
	 * @-式神-
	 */
	public class Demo_3 extends Sprite 
	{
		[Embed(source="../res/baolei.png")]
		private var resc:Class
		
		private var texture:Texture
		
		private var hdrFilter:HdrFilter
		
		private var timer2d:Timer2D
		
		
		private var sthreshold:Slider;
		
		public function Demo_3() 
		{
			
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			addChild(image);
			
			//HDR滤镜
			hdrFilter = new HdrFilter();
			image.filter = hdrFilter;
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 75;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "threshold");
		
			
			sthreshold = new Slider();
			sthreshold.maximum = 300;
			sthreshold.value = 160;
			sthreshold.x = 10;
			sthreshold.y = 10;
			panel.addChild(sthreshold);
			
			
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			hdrFilter.threshold = sthreshold.value / 100;
			
		}
			
		
		
	}

}