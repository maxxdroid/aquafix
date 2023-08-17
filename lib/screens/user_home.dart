import 'package:aquafix/widgets/drawer.dart';
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
        appBar: AppBar(
          elevation: 2,
            title: const Text("AquaFix.", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),),
            backgroundColor: Colors.lightBlueAccent.shade100,
            centerTitle: true),
            drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Your Bill for this month is "),
              ),
              Text(
                "GH₵ 90.00",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
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
                          // {'domain': 'Jan', 'measure': 8},
                          // {'domain': 'Feb', 'measure': 0.9},
                          {'domain': 'April', 'measure': 75},
                          {'domain': 'March', 'measure': 80},
                          {'domain': 'May', 'measure': 55},
                          {'domain': 'Jun', 'measure': 95},
                          {'domain': 'Jul', 'measure': 90},
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                    "The chart below chows your water conserved for the last four months"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 400,
                height: 240,
                child: Card(
                  elevation: 1,
                  child: DChartPie(
                    data: const [
                      {'domain': 'August', 'measure': 35},
                      {'domain': 'July', 'measure': 15},
                      {'domain': 'June', 'measure': 25},
                      {'domain': 'May', 'measure': 25},
                    ],
                    fillColor: (pieData, index) {
                      switch (pieData['domain']) {
                        case 'August':
                          return Colors.green;
                        case 'July':
                          return Colors.blueAccent;
                        case 'June':
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
              ),
            ],
          ),
        ));
  }
}
