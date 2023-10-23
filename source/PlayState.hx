package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var objectDict:Map<String, FlxSprite> = [
		"background" => new FlxSprite().loadGraphic(AssetPaths.Background__PNG),
		"tree" => new FlxSprite().loadGraphic(AssetPaths.tree_ish__png),
		"char" => new FlxSprite().loadGraphic(AssetPaths.char_ish__PNG),
		"cig" => new FlxSprite().loadGraphic(AssetPaths.cig_ish_spritesheet__png, true, 640, 360)
	];

	var rainParticles:FlxEmitter = new FlxEmitter(0, 0);

	var cigParticles:FlxEmitter = new FlxEmitter(233, 273);

	var cigSFX:FlxSound = new FlxSound().loadStream(AssetPaths.cig__wav, true);
	var rainSFX:FlxSound = new FlxSound().loadStream(AssetPaths.rain__wav, true);

	override public function create()
	{
		super.create();

		// use system mouse
		FlxG.mouse.useSystemCursor = true;

		// rain particles
		rainParticles.makeParticles(2, 6, 0xFF6f9edf, 1000);
		rainParticles.width = 1000;
		rainParticles.angle.set(40, 50);
		rainParticles.launchMode = FlxEmitterMode.SQUARE;
		rainParticles.lifespan.set(2, 2);
		rainParticles.velocity.set(-400, 300, -400, 600);

		// cig particles
		cigParticles.makeParticles(2, 2, FlxColor.WHITE, 20);
		cigParticles.setSize(5, 5);
		cigParticles.lifespan.set(1);
		cigParticles.launchAngle.set(-70, -110);
		cigParticles.scale.set(1, 1, 1, 1, 3, 3, 3, 3);
		cigParticles.color.set(0xFFa63725, 0xFFa63725, 0xFFFFFFFF, 0xFFFFFFFF);
		cigParticles.alpha.set(1, 1, 0, 0);
		cigParticles.angularVelocity.set(90, 90);

		// adding objects

		add(objectDict["background"]);
		add(rainParticles);
		add(objectDict["tree"]);
		add(objectDict["char"]);
		add(objectDict["cig"]);
		add(cigParticles);

		// starting stuff
		rainParticles.start(false, 0.01, 0);
		cigParticles.start(false, 0.15, 0);
		rainSFX.volume = 0.3;
		rainSFX.play();
		cigSFX.volume = 0.3;
		cigSFX.play();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
