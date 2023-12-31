import 'package:aquafix/functions/sharedpref.dart';
import 'package:aquafix/screens/submitted_reports.dart';
// import 'package:aquafix/screens/user_home.dart';
import 'package:aquafix/screens/user_reports.dart';
// import 'package:aquafix/screens/user_settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late String newid;

class _HomePageState extends State<HomePage> {

  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    onLaunch();
    setState(() {});
    pageController = PageController(
      initialPage: pageIndex
    );
  }

  

  onLaunch () async {
    newid = (await SharedPrefHelper().getUserID())!;
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            // UserHome(),
            UserReports(),
            SubmittedReports(),
            // UserSettings(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: ((index) {
            setState(() {
              pageIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          items: const [
            // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.report_rounded), label: 'Report Issue'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Reports'),
            // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            // BottomNavigationBarItem( icon: Icon(Icons.logout_outlined), label: 'Log Out')
          ],
        ),
      )
    );
  }
}
