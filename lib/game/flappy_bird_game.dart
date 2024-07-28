import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_bird/components/background..dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/clouds.dart';
import 'package:flappy_bird/components/pipe_group.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flutter/material.dart';

import '../components/ground.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
      Cloud(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "Score: 0",
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
          color: Colors.white,
        ),
      ),
    );
  }


  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    if (bird.score >= bird.highScore) {
      score.textRenderer = TextPaint(
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
          color: Colors.amber,
        ),
      );
    } else {
      score.textRenderer = TextPaint(
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
          color: Colors.white,
        ),
      );
    }

    score.text = 'Score: ${bird.score}';
  }

}