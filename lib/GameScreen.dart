import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:schulte_table_game/DBHelper.dart';
import 'package:schulte_table_game/DBHelper2.dart';
import 'package:schulte_table_game/StringScoresDB.dart';

import 'Home.dart';
//import 'dbModel.dart';
import 'HighscoreDB.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<StringScores> scores;
  List<HighScore> highscores;
  DBHelper _dbHelper;
  DBHelper2 _dbHelper2;
  List<int> intScores = [];
  List<String> stringScores;

  List<GlobalKey<FlipCardState>> cardStateKey = [];
  List<String> data = [];
  int counter = 0;
  int miliseconds = 0;
  int seconds = 0;
  Timer secondsTimer;
  Timer milisecondsTimer;

  @override
  void initState() {
    scores = List<StringScores>();
    highscores = List<HighScore>();

    _dbHelper = DBHelper();
    _dbHelper2 = DBHelper2();

    super.initState();
    for (var i = 0; i < 24; i++) {
      cardStateKey.add(GlobalKey<FlipCardState>());
    }

    for (var i = 1; i < 25; i++) {
      data.add(i.toString());
    }

    data.shuffle();
    startSecondsTimer();
    startMilisecondsTimer();
  }

  startSecondsTimer() {
    secondsTimer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        seconds = seconds + 1;
      });
    });
  }

  startMilisecondsTimer() {
    milisecondsTimer = Timer.periodic(Duration(milliseconds: 1), (a) {
      setState(() {
        miliseconds = miliseconds + 1;
        if (miliseconds == 60) {
          miliseconds = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Time : $seconds . $miliseconds",
          style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            children: List.generate(
              24,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: FlipCard(
                    key: cardStateKey[index],
                    flipOnTouch: false,
                    front: RaisedButton(
                      color: Colors.deepPurple,
                      onPressed: () async {
                        if (data[index] == "1") {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "2" && counter == 1) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "3" && counter == 2) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "4" && counter == 3) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "5" && counter == 4) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "6" && counter == 5) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "7" && counter == 6) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "8" && counter == 7) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "9" && counter == 8) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "10" && counter == 9) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "11" && counter == 10) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "12" && counter == 11) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "13" && counter == 12) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "14" && counter == 13) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "15" && counter == 14) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "16" && counter == 15) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "17" && counter == 16) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "18" && counter == 17) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "19" && counter == 18) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "20" && counter == 19) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "21" && counter == 20) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "22" && counter == 21) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "23" && counter == 22) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (data[index] == "24" && counter == 23) {
                          cardStateKey[index].currentState.toggleCard();
                          counter++;
                        }
                        if (counter == 24) {
                          _dbHelper.insertPuanlar(StringScores(
                              stringScore: "$seconds.$miliseconds"));

                          showResult();
                        }
                      },
                      child: Container(
                        color: Colors.deepPurple,
                        child: Center(
                          child: Text('${data[index]}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto")),
                        ),
                      ),
                    ),
                    back: Container(
                      child: Center(
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.deepPurple,
                          size: 36.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  showResult() async {
    secondsTimer.cancel();
    milisecondsTimer.cancel();

    _dbHelper2.highPuanlar(HighScore(highScore: seconds));

    var mapListe = await _dbHelper2.getHighscore();
    for (Map okunanpuanMapi in mapListe) {
      intScores.add(int.parse(okunanpuanMapi["highscore"]));
    }

    var highscore = getHighscore(stringScores);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                "High Score : " + highscore.toString(),
                style: TextStyle(color: Colors.deepPurple),
              ),
              content: Text(
                "Time $seconds . $miliseconds",
                style: Theme.of(context).textTheme.headline3,
              ),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ));
  }

  int getHighscore(List<String> stringListe) {
    bubbleSort(intScores);
    return intScores[0];
  }

  void bubbleSort(List list) {
    if (list == null || list.length == 0) return;

    int n = list.length;
    int i, step;
    for (step = 0; step < n; step++) {
      for (i = 0; i < n - step - 1; i++) {
        if (list[i] > list[i + 1]) {
          swap(list, i);
        }
      }
    }
  }

  void swap(List list, int i) {
    int temp = list[i];
    list[i] = list[i + 1];
    list[i + 1] = temp;
  }
}
