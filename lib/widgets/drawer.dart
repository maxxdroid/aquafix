import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Text(
            "Aquafix",
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.visible,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            "Home",
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.visible,
          ),
        ),
        const Divider(
          height: 10,
          color: Colors.white,
          thickness: 6.0,
        ),
        ListTile(
          leading: const Icon(
            Icons.home_filled,
            color: Colors.redAccent,
          ),
          title: const Text('Alerts'),
          onTap: () {},
        ),
        const Divider(
          height: 10,
          color: Colors.white,
          thickness: 6.0,
        ),
        ListTile(
          leading: const Icon(
            Icons.post_add_outlined,
            color: Colors.redAccent,
          ),
          title: const Text('Submitted Tips'),
          onTap: () {},
        ),
        const Divider(
          height: 10,
          color: Colors.white,
          thickness: 6.0,
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: Colors.redAccent,
          ),
          title: const Text('Submitted Tips'),
          onTap: () {},
        ),
      ],
    ));
  }
}
