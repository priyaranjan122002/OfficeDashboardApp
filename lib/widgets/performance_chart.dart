
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.white, Color(0xFFE9EEFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(4,6))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("📊 Overall Performance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(children: const [
          _LegendDot(color: Colors.redAccent, label: "Pending Done"),
          SizedBox(width: 16),
          _LegendDot(color: Colors.orangeAccent, label: "Done"),
          SizedBox(width: 16),
          _LegendDot(color: Colors.greenAccent, label: "Project Done"),
        ]),
        const SizedBox(height: 20),
        SizedBox(height: 300, child: _animated3DChart()),
      ]),
    );
  }
}

Widget _animated3DChart() {
  return LineChart(
    LineChartData(
      minY: 0,
      maxY: 55,
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32)),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: Colors.black54)),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          gradient: const LinearGradient(colors: [Colors.redAccent, Colors.orangeAccent]),
          barWidth: 5,
          belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: [Colors.redAccent.withOpacity(0.4), Colors.orangeAccent.withOpacity(0.1)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          spots: const [FlSpot(0,15), FlSpot(1,25), FlSpot(2,30), FlSpot(3,35), FlSpot(4,40), FlSpot(5,45)],
        ),
        LineChartBarData(
          isCurved: true,
          gradient: const LinearGradient(colors: [Colors.greenAccent, Colors.tealAccent]),
          barWidth: 5,
          belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: [Colors.greenAccent.withOpacity(0.4), Colors.tealAccent.withOpacity(0.1)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          spots: const [FlSpot(0,10), FlSpot(1,20), FlSpot(2,22), FlSpot(3,30), FlSpot(4,42), FlSpot(5,50)],
        ),
      ],
    ),
    duration: const Duration(milliseconds: 800),
    curve: Curves.easeInOutCubic,
  );
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 14, height: 14, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label, style: const TextStyle(fontSize: 13))
    ]);
  }
}
