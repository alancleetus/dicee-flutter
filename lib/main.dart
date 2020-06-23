import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeLeftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void changeRightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void changeDieFace() {
    changeLeftDice();
    changeRightDice();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                //flex: 2, //this expanded widget will take up 2 times the width
                child: FlatButton(
                  onPressed: () {
                    print("Left Button pressed");
                    changeLeftDice();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ), //factory method for creating asset images
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    print("Right Button pressed");
                    changeRightDice();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            color: Colors.white10,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
            child: FlatButton(
              onPressed: () {
                changeDieFace();
              },
              child: Text(
                'Roll',
                style: TextStyle(
                  color: Colors.red[100],
                  fontSize: 24.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
class DicePage extends StatelessWidget {

    //moving var initialization outside build method means we wont create the
    //var everytime the build function is called
    int rightDieNumber = 5;

  @override
  Widget build(BuildContext context) {
    /*varibles have to be inside build method for
    * hot reload to take effect when count changes
    * since when file is saved, the build method is
    * what is rerun, not anything outside*/
    int leftDieNumber = 1;

    //update the value here to reflect change in hot reload
    rightDieNumber = 6;


    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex: 2, //this expanded widget will take up 2 times the width
            child: FlatButton(
              onPressed: () {
                print("Left Button pressed");
              },
              child: Image.asset('images/dice$leftDieNumber.png'),
            ), //factory method for creating asset images
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("Right Button pressed");
              },
              child: Image.asset('images/dice$rightDieNumber.png'),
            ),
          )
        ],
      ),
    );
  }
}
*/
