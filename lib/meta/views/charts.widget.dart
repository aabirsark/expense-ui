import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
    );
  }
}

LineChartData get sampleData1 => LineChartData(
      lineTouchData: lineTouchData1,
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
          bottomTitles: bottomTitles,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: false)),
      borderData: FlBorderData(show: false),
      lineBarsData: lineBarsData1,
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
    );

LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.white10));

List<LineChartBarData> get lineBarsData1 => [
      lineChartBarData1_1,
      lineChartBarData1_2,
    ];

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 18,
      margin: 10,
      interval: 1,
      getTextStyles: (context, value) => const TextStyle(
        color: Colors.white70,
        fontSize: 12,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 2:
            return 'SEPT';
          case 7:
            return 'OCT';
          case 12:
            return 'DEC';
        }
        return '';
      },
    );

LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      colors: [Colors.tealAccent],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
    );

LineChartBarData get lineChartBarData1_2 => LineChartBarData(
      isCurved: true,
      colors: [Colors.indigoAccent],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      spots: const [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
    );
