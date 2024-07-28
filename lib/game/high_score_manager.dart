import 'package:shared_preferences/shared_preferences.dart';

class HighScoreManager {
  static const String _highScoreKey = 'highScore';

  Future<int> getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_highScoreKey) ?? 0;
  }

  Future<void> saveHighScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_highScoreKey, score);
  }
}
