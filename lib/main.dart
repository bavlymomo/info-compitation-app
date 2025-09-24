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
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: 'صح' == label ? Colors.green : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset('images/image-1.jpg', fit: BoxFit.cover),
              SizedBox(height: 20),
              Flexible(
                child: Text(
                  "  عدد الكواكب في المجموعة الشمسية 8 كواكب",
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
  }
}
