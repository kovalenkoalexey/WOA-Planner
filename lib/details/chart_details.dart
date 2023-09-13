import 'package:flutter/material.dart';
import '../models/chart.dart';
import '/main.dart';
import 'package:home_project_1/widgets/lists/chart_list_widget.dart';

class ChartInfo extends StatefulWidget {

  Chart chart;

  ChartInfo({required this.chart});

  _ChartInfoState createState() =>
      _ChartInfoState(chart: this.chart); // сюда передаем текущее состояние страницы
}

class _ChartInfoState extends State<ChartInfo> {

  Chart chart;

  _ChartInfoState({required this.chart});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOA Planner',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
          useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
              'Word of avia',
              style: TextStyle(fontSize: 27, color: Colors.white)),
          backgroundColor: Colors.black54,
          leading: const Icon(Icons.airplanemode_on),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text('Имя: '+chart.chartCode+'  '+chart.description, style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  Text('Координаты: '+chart.coordinates, style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  Text('Мах. длина ВВП: '+chart.maxRunwayLength, style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black12),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Вернуться назад')
                  ),
                ],
              ),)
          ]
        ),
      ),
    );
  }
}
