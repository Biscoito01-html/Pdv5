import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveUpdateChart extends StatefulWidget {
  List<DataPoint> initialData;

  LiveUpdateChart({
    required Key key,
    this.initialData = const [],
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LiveUpdateChartState createState() => _LiveUpdateChartState();
}

class _LiveUpdateChartState extends State<LiveUpdateChart> {
  List<DataPoint> chartData = [];
  List<DataPoint> salesData = [];

  @override
  void initState() {
    super.initState();
    salesData = widget.initialData;
    updateChartData();
  }

  void updateChartData() {
    setState(() {
      chartData = [...salesData];
    });
  }

  radom() {
    var rng = new Random();
    return rng.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: const DateTimeAxis(),
      series: <CartesianSeries>[
        LineSeries<DataPoint, DateTime>(
          dataSource: chartData,
          xValueMapper: (DataPoint sales, _) => sales.time,
          yValueMapper: (DataPoint sales, _) => sales.value,
        )
      ],
    );
  }
}

class DataPoint {
  DataPoint(this.time, this.value);

  final DateTime time;
  final double value;
}
