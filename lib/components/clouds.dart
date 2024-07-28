import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flame/parallax.dart';

import '../game/configuration.dart';

class Cloud extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Cloud() : super(priority: 10);

  @override
  Future<void> onLoad() async {
    final cloud = await Flame.images.load(Assets.clouds);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(cloud, fill: LayerFill.none),
      ),
    ]);
    size = Vector2(gameRef.size.x, 100);
    position = Vector2(0, -gameRef.size.y + 100);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}