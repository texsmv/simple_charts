import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_charts/app/widgets/mbart_chart/mbart_chart_painter.dart';

class MbartChart extends StatefulWidget {
  final List<double> data;
  final List<Color> colors;

  double? width;
  double? height;
  MbartChart({
    Key? key,
    required this.data,
    required this.colors,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<MbartChart> createState() => _MbartChartState();
}

class _MbartChartState extends State<MbartChart> {
  late double minValue;
  late double maxValue;

  @override
  void initState() {
    minValue = widget.data.reduce(min);
    maxValue = widget.data.reduce(max);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MbartChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    minValue = widget.data.reduce(min);
    maxValue = widget.data.reduce(max);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: MbartChartPainter(
          colors: widget.colors,
          data: widget.data,
          minValue: minValue,
          maxValue: maxValue,
        ),
      ),
    );
  }
}
