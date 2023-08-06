import 'package:aquafix/screens/report.dart';
import 'package:flutter/material.dart';

class UserReports extends StatefulWidget {
  const UserReports({super.key});

  @override
  State<UserReports> createState() => _UserReportsState();
}

class _UserReportsState extends State<UserReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 0, right: 30, bottom: 30),
            child: Expanded(
                child: Text(
              "Choose the fault",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            )),
          ),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              // mainAxisExtent: 200
            ),
            children: [
              Card(
                // color: Colors.yellowAccent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => const Report(title: "Leakage"));
                    Navigator.push(context, route);
                  },
                  splashColor: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          // height: 20,
                          "assets/images/leakage.png",
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Leakage",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                // color: Colors.purple,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => const Report(title: "No Water"));
                    Navigator.push(context, route);
                  },
                  splashColor: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          // height: 20,
                          "assets/images/water_not_flowing.png",
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Pipe not flowing",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                // color: Colors.green,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => const Report(title: "Burst Pipe"));
                    Navigator.push(context, route);
                  },
                  splashColor: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          // height: 20,
                          "assets/images/burst_pipe.png",
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Burst Pipe",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                // color: Colors.yellowAccent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => const Report(title: "Contaminated Water"));
                    Navigator.push(context, route);
                  },
                  splashColor: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          // height: 20,
                          "assets/images/contaminated_water.png",
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Contaminated",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                // color: Colors.yellowAccent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => const Report(title: "Other Repairs"));
                    Navigator.push(context, route);
                  },
                  splashColor: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: 50,
                        // width: 50,
                        padding: const EdgeInsets.all(30),
                        child: Image.asset(
                          // height: 20,
                          "assets/images/pipe_repairs.png",
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Other",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
