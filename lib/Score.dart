import 'package:flutter/material.dart';
import 'package:schulte_table_game/DBHelper.dart';
import 'StringScoresDB.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  List<StringScores> stringScoresList;
  List<int> intScores;
  DBHelper _dbHelper;

  void initState() {
    super.initState();
    _dbHelper = DBHelper();
    stringScoresList = List<StringScores>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Score",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: _dbHelper.getPuanList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            stringScoresList = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Card(
                        color: Colors.deepPurple,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.stars,
                              color: Colors.deepPurple[600],
                            ),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(stringScoresList[index].stringScore,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: stringScoresList.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
