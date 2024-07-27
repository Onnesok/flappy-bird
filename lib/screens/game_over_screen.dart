import 'package:flappy_bird/game/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Score: ${game.bird.score}",
              style: const TextStyle(
                fontFamily: "Game",
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30,),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

