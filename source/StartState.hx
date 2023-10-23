package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class StartState extends FlxState
{
	var splashScreen:FlxSprite = new FlxSprite().loadGraphic(AssetPaths.splash__png);

	override public function create()
	{
		FlxG.mouse.useSystemCursor = true;

		splashScreen.scale.x = 0.5;
		splashScreen.scale.y = 0.5;
		splashScreen.screenCenter();
		add(splashScreen);
	}

	override public function update(elapsed)
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
