import 'package:flame/game.dart';
import 'package:flappy_bird/screens/game_over_screen.dart';
import 'package:flappy_bird/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game/flappy_bird_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();

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


Future<void> initializeSharedPreferences() async {
  await SharedPreferences.getInstance();
}
