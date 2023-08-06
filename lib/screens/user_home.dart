import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: 400,
              height: 300,
              child: DChartBar(
                data: const [
                  {
                    'id': 'Bar',
                    'data': [
                      {'domain': 'Jan', 'measure': 8},
                      {'domain': 'Feb', 'measure': 4},
                      {'domain': 'April', 'measure': 6},
                      {'domain': 'March', 'measure': 0.3},
                      {'domain': 'May', 'measure': 5},
                      {'domain': 'Jun', 'measure': 4.1},
                      {'domain': 'Jul', 'measure': 2},
                    ],
                  },
                ],
                domainLabelPaddingToAxisLine: 16,
                axisLineTick: 2,
                axisLinePointTick: 2,
                axisLinePointWidth: 10,
                axisLineColor: Colors.blue.shade400,
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => Colors.blue,
                showBarValue: true,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 400,
            height: 240,
            child: DChartPie(
                    data: const [
                      {'domain': 'Flutter', 'measure': 28},
                      {'domain': 'React Native', 'measure': 27},
                      {'domain': 'Ionic', 'measure': 20},
                      {'domain': 'Cordova', 'measure': 15},
                    ],
                    fillColor: (pieData, index) {
                      switch (pieData['domain']) {
                        case 'Flutter':
                          return Colors.blue;
                        case 'React Native':
                          return Colors.blueAccent;
                        case 'Ionic':
                          return Colors.lightBlue;
                        default:
                          return Colors.orange;
                      }
                    },
                    pieLabel: (pieData, index) {
                      return "${pieData['domain']}:\n${pieData['measure']}%";
                    },
                    labelPosition: PieLabelPosition.outside,
                  ),
          ),
          Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartGauge(
                    data:const  [
                      {'domain': 'Off', 'measure': 30},
                      {'domain': 'Warm', 'measure': 30},
                      {'domain': 'Hot', 'measure': 30},
                    ],
                    fillColor: (pieData, index) {
                      switch (pieData['domain']) {
                        case 'Off':
                          return Colors.green;
                        case 'Warm':
                          return Colors.orange;
                        default:
                          return Colors.red;
                      }
                    },
                    showLabelLine: false,
                    pieLabel: (pieData, index) {
                      return "${pieData['domain']}";
                    },
                    labelPosition: PieLabelPosition.inside,
                    labelPadding: 0,
                    labelColor: Colors.white,
                  ),
                ),
              ),
              ],
            ),
        ));
  }
}