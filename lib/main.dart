import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Simple Quiz App",
      home: Quiz(),
      debugShowCheckedModeBanner: false,
    ));

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List answers = [false, true, true];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("quiz"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  scoreKeeper.removeRange(0, scoreKeeper.length);
                  questionNumber = 0;
                });
              })
        ],
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(questions[questionNumber],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ))),
            ),
            flex: 4,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (questionNumber == questions.length - 1) {
                      questionNumber = 0;
                    } else {
                      if (answers[questionNumber] == true) {
                        scoreKeeper.add(Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                        ));
                        questionNumber++;
                      } else {
                        scoreKeeper.add(Icon(
                          Icons.close,
                          color: Colors.redAccent,
                        ));
                        questionNumber++;
                      }
                    }
                  });
                },
                color: Colors.greenAccent,
                child: Text("True", style: TextStyle(color: Colors.white)),
              ),
            ),
            flex: 1,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (questionNumber == questions.length - 1) {
                        questionNumber = 0;
                      } else {
                        if (answers[questionNumber] == false) {
                          scoreKeeper.add(Icon(
                            Icons.check,
                            color: Colors.greenAccent,
                          ));
                          questionNumber++;
                        } else {
                          scoreKeeper.add(Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ));
                          questionNumber++;
                        }
                      }
                    });
                  },
                  color: Colors.redAccent,
                  child: Text("False", style: TextStyle(color: Colors.white)),
                ),
              ),
              flex: 1),
          Row(children: scoreKeeper)
        ],
      )),
    );
  }
}

//  'You can lead a cow down stairs but not up stairs.', false,
//  'Approximately one quarter of human bones are in the feet.', true,
//  'A slug\'s blood is green.', true,
