// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';
import 'package:info_compitation_app/Questions.dart';

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
      child: TextButton(
        onPressed: () {
          bool correctAnswer = Question[RankedQuestion].Answer;
          if (label == 'صح' && correctAnswer ||
              label == 'خطأ' && !correctAnswer) {
            setState(() {
              score.add(true);
            });
          } else {
            setState(() {
              score.add(false);
            });
          }
          setState(() {
            RankedQuestion++;
          });
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

  // List<String> Images = List.generate(
  //   7,
  //   (index) => 'images/image-${index + 1}.jpg',
  // );
  List<Questions> Question = [
    Questions(
      QuestionText: "عدد الكواكب في المجموعة الشمسية 8 كواكب",
      QuestionImage: "images/image-1.jpg",
      Answer: true,
    ),
    Questions(
      QuestionText: "القطط حيوانات اليفة",
      QuestionImage: "images/image-2.jpg",
      Answer: true,
    ),
    Questions(
      QuestionText: "الصين موجودة بالقارة الافريقية",
      QuestionImage: "images/image-3.jpg",
      Answer: false,
    ),
    Questions(
      QuestionText: "الارض مسطحة وليست كروية",
      QuestionImage: "images/image-4.jpg",
      Answer: false,
    ),
    Questions(
      QuestionText: "المشتري هو اكبر كواكب المجموعة الشمسية",
      QuestionImage: "images/image-5.jpg",
      Answer: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    if (RankedQuestion < Question.length) {
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
                  Question[RankedQuestion].QuestionImage,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    Question[RankedQuestion].QuestionText,
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
