import 'package:flutter/material.dart';
import 'GameScreen.dart';
import 'Score.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
          child: Padding(
              padding: EdgeInsets.all(60),
              child: Form(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Schulte Table Game",
                          style: TextStyle(
                              fontSize: 29.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Roboto"),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          },
                          child: Text(
                            "Start",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          color: Colors.pink,
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.white),
                          )),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Container(
                      height: 50,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Score()));
                          },
                          child: Text(
                            "Highscores",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          color: Colors.pink,
                          splashColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
