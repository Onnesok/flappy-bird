import 'package:flame/components.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>{
  Bird();

  @override
  Future<void> onLoad() async{
    final bird_mid_flap = await gameRef.loadSprite(Assets.birdMidFlap);
    final bird_up_flap = await gameRef.loadSprite(Assets.birdUpFlap);
    final bird_down_flap = await gameRef.loadSprite(Assets.birdDownFlap);
    
    size = Vector2(50, 40);
    position = Vector2(50, (gameRef.size.y / 2) - size.y/2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: bird_mid_flap,
      BirdMovement.up: bird_up_flap,
      BirdMovement.down: bird_down_flap,
    };
  }
}