import 'package:flutter/material.dart';

void main() {
  runApp(const EvalApp());
}

class EvalApp extends StatelessWidget {
  const EvalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Eval App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _daysLeft = 0;

  void calculateDaysLeft() {
    setState(() {
      final examDay = DateTime(2024, 4, 1);
      final currentDate = DateTime.now();
      _daysLeft = examDay.difference(currentDate).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    calculateDaysLeft();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent, // COLOR UPDATE NEEDED
                    border:
                        Border.all(color: Colors.black), // COLOR UPDATE NEEDED
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_daysLeft',
                      style: const TextStyle(fontSize: 56),
                    ),
                    const Text("Days Left") // FONT SIZE UPDATE NEEDED
                  ],
                ),
              )),
          const Expanded(
              flex: 2,
              child: Column(
                children: [Text("Summary")],
              ))
        ],
      ),
    ));
  }
}
