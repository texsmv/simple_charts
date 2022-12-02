import 'package:flutter/material.dart';
import 'package:simple_charts/app/widgets/mbart_chart/mbart_chart.dart';
import 'package:simple_charts/app/widgets/mbart_chart/mbart_chart_painter.dart';

class ChartList extends StatefulWidget {
  ChartList({Key? key}) : super(key: key);

  @override
  State<ChartList> createState() => _ChartListState();
}

class _ChartListState extends State<ChartList> {
  @override
  Widget build(BuildContext context) {
    // List<double> data = [100, 20, 2, -90, 45, 90, 20, 35];
    List<double> data = [100, 20, 2, -90, 45, 90, 20, 35, 200, 34, 10, 49];
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow
    ];
    // List<double> mySerie = [100, 20, 210, -10, ];
    return Scaffold(
      appBar: AppBar(title: Text('My Bar Chart')),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 500,
          child: Column(
            children: [
              MbartChart(
                colors: colors,
                height: 300,
                width: double.infinity,
                data: data,
              )
            ],
          ),
        ),
      ),
    );
  }
}
