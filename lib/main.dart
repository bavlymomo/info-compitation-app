// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';
import 'package:info_compitation_app/Questions.dart';
import 'package:info_compitation_app/QuestionsList.dart';

Questionslist questionslist = Questionslist();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: const Text(
            'Ekhtebar App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 15.0,
          backgroundColor: Colors.blue[800],
        ),
        body: Padding(padding: const EdgeInsets.all(8.0), child: MyWidget()),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Padding myButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          bool correctAnswer = questionslist.Questionsgroup[RankedQuestion].Answer;
          if (label == 'صح' && correctAnswer ||
              label == 'خطأ' && !correctAnswer) {
            setState(() {
              score.add(true);
              RankedQuestion++;
            });
          } else {
            setState(() {
              score.add(false);
              RankedQuestion++;
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: 'صح' == label ? Colors.green : Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Icon correct = Icon(Icons.thumb_up_alt_rounded, color: Colors.green);
  Icon incorrect = Icon(Icons.thumb_down, color: Colors.red);

  int RankedQuestion = 0;
  List<bool> score = [];

  @override
  Widget build(BuildContext context) {
    if (RankedQuestion < questionslist.Questionsgroup.length) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Row(
                  children: score
                      .map((ele) => ele ? correct : incorrect)
                      .toList(),
                ),
                Image.asset(
                  questionslist.Questionsgroup[RankedQuestion].QuestionImage,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    questionslist.Questionsgroup[RankedQuestion].QuestionText,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: myButton('صح')),
          Expanded(child: myButton('خطأ')),
        ],
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'لقد انهيت الاختبار',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  RankedQuestion = 0;
                  score = [];
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'اعادة الاختبار',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 7),
            Text(
              " Score : " + score.where((ele) => ele).length.toString(),
              // textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
}
