import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

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
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(250, 161, 15, 31),
          primary: const Color.fromARGB(250, 250, 9, 33),
          secondary: const Color.fromARGB(125, 161, 15, 31),
          tertiary: const Color.fromARGB(250, 233, 128, 140),
          background: const Color.fromARGB(250, 13, 4, 5),
        ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_daysLeft',
                  style: TextStyle(
                      fontSize: 56,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const Text("Days Left") // FONT SIZE UPDATE NEEDED
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Habit Status"),
                  ],
                ),
              )),
          const Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Insights")],
              )),
          const Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Graph Here")
                  // SfCartesianChart(
                  //     // Initialize category axis
                  //     primaryXAxis: const CategoryAxis(),
                  //     series: <LineSeries<SalesData, String>>[
                  //       LineSeries<SalesData, String>(
                  //           // Bind data source
                  //           dataSource: <SalesData>[
                  //             SalesData('Jan', 35),
                  //             SalesData('Feb', 28),
                  //             SalesData('Mar', 34),
                  //             SalesData('Apr', 32),
                  //             SalesData('May', 40)
                  //           ],
                  //           xValueMapper: (SalesData sales, _) => sales.year,
                  //           yValueMapper: (SalesData sales, _) => sales.sales)
                  //     ])
                ],
              ))
        ],
      ),
    ));
  }
}

// class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
// }
