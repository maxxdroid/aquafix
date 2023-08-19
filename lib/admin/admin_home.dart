import 'package:aquafix/admin/admin_reports.dart';
import 'package:aquafix/admin/admin_users.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _HomePageState();
}

class _HomePageState extends State<AdminHome> {

  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: pageIndex
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AdminReports(),
            AdminUserControl(),
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
            BottomNavigationBarItem(icon: Icon(Icons.report_rounded), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: 'Users'),
          ],
        ),
      )
    );
  }
}
