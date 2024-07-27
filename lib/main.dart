import 'package:flame/game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
        game: game,
        initialActiveOverlays: const [MainMenuScreen.id],
        overlayBuilderMap: {
          'mainMenu': (context, _) => MainMenuScreen(game: game),
          'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
