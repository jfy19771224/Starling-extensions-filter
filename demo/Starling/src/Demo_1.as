package  
{
	import com.bit101.components.Panel;
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import swallow.events.TimerEvent2D;
	import swallow.filters.BumpMakerFilter;
	import swallow.filters.MaskFilter;
	import swallow.utils.Timer2D;
	
	/**
	 * 凹凸贴图,贴图算法非权威1:1算法,可能会出现不精准情况,不多说,3D中的神器中的战斗机,2D在某些方面也合适
	 * @-式神-
	 */
	public class Demo_1 extends Sprite 
	{
		
	
		[Embed(source="../res/floor_diffuse.jpg")]
		private var diffuseC:Class
		private var diffuseSprite:Texture
		
		[Embed(source="../res/floor_normal.jpg")]
		private var normalC:Class
		private var normalSprite:Texture
		
		[Embed(source="../res/floor_specular.jpg")]
		private var highlightC:Class
		private var highlightSprite:Texture
		
		[Embed(source="../res/material.jpg")]
		private var materialC:Class
		private var materialSprite:Texture
		
		
		private var bumpMakerFilter:BumpMakerFilter
		
		private var sNormalX:Slider
		private var sNormalY:Slider
		private var sLightValue:Slider
		private var sAmbientLightValue:Slider
		private var sLightX:Slider
		private var sLightY:Slider
		private var sLightContrast:Slider
		private var sLightIteration:Slider
		private var sReflectLightX:Slider
		private var sReflectLightY:Slider
		private var sReflectLightValue:Slider
		
		private var timer2d:Timer2D
		public function Demo_1() 
		{
			//漫反射贴图
			diffuseSprite = Texture.fromBitmap(new diffuseC());
			
			//法线贴图
			normalSprite = Texture.fromBitmap(new normalC());
			
			//高光贴图
			highlightSprite = Texture.fromBitmap(new highlightC());
			
			//材质贴图
			materialSprite = Texture.fromBitmap(new materialC());
			
			//凹凸贴图滤镜
			bumpMakerFilter = new BumpMakerFilter(normalSprite, highlightSprite, materialSprite)
			
			var diffuseImg:Image = new Image(diffuseSprite);
			
			diffuseImg.filter = bumpMakerFilter;
			addChild(diffuseImg)
		
			
			/*********************************************下面忽略*****************************************/
			
			var panel:Window = new Window(Main.target);
			panel.width = 240;
			panel.height = 255;
			Main.target.addChild(panel)
			
			
			new Text(panel, 120, 3, "normalX");
			new Text(panel, 120, 23, "normalY");
			new Text(panel, 120, 43, "lightValue");
			new Text(panel, 120, 63, "ambientLightValue");
			new Text(panel, 120, 83, "lightX");
			new Text(panel, 120, 103, "lightY");
			new Text(panel, 120, 123, "lightContrast");
			new Text(panel, 120, 143, "lightIteration");
			new Text(panel, 120, 163, "reflectLightX");
			new Text(panel, 120, 183, "reflectLightY");
			new Text(panel, 120, 203, "reflectLightValue");
			
			
			
			sNormalX = new Slider();
			sNormalX.maximum = 30;
			sNormalX.value = 10;
			sNormalX.y = 10;
			sNormalX.x = 10;
			panel.addChild(sNormalX);
			
			sNormalY = new Slider();
			sNormalY.maximum = 30;
			sNormalY.value = 10;
			sNormalY.y = 30;
			sNormalY.x = 10;
			panel.addChild(sNormalY);
			
			sLightValue = new Slider();
			sLightValue.maximum = 10;
			sLightValue.value = 1;
			sLightValue.y = 50;
			sLightValue.x = 10;
			panel.addChild(sLightValue);
			
			sAmbientLightValue = new Slider();
			sAmbientLightValue.maximum = 10;
			sAmbientLightValue.value = 1;
			sAmbientLightValue.y = 70;
			sAmbientLightValue.x = 10;
			panel.addChild(sAmbientLightValue);
			
			sLightX = new Slider();
			sLightX.maximum = 100;
			sLightX.value = 20;
			sLightX.y = 90;
			sLightX.x = 10;
			panel.addChild(sLightX);
			
			sLightY = new Slider();
			sLightY.maximum = 100;
			sLightY.value = 50;
			sLightY.y = 110;
			sLightY.x = 10;
			panel.addChild(sLightY);
			
			sLightContrast = new Slider();
			sLightContrast.maximum = 10;
			sLightContrast.value = 0;
			sLightContrast.y = 130;
			sLightContrast.x = 10;
			panel.addChild(sLightContrast);
			
			sLightIteration = new Slider();
			sLightIteration.maximum = 10;
			sLightIteration.value = 2;
			sLightIteration.y = 150;
			sLightIteration.x = 10;
			panel.addChild(sLightIteration);
			
			sReflectLightX = new Slider();
			sReflectLightX.maximum = 60;
			sReflectLightX.value = 10;
			sReflectLightX.y = 170;
			sReflectLightX.x = 10;
			panel.addChild(sReflectLightX);
			
			sReflectLightY = new Slider();
			sReflectLightY.maximum = 60;
			sReflectLightY.value = 1;
			sReflectLightY.y = 190;
			sReflectLightY.x = 10;
			panel.addChild(sReflectLightY);
			
			sReflectLightValue = new Slider();
			sReflectLightValue.maximum = 100;
			sReflectLightValue.value = 10;
			sReflectLightValue.y = 210;
			sReflectLightValue.x = 10;
			panel.addChild(sReflectLightValue);
			
			timer2d = new Timer2D();
			timer2d.addEventListener(TimerEvent2D.TIMER, timer2dRun);
			timer2d.start();
		}
		
		private function timer2dRun(e:TimerEvent2D):void
		{
			bumpMakerFilter.normalX = sNormalX.value;
			bumpMakerFilter.normalY = sNormalY.value;
			bumpMakerFilter.lightValue = sLightValue.value;
			bumpMakerFilter.ambientLightValue = sAmbientLightValue.value;
			bumpMakerFilter.lightX = sLightX.value / 1000;
			bumpMakerFilter.lightY = sLightY.value / 1000;
			bumpMakerFilter.lightContrast = sLightContrast.value / 100;
			bumpMakerFilter.lightIteration = sLightIteration.value;
			bumpMakerFilter.reflectLightX = sReflectLightX.value
			bumpMakerFilter.reflectLightY = sReflectLightY.value;
			bumpMakerFilter.reflectLightValue = sReflectLightValue.value / 100;
		}
		
		
		
	}

}