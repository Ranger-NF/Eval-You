import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'package:isar/isar.dart';
import 'package:intl/intl.dart';

part 'main.g.dart';

@collection
class DailyMark {
  Id id = Isar.autoIncrement;
  late String date;
  late List<double>
      marks; // For the time being the subjects will be looked up using index in list
  late double totalMarks = 0;
}

final Map<int, String> subjects = {1: "Physics", 2: "Chemistry", 3: "Maths"};

Future<Isar> openIsarInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open(
    [],
    directory: dir.path,
  );

  return Future.value(Isar.getInstance());
}

String getTodaysDate() {
  final now = DateTime.now();
  final formatNeeded = DateFormat('yMd');
  return formatNeeded.format(now);
}

void main() {
  runApp(const EvalApp());
}

class EvalApp extends StatelessWidget {
  const EvalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eval You',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(250, 250, 9, 33),
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

  ValueNotifier<double> habitValueNotifier = ValueNotifier(0);

  Future<Isar> isarDb = openIsarInstance();

  final TextStyle increasedValueStyle =
      const TextStyle(color: Color.fromARGB(255, 3, 114, 7));

  void calculateDaysLeft() {
    setState(() {
      final examDay = DateTime(2024, 4, 1);
      final currentDate = DateTime.now();
      _daysLeft = examDay.difference(currentDate).inDays;
      habitValueNotifier.value = _daysLeft.toDouble();
    });
  }

  late List<Widget> subjectInfoWidget = [
    Text(getTodaysDate()),
    ElevatedButton(onPressed: addSubject, child: const Icon(Icons.playlist_add))
  ];

  @override
  void initState() {
    super.initState();
    getSubjectData();
  }

  void getSubjectData() async {
    final isar = await isarDb;
    final todaysMarks =
        await isar.dailyMarks.filter().dateEqualTo(getTodaysDate()).findFirst();

    subjectInfoWidget.removeRange(2, subjectInfoWidget.length);

    if (todaysMarks == null) {
      for (String subjectName in subjects.values) {
        Row subjectInfo = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(subjectName), const Text('-')],
        );

        subjectInfoWidget.add(subjectInfo);
      }

      setState(() {});

      return;
    }
    int currentIndex = 0;
    for (double eachMark in todaysMarks.marks) {
      Row subjectInfo = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(subjects[currentIndex + 1]!),
          Text(eachMark.toString())
        ],
      );

      subjectInfoWidget.add(subjectInfo);
    }

    setState(() {});

    return;
  }

  void addSubject() async {
    final isar = await isarDb;
    final newSub = DailyMark()
      ..date = getTodaysDate()
      ..marks = [75, 55, 65];
    await isar.writeTxn(() async => {await isar.dailyMarks.put(newSub)});

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    calculateDaysLeft();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  '$_daysLeft',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary
                      ]),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Habit Status"),
                    SimpleCircularProgressBar(
                      size: 80,
                      mergeMode: true,
                      progressStrokeWidth: 30,
                      backStrokeWidth: 30,
                      progressColors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).primaryColor
                      ],
                      startAngle: 225,
                      valueNotifier: habitValueNotifier,
                      onGetText: (double value) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary),
                        );
                      },
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: subjectInfoWidget,
              )),
          Expanded(
            flex: 1,
            child: LineChart(LineChartData(
              gridData: const FlGridData(
                  show: true, horizontalInterval: 100, drawVerticalLine: false),
              lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.white.withOpacity(0.2))),
              titlesData: const FlTitlesData(
                bottomTitles: AxisTitles(
                    axisNameSize: 20,
                    drawBelowEverything: false,
                    sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 35)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                  border: const Border(
                      bottom: BorderSide(color: Colors.white, width: 2))),
              lineBarsData: [
                LineChartBarData(spots: const [
                  FlSpot(0, 17),
                  FlSpot(1, 124),
                  FlSpot(2, 0),
                  FlSpot(3, 0),
                  FlSpot(4, 150),
                ], color: Theme.of(context).primaryColor)
              ],
              minX: 0,
              maxX: 4,
              minY: 0,
              maxY: 300,
            )),
          ),
        ]),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
