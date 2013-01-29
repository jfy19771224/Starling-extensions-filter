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
	import swallow.utils.Timer2D;
	/**
	 * 灯光滤镜,神器中的神器,游戏中的手电筒,或者渲染各种各样诡异的气氛
	 * @-式神-
	 */
	public class Demo_4 extends Sprite 
	{
		[Embed(source="../res/silent.png")]
		private var resc:Class
		
		private var texture:Texture
		
		private var lightFilter:LightFilter
		
		private var timer2d:Timer2D
		
		
	
		private var sR:Slider
		private var sG:Slider
		private var sB:Slider
		private var sA:Slider
		private var sScopeX:Slider
		private var sScopeY:Slider;
		
		public function Demo_4() 
		{
			
			texture = Texture.fromBitmap(new resc());
			var image:Image = new Image(texture);
			addChild(image);
			
			//灯光滤镜
			lightFilter = new LightFilter();
			image.filter = lightFilter;
			
			
			
			
			/******************************************************以下忽略****************************************************/
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 155;
			Main.target.addChild(panel)
			
			new Text(panel, 120, 3, "R");
			new Text(panel, 120, 23, "G");
			new Text(panel, 120, 43, "B");
			new Text(panel, 120, 63, "A");
			new Text(panel, 120, 83, "scopeX");
			new Text(panel, 120, 103, "scopeY");
			
		
			
			sR = new Slider();
			sR.maximum = 100;
			sR.value = 100;
			sR.x = 10;
			sR.y = 10;
			panel.addChild(sR);
			
			sG = new Slider();
			sG.maximum = 100;
			sG.value = 100;
			sG.x = 10;
			sG.y = 30;
			panel.addChild(sG);
			
			sB = new Slider();
			sB.maximum = 100;
			sB.value = 100;
			sB.x = 10;
			sB.y = 50;
			panel.addChild(sB);
			
			sA = new Slider();
			sA.maximum = 100;
			sA.value = 100;
			sA.x = 10
			sA.y = 70;
			panel.addChild(sA);
			
			sScopeX = new Slider();
			sScopeX.maximum = 100;
			sScopeX.value = 30;
			sScopeX.x = 10;
			sScopeX.y = 90;
			panel.addChild(sScopeX);
			
			sScopeY = new Slider();
			sScopeY.maximum = 100;
			sScopeY.value = 30;
			sScopeY.x = 10;
			sScopeY.y = 110;
			panel.addChild(sScopeY);
			
			
			
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			lightFilter.r = sR.value / 100;
			lightFilter.g = sG.value / 100;
			lightFilter.b = sB.value / 100;
			lightFilter.a = sA.value / 100;
			lightFilter.scopeX = sScopeX.value/10;
			lightFilter.scopeY = sScopeY.value/10;
			lightFilter.centerX = Main.target.mouseX;
			lightFilter.centerY = Main.target.mouseY;
		}
		
	}

}