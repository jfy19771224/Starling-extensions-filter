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
	import swallow.filters.ReliefFilter;
	import swallow.filters.WaveFilter;
	import swallow.utils.Timer2D;
	/**
	 * 浮雕滤镜,虽然作用不大,但貌似也很有趣
	 * @-式神-
	 */
	public class Demo_7 extends Sprite 
	{
		[Embed(source="../res/swallow.png")]
		private var resc2:Class
		
		[Embed(source="../res/material.jpg")]
		private var resc:Class
		
		private var texture:Texture
		private var texture2:Texture
		
		private var reliefFilter:ReliefFilter
		private var timer2d:Timer2D
		
		
	
	
		
		private var sthresholdX:Slider;
		private var sthresholdY:Slider;
		private var sR:Slider;
		private var sG:Slider;
		private var sB:Slider;
		private var sA:Slider;
	
		public function Demo_7() 
		{
			
			texture = Texture.fromBitmap(new resc());
			texture2 = Texture.fromBitmap(new resc2());
			var image:Image = new Image(texture2);
			image.x = 256 - image.width / 2;
			image.y = 256 - image.height / 2;
			addChild(image);
			
			
			//浮雕滤镜
			reliefFilter=new ReliefFilter(texture)
			image.filter = reliefFilter;
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 160;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "thresholdX");
			new Text(panel, 120, 23, "thresholdY");
			new Text(panel, 120, 43, "r");
			new Text(panel, 120, 63, "g");
			new Text(panel, 120, 83, "b");
			new Text(panel, 120, 103, "a");
		
		
			
			sthresholdX = new Slider();
			sthresholdX.maximum = 100;
			sthresholdX.value = 5;
			sthresholdX.x = 10;
			sthresholdX.y = 10;
			panel.addChild(sthresholdX);
			
			sthresholdY = new Slider();
			sthresholdY.maximum = 100;
			sthresholdY.value = 5;
			sthresholdY.x = 10;
			sthresholdY.y = 30;
			panel.addChild(sthresholdY);
			
			sR = new Slider();
			sR.maximum = 1;
			sR.value = 1;
			sR.x = 10;
			sR.y = 50;
			panel.addChild(sR);
			
			sG = new Slider();
			sG.maximum = 1;
			sG.value = 1;
			sG.x = 10;
			sG.y = 70;
			panel.addChild(sG);
			
			sB = new Slider();
			sB.maximum = 1;
			sB.value = 1;
			sB.x = 10;
			sB.y = 90;
			panel.addChild(sB);
			
			sA = new Slider();
			sA.maximum = 1;
			sA.value = 1;
			sA.x = 10;
			sA.y = 110;
			panel.addChild(sA);
		
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			reliefFilter.thresholdX = sthresholdX.value;
			reliefFilter.thresholdY = sthresholdY.value;
			
			reliefFilter.r = sR.value;
			reliefFilter.g = sG.value;
			reliefFilter.b = sB.value;
			reliefFilter.a = sA.value;
			
		}
		
	}

}