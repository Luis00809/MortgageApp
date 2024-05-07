import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {
  final double principalPayment;
  final double interestPayment;
  final double pmiPayment;

  const DonutChart({
    super.key,
    required this.principalPayment,
    required this.interestPayment,
    required this.pmiPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                PieChart(PieChartData(
                    startDegreeOffset: 250,
                    sectionsSpace: 0,
                    centerSpaceRadius: 100,
                    sections: [
                      PieChartSectionData(
                        value: principalPayment,
                        color: Colors.greenAccent,
                        radius: 45,
                        showTitle: true,
                      ),
                      PieChartSectionData(
                        value: interestPayment,
                        color: Colors.grey.shade400,
                        radius: 45,
                        showTitle: true,
                      ),
                      PieChartSectionData(
                          value: pmiPayment,
                          color: Colors.red.shade900,
                          radius: 45,
                          showTitle: true)
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
