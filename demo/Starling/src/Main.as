package 
{
	import com.bit101.components.Slider;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	
	/**
	 * 启动类,即将进入神器的starling世界
	 */
	public class Main extends Sprite 
	{

		public static var target:Main
		private var mStarling : Starling;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			Main.target = this;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			initStarling();
		}
		
		private function initStarling():void {
			var stageWidth : Number = stage.stageWidth;
			var stageHeight : Number = stage.stageHeight;
			
			//凹凸贴图案例
			//mStarling = new Starling(Demo_1, stage);
			
			//色调滤镜
			//mStarling = new Starling(Demo_2, stage);
			
			//HDR滤镜
			//mStarling = new Starling(Demo_3, stage);
			
			//灯光
			//mStarling = new Starling(Demo_4, stage);
			
			//马赛克滤镜
			//mStarling = new Starling(Demo_5, stage);
			
			//海浪滤镜
			//mStarling = new Starling(Demo_6, stage);
			
			//浮雕滤镜
			//mStarling = new Starling(Demo_7, stage);
			
			//截图
			//mStarling = new Starling(Demo_8, stage);
			
			//反向灯光
			//mStarling = new Starling(Demo_9, stage);
			
			//遮罩
			//mStarling = new Starling(Demo_10, stage);
			
			//场景特效
			mStarling = new Starling(Demo_11, stage);
			
            mStarling.stage.stageWidth  = stageWidth;
            mStarling.stage.stageHeight = stageHeight;
            mStarling.simulateMultitouch  = false;
            mStarling.start();
		}
		
	}
	
}