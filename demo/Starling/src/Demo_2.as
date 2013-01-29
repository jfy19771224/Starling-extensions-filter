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
	import swallow.utils.Timer2D;
	/**
	 * 色调滤镜,可以用来模拟装甲变身,爆气,血量低等效果
	 * @-式神-
	 */
	public class Demo_2 extends Sprite 
	{
		[Embed(source="../res/swallow.png")]
		private var resc:Class
		
		private var texture:Texture
		
		private var advancedFilter:AdvancedFilter
		
		private var timer2d:Timer2D
		
		private var sliderR:Slider
		private var sliderG:Slider
		private var sliderB:Slider
		private var sliderA:Slider
		
		public function Demo_2() 
		{
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			image.x = 150;
			image.y = 150;
			addChild(image);
			
			//色调滤镜
			advancedFilter = new AdvancedFilter();
			image.filter = advancedFilter;
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 125;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "R");
			new Text(panel, 120, 23, "G");
			new Text(panel, 120, 43, "B");
			new Text(panel, 120, 63, "A");
			
			sliderR = new Slider();
			sliderR.x = 10;
			sliderR.y = 10;
			sliderR.maximum = 100;
			sliderR.value = 0;
			panel.addChild(sliderR);
			
			sliderG = new Slider();
			sliderG.x = 10;
			sliderG.y = 30;
			sliderG.maximum = 100;
			sliderG.value = 0;
			panel.addChild(sliderG);
			
			sliderB = new Slider();
			sliderB.x = 10;
			sliderB.y = 50;
			sliderB.maximum = 100;
			sliderB.value = 0;
			panel.addChild(sliderB);
			
			sliderA = new Slider();
			sliderA.x = 10;
			sliderA.y = 70;
			sliderA.maximum = 100;
			sliderA.value = 0;
			panel.addChild(sliderA);
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			advancedFilter.addR = sliderR.value / 100;
			advancedFilter.addG = sliderG.value / 100;
			advancedFilter.addB = sliderB.value / 100;
			advancedFilter.addA = sliderA.value / 100;
			
		}
		
	}

}