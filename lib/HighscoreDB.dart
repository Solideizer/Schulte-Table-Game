class HighScore {
  int highScore;

  HighScore({this.highScore});

  Map<String, dynamic> toMap() {
    return {'highscore': highScore};
  }
}
