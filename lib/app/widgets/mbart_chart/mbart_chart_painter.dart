import 'package:flutter/material.dart';
import 'package:simple_charts/app/utils.dart';

class MbartChartPainter extends CustomPainter {
  final List<double> data;
  final List<Color> colors;
  double minValue;
  double maxValue;
  MbartChartPainter({
    required this.data,
    required this.colors,
    required this.minValue,
    required this.maxValue,
  });

  late double _width;
  late double _height;
  late Canvas _canvas;
  late double _barWidth;
  late int _length;

  @override
  void paint(Canvas canvas, Size size) {
    _canvas = canvas;
    _width = size.width;
    _height = size.height;
    _length = data.length;
    _barWidth = _width / _length;

    for (var i = 0; i < _length; i++) {
      Paint paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      double itemHeight = value2Heigh(
        data[i],
      );

      Offset begin = Offset(i * _barWidth, value2Heigh(0));
      Offset end = Offset((i + 1) * _barWidth, itemHeight);

      _canvas.drawRect(
        Rect.fromPoints(begin, end),
        paint,
      );
    }
  }

  double value2Heigh(double value) {
    return _height - uiRangeConverter(value, minValue, maxValue, 0, _height);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
