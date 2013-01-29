package  
{
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import swallow.effect.EffectScene;
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
	 * 一个代理场景,可以针对整个动态的场景做特效,比如某一区域的水流,烟火,放大镜效果
	 * @-式神-
	 */
	public class Demo_11 extends Sprite 
	{
		
		[Embed(source="../res/atlas.xml", mimeType="application/octet-stream")]
        private static const AtlasXml:Class;
        
       [Embed(source="../res/atlas.png")]
        private static const AtlasTexture:Class;
		
		
		[Embed(source="../res/wow.png")]
		private var resC:Class
		
		
		private var texture:Texture
		
		private var timer2d:Timer2D
		
		private var effectScene_a:EffectScene
		private var effectScene_b:EffectScene
		private var effectScene_c:EffectScene
		private var effectScene_d:EffectScene
		
		private var mMovie:MovieClip
		public function Demo_11() 
		{
			
			 var texture:Texture = Texture.fromBitmap(new AtlasTexture());
             var xml:XML = XML(new AtlasXml());
             var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
				
			 
			var frames:Vector.<Texture> = sTextureAtlas.getTextures("flight_");
            mMovie = new MovieClip(frames,18);
			texture = Texture.fromBitmap(new resC());
			var image:Image = new Image(texture);
			
			
			//创建代理场景A,在某一区域使用马赛克滤镜
			effectScene_a = new EffectScene(512, 512);
			effectScene_a.addChild(image)
			effectScene_a.addChild(mMovie)
			effectScene_a.mask = new Rectangle(0, 0, 512 / 2, 512 / 2);
			effectScene_a.filter = new MosaicFilter(10, 10);
			addChild(effectScene_a)
			
			//创建代理场景B,在某一区域使用HDR滤镜
			effectScene_b = new EffectScene(512, 512);
			effectScene_b.addChild(image)
			effectScene_b.addChild(mMovie)
			effectScene_b.mask = new Rectangle(256, 0, 512 / 2, 512 / 2);
			effectScene_b.filter = new HdrFilter();
			addChild(effectScene_b)
			
			//创建代理场景C,在某一区域使用波浪滤镜
			effectScene_c = new EffectScene(512, 512);
			effectScene_c.addChild(image)
			effectScene_c.addChild(mMovie)
			effectScene_c.mask = new Rectangle(256, 256, 512 / 2, 512 / 2);
			effectScene_c.filter = new WaveFilter(250,10,20)
			addChild(effectScene_c)
			
			
			//创建代理场景D,在某一区域使用色调滤镜
			effectScene_d = new EffectScene(512, 512);
			effectScene_d.addChild(image)
			effectScene_d.addChild(mMovie)
			effectScene_d.mask = new Rectangle(0, 256, 512 / 2, 512 / 2);
			effectScene_d.filter = new AdvancedFilter(.5,.3,.1)
			addChild(effectScene_d)
			
			
		
			/*********************************************************以下忽略*************************************************/
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
        }
        
        private function onAddedToStage(event:Event):void
        {
            Starling.juggler.add(mMovie);
        }
        
        private function onRemovedFromStage(event:Event):void
        {
            Starling.juggler.remove(mMovie);
        }
        
        public override function dispose():void
        {
            removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            super.dispose();
        }
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			(effectScene_c.filter as WaveFilter).direction++
		}
		
		
	}

}