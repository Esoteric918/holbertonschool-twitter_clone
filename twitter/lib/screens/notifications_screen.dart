import 'package:flutter/material.dart';

import '../widgets/bottom_bar_menu.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('No Notifications available yet',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("When new notifications are found, they'll show up here",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ]),
          )),
      bottomNavigationBar: const BottomBarMenu(),
    );
  }
}
