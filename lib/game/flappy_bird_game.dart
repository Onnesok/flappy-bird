import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/components/background..dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/pipe_group.dart';

import '../components/ground.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
  }
}