import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../providers/app_state.dart';
import '../screens/chats_screen.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/search_screen.dart';

class BottomBarMenu extends StatefulWidget {
  const BottomBarMenu({Key? key}) : super(key: key);

  @override
  State<BottomBarMenu> createState() => _BottomBarMenuState();
}

class _BottomBarMenuState extends State<BottomBarMenu> {
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ChatsScreen(),
    const NotificationsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    int index = Provider.of<AppState>(context, listen: false).pageIndex;
    print(index);
    Color homeColor = index == 0 ? Colors.blue.shade800 : Colors.grey;
    Color searchColor = index == 1 ? Colors.blue.shade800 : Colors.grey;
    Color notifColor = index == 2 ? Colors.blue.shade800 : Colors.grey;
    Color chatsColor = index == 3 ? Colors.blue.shade800 : Colors.grey;

    return Consumer<AppState>(
      builder: (context, appState, child) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (index) {
            print(index);
            appState.setpageIndex = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => screens[index]));
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: homeColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: searchColor,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: notifColor,
              ),
              label: 'Notifications',
              tooltip: 'Balls',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: chatsColor,
              ),
              label: 'Chats',
            ),
          ],
        );
      },
    );
  }
}
