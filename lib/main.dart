// import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:flutter/material.dart';

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
          if (label == 'صح' && Answers[RankedQuestion] == true ||
              label == 'خطأ' && Answers[RankedQuestion] == false) {
            setState(() {
              score.add(correct);
            });
          } else {
            setState(() {
              score.add(incorrect);
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

  Padding correct = Padding(
    padding: const EdgeInsets.all(3.0),
    child: Icon(Icons.thumb_up_alt_rounded, color: Colors.green),
  );
  Padding incorrect = Padding(
    padding: const EdgeInsets.all(3.0),
    child: Icon(Icons.thumb_down, color: Colors.red),
  );

  int RankedQuestion = 0;
  List<Widget> score = [];
  List Answers = [true, true, false, false, true];
  List<String> Questions = [
    "عدد الكواكب في المجموعة الشمسية 8 كواكب",
    "القطط حيوانات اليفة",
    "الصين موجودة بالقارة الافريقية",
    "الارض مسطحة وليست كروية",
    "المشتري هو اكبر كواكب المجموعة الشمسية",
  ];
  List<String> Images = List.generate(
    7,
    (index) => 'images/image-${index + 1}.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return RankedQuestion < Questions.length
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(children: score),
                    Image.asset(Images[RankedQuestion], fit: BoxFit.cover),
                    SizedBox(height: 20),
                    Flexible(
                      child: Text(
                        Questions[RankedQuestion],
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
          )
        : Center(
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
              ],
            ),
          );
  }
}
